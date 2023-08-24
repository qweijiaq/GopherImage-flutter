import 'package:flutter/material.dart';

import '../post.dart';

class PostContent extends StatelessWidget {
  final Post post;

  PostContent({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(
        post.content!,
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w300,
          color: Theme.of(context).textTheme.bodySmall!.color,
        ),
      ),
    );
  }
}
