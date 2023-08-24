import 'package:GopherImage/post/index/components/post_list_item.dart';
import 'package:GopherImage/post/index/post_index_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class PostList extends StatefulWidget {
  @override
  State<PostList> createState() => _PostListState();
}

class _PostListState extends State<PostList> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<PostIndexModel>().getPosts();
    });
  }

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PostIndexModel>();
    final posts = model.posts ?? [];

    final noContent = Center(
      child: Container(
        child: Text('暂无内容'),
      ),
    );

    // model.posts!.forEach((post) {
    //   print(post.toJson());
    // });

    final list = ListView.builder(
      itemCount: posts.length,
      itemBuilder: (context, index) {
        return PostListItem(item: posts[index]);
      },
    );

    return posts.length == 0 ? noContent : list;
  }
}
