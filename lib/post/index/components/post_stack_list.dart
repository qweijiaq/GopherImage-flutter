import 'package:GopherImage/post/index/components/post_list_item.dart';
import 'package:flutter/material.dart';

import '../../post.dart';

class PoststackList extends StatelessWidget {
  final List<Post> posts;

  PoststackList({required this.posts});

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: EdgeInsets.all(8),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            return PostListItem(item: posts[index]);
          },
          childCount: posts.length,
        ),
      ),
    );
  }
}
