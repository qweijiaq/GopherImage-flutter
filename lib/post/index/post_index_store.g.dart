// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_index_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostIndexStore on _PostIndexStore, Store {
  Computed<int>? _$totalPagesComputed;

  @override
  int get totalPages =>
      (_$totalPagesComputed ??= Computed<int>(() => super.totalPages,
              name: '_PostIndexStore.totalPages'))
          .value;
  Computed<bool>? _$hasMoreComputed;

  @override
  bool get hasMore => (_$hasMoreComputed ??=
          Computed<bool>(() => super.hasMore, name: '_PostIndexStore.hasMore'))
      .value;

  late final _$postsAtom =
      Atom(name: '_PostIndexStore.posts', context: context);

  @override
  ObservableList<Post>? get posts {
    _$postsAtom.reportRead();
    return super.posts;
  }

  @override
  set posts(ObservableList<Post>? value) {
    _$postsAtom.reportWrite(value, super.posts, () {
      super.posts = value;
    });
  }

  late final _$layoutAtom =
      Atom(name: '_PostIndexStore.layout', context: context);

  @override
  PostListLayout? get layout {
    _$layoutAtom.reportRead();
    return super.layout;
  }

  @override
  set layout(PostListLayout? value) {
    _$layoutAtom.reportWrite(value, super.layout, () {
      super.layout = value;
    });
  }

  late final _$loadingAtom =
      Atom(name: '_PostIndexStore.loading', context: context);

  @override
  bool get loading {
    _$loadingAtom.reportRead();
    return super.loading;
  }

  @override
  set loading(bool value) {
    _$loadingAtom.reportWrite(value, super.loading, () {
      super.loading = value;
    });
  }

  late final _$sortAtom = Atom(name: '_PostIndexStore.sort', context: context);

  @override
  String get sort {
    _$sortAtom.reportRead();
    return super.sort;
  }

  @override
  set sort(String value) {
    _$sortAtom.reportWrite(value, super.sort, () {
      super.sort = value;
    });
  }

  late final _$nextPageAtom =
      Atom(name: '_PostIndexStore.nextPage', context: context);

  @override
  int get nextPage {
    _$nextPageAtom.reportRead();
    return super.nextPage;
  }

  @override
  set nextPage(int value) {
    _$nextPageAtom.reportWrite(value, super.nextPage, () {
      super.nextPage = value;
    });
  }

  late final _$totalCountAtom =
      Atom(name: '_PostIndexStore.totalCount', context: context);

  @override
  int? get totalCount {
    _$totalCountAtom.reportRead();
    return super.totalCount;
  }

  @override
  set totalCount(int? value) {
    _$totalCountAtom.reportWrite(value, super.totalCount, () {
      super.totalCount = value;
    });
  }

  late final _$_PostIndexStoreActionController =
      ActionController(name: '_PostIndexStore', context: context);

  @override
  dynamic setPosts(List<Post> data) {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.setPosts');
    try {
      return super.setPosts(data);
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLayout(PostListLayout data) {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.setLayout');
    try {
      return super.setLayout(data);
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setLoading(bool data) {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.setLoading');
    try {
      return super.setLoading(data);
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setSort(String data) {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.setSort');
    try {
      return super.setSort(data);
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setNextPage([int? data]) {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.setNextPage');
    try {
      return super.setNextPage(data);
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic setTotalCount(String? data) {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.setTotalCount');
    try {
      return super.setTotalCount(data);
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic reset() {
    final _$actionInfo = _$_PostIndexStoreActionController.startAction(
        name: '_PostIndexStore.reset');
    try {
      return super.reset();
    } finally {
      _$_PostIndexStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
posts: ${posts},
layout: ${layout},
loading: ${loading},
sort: ${sort},
nextPage: ${nextPage},
totalCount: ${totalCount},
totalPages: ${totalPages},
hasMore: ${hasMore}
    ''';
  }
}
