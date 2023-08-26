import 'dart:convert';

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

  // ————————————————————————————————————————————————————————
  // 计算：Computed
  // ————————————————————————————————————————————————————————

  // ————————————————————————————————————————————————————————
  // 动作：Action
  // ————————————————————————————————————————————————————————
  @action
  setPosts(List<Post> data) {
    posts = ObservableList.of(data);
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
    sort = data;
  }

  Future<List<Post>> getPosts() async {
    try {
      setLoading(true);
      final uri = Uri.parse('${AppConfig.apiBaseUrl}/posts?sort=$sort');
      final response = await appService.apiHttpClient.get(uri);
      final parsed = parsePosts(response.body);

      setPosts(parsed);

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