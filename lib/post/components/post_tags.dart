import 'package:flutter/material.dart';

import '../post.dart';

class PostTags extends StatelessWidget {
  final List<PostTag> tags;

  PostTags({
    required this.tags,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        spacing: 8,
        children: tags.map((tag) {
          return Chip(label: Text(tag.name!));
        }).toList(),
      ),
    );
  }
}
