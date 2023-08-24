import 'package:GopherImage/post/components/post-actions.dart';
import 'package:flutter/material.dart';

import '../../user/components/user_avatar.dart';
import '../post.dart';

class PostHeader extends StatelessWidget {
  final Post post;

  PostHeader({
    required this.post,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          UserAvatar(
            user: post.user!,
          ),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  post.title!,
                  style: Theme.of(context).textTheme.titleLarge,
                ),
                Text(
                  post.user!.name!,
                ),
              ],
            ),
          ),
          PostActions(post: post),
        ],
      ),
    );
  }
}
