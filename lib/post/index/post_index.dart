import 'package:GopherImage/app/components/app_move_to_top.dart';
import 'package:GopherImage/app/header/app_header.dart';
import 'package:GopherImage/app/toolbar/app_toolbar.dart';
import 'package:GopherImage/post/index/components/post_list.dart';
import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostIndex extends StatefulWidget {
  @override
  State<PostIndex> createState() => _PostIndexState();
}

class _PostIndexState extends State<PostIndex> {
  late PostIndexStore store;

  onScroll() {
    if (store.touchDown && store.hasMore && !store.loading) {
      store.getPosts();
    }
  }

  @override
  void initState() {
    super.initState();
    store = context.read<PostIndexStore>();
    store.scrollController.addListener(onScroll);
  }

  @override
  void dispose() {
    super.dispose();
    store.scrollController.removeListener(onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      controller: store.scrollController,
      slivers: [
        AppHeader(),
        AppToolbar(),
        PostList(),
        AppMoveToTop(store.scrollController),
      ],
    );
  }
}
