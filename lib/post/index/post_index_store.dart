import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:mobx/mobx.dart';
import '../../app/app_config.dart';
import '../../app/app_service.dart';
import 'package:GopherImage/app/exceptions/http_exception.dart';
import '../post.dart';
part 'post_index_store.g.dart';

class PostIndexStore = _PostIndexStore with _$PostIndexStore;

abstract class _PostIndexStore with Store {
  _PostIndexStore({
    required this.appService,
    this.posts,
    this.layout = PostListLayout.stack,
    required this.scrollController,
    this.nextPage = 1,
    this.totalCount,
  }) {
    initReactions();
  }

  // ————————————————————————————————————————————————————————
  // 属性
  // ————————————————————————————————————————————————————————

  final AppService appService;

  List<Post> parsePosts(responseBody) {
    final List<Post> parsed = jsonDecode(responseBody)
        .map<Post>((item) => Post.fromJson(item))
        .toList();

    return parsed;
  }

  List<ReactionDisposer> reactionDisposers = [];

  ScrollController scrollController;

  double get scrollOffset => scrollController.offset;
  ScrollPosition get scrollPosition => scrollController.position;

  bool get touchDown =>
      scrollPosition.userScrollDirection == ScrollDirection.reverse &&
      !scrollPosition.outOfRange &&
      scrollOffset >= scrollPosition.maxScrollExtent - 500;

  // ————————————————————————————————————————————————————————
  // 数据：Observable
  // ————————————————————————————————————————————————————————
  @observable
  ObservableList<Post>? posts;

  @observable
  PostListLayout? layout;

  @observable
  bool loading = false;

  @observable
  String sort = 'latest';

  @observable
  int nextPage;

  @observable
  int? totalCount;

  // ————————————————————————————————————————————————————————
  // 计算：Computed
  // ————————————————————————————————————————————————————————
  @computed
  int get totalPages =>
      totalCount == null ? 0 : (totalCount! / AppConfig.postsPerPage).ceil();

  @computed
  bool get hasMore => totalPages - nextPage >= 0;

  // ————————————————————————————————————————————————————————
  // 动作：Action
  // ————————————————————————————————————————————————————————
  @action
  setPosts(List<Post> data) {
    if (nextPage == 1) {
      posts = ObservableList.of(data);
    } else {
      posts = ObservableList.of([...posts!, ...data]);
    }
  }

  @action
  setLayout(PostListLayout data) {
    layout = data;
  }

  @action
  setLoading(bool data) {
    loading = data;
  }

  @action
  setSort(String data) {
    nextPage = 1;
    sort = data;
  }

  @action
  setNextPage([int? data]) {
    if (data != null) {
      nextPage = data;
    } else {
      nextPage++;
    }
  }

  @action
  setTotalCount(String? data) {
    if (data != null) {
      totalCount = int.parse(data);
    }
  }

  @action
  reset() {
    nextPage = 1;
  }

  Future<List<Post>> getPosts() async {
    try {
      setLoading(true);

      final queryParameters = {
        'sort': sort,
      };

      final queryString = Uri(queryParameters: queryParameters).query;

      final uri = Uri.parse(
          '${AppConfig.apiBaseUrl}/posts?page=$nextPage&$queryString');
      final response = await appService.apiHttpClient.get(uri);
      final parsed = parsePosts(response.body);

      setPosts(parsed);
      setTotalCount(response.headers['x-total-count']);
      setNextPage();

      return parsed;
    } catch (e) {
      throw HttpException();
    } finally {
      setLoading(false);
    }
  }

  // ————————————————————————————————————————————————————————
  // 反应：Reaction
  // ————————————————————————————————————————————————————————

  storeLayoutWhenLayoutChanged() {
    return reaction(
      (_) => layout,
      (data) => AppStorage.setString(
        'postListLayout',
        data.toString(),
      ),
    );
  }

  getPostsWhereSortChanged() {
    return reaction((_) => sort, (_) => getPosts());
  }

  // 初始反应
  initReactions() {
    reactionDisposers.add(storeLayoutWhenLayoutChanged());
    reactionDisposers.add(getPostsWhereSortChanged());
  }

  // 取消反应
  disposeReactions() {
    reactionDisposers.forEach((disposer) => disposer());
  }
}
