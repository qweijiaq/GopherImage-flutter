import 'package:flutter/material.dart';
// import 'package:provider/provider.dart';

import '../post.dart';

class PostActions extends StatelessWidget {
  final Post post;

  PostActions({
    required this.post,
  });

  increasetotalDiggs() {
    post.totalDiggs = post.totalDiggs! + 1;
  }

  decreasetotalDiggs() {
    post.totalDiggs = post.totalDiggs != 0 ? post.totalDiggs! - 1 : 0;
  }

  digged() {
    post.digged = 1;
    increasetotalDiggs();
  }

  undigged() {
    post.digged = 0;
    decreasetotalDiggs();
  }

  @override
  Widget build(BuildContext context) {
    // final likeCreateModel = context.watch<LikeCreateModel>();
    // final diggedestroyModel = context.watch<diggedestroyModel>();

    // onTapLikeAction() async {
    //   if (post.digged == 0) {
    //     try {
    //       await likeCreateModel.createUserLikePost(post.id!);
    //       digged();
    //     } on HttpException catch (e) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(e.message)),
    //       );
    //     }
    //   } else {
    //     try {
    //       await diggedestroyModel.deleteUserLikePost(post.id!);
    //       undigged();
    //     } on HttpException catch (e) {
    //       ScaffoldMessenger.of(context).showSnackBar(
    //         SnackBar(content: Text(e.message)),
    //       );
    //     }
    //   }
    // }

    final likeAction = Row(
      children: [
        GestureDetector(
          child: Icon(post.digged == 0
              ? Icons.favorite_border_outlined
              : Icons.favorite),
          // onTap: onTapLikeAction,
        ),
        if (post.totalDiggs != 0)
          Container(
            padding: EdgeInsets.only(left: 4),
            child: Text('${post.totalDiggs}'),
          ),
      ],
    );

    final commentAction = Row(
      children: [
        Icon(Icons.comment_outlined),
        if (post.totalComments != 0)
          Container(
            padding: EdgeInsets.only(left: 4),
            child: Text('${post.totalComments}'),
          ),
      ],
    );

    return Container(
      child: Row(
        children: [
          likeAction,
          SizedBox(width: 16),
          commentAction,
        ],
      ),
    );
  }
}
