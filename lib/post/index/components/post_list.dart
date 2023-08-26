import 'package:GopherImage/app/app_service.dart';
import 'package:GopherImage/post/index/components/post_grid_list.dart';
import 'package:GopherImage/post/index/components/post_stack_list.dart';
import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../post.dart';

class PostList extends StatefulWidget {
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  restoreLayout() async {
    final data = await AppStorage.getString('postListLayout');

    if (data != null) {
      PostListLayout layout = PostListLayout.values.firstWhere((item) {
        return item.toString() == data;
      });

      context.read<PostIndexStore>().setLayout(layout);
    }
  }

  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PostIndexStore>().reset();
      context.read<PostIndexStore>().getPosts();
    });

    // 恢复布局
    restoreLayout();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final postIndexStore = context.read<PostIndexStore>();
      final List<Post> posts = postIndexStore.posts ?? [];
      final layout = postIndexStore.layout;

      // model.posts!.forEach((post) {
      //   print(post.toJson());
      // });

      final stackList = PoststackList(posts: posts);

      final gridList = PostGridList(posts: posts);

      Widget postList = stackList;

      if (layout == PostListLayout.grid) {
        postList = gridList;
      }

      return postList;
    });
  }
}
