import 'package:GopherImage/post/components/post_header.dart';
import 'package:GopherImage/post/components/post_media.dart';
import 'package:flutter/material.dart';

import '../../post.dart';

class PostListItem extends StatelessWidget {
  final Post item;

  PostListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          PostMedia(post: item),
          PostHeader(post: item),
        ],
      ),
    );
  }
}
