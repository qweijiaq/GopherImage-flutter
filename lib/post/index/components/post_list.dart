import 'package:GopherImage/app/app_service.dart';
import 'package:GopherImage/post/index/components/post_list_item.dart';
import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../post.dart';

class PostList extends StatefulWidget {
  final String? sort;

  PostList({this.sort});

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
      context.read<PostIndexStore>().getPosts(sort: widget.sort ?? 'latest');
    });

    // 恢复布局
    restoreLayout();
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final postIndexStore = context.read<PostIndexStore>();
      final posts = postIndexStore.posts ?? [];
      final layout = postIndexStore.layout;

      final noContent = Center(
        child: Container(
          child: Text('暂无内容'),
        ),
      );

      // model.posts!.forEach((post) {
      //   print(post.toJson());
      // });

      final stackList = ListView.builder(
        itemCount: posts.length,
        itemBuilder: (context, index) {
          return PostListItem(item: posts[index]);
        },
      );

      final gridList = GridView.builder(
        itemCount: posts.length,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 16,
          mainAxisSpacing: 16,
        ),
        itemBuilder: (context, index) {
          return PostListItem(
            item: posts[index],
            layout: PostListLayout.grid,
          );
        },
      );

      Widget postList = stackList;

      if (layout == PostListLayout.grid) {
        postList = gridList;
      }

      return posts.length == 0 ? noContent : postList;
    });
  }
}
