// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_index_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PostIndexStore on _PostIndexStore, Store {
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
  String toString() {
    return '''
posts: ${posts},
layout: ${layout}
    ''';
  }
}
