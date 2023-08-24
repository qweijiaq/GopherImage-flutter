import 'package:GopherImage/post/index/components/post_list.dart';
import 'package:flutter/material.dart';

class PostIndexLatest extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: PostList(),
    );
  }
}
