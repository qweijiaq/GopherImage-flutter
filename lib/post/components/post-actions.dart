import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
// import 'package:provider/provider.dart';

import '../../app/digg/create/digg_create_model.dart';
import '../../app/digg/destroy/digg_destroy_model.dart';
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
    final diggCreateModel = context.watch<DiggCreateModel>();
    final diggedestroyModel = context.watch<DiggDestroyModel>();

    onTapDiggAction() async {
      if (post.digged == 0) {
        try {
          await diggCreateModel.createUserDiggPost(post.id!);
          digged();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)),
          );
        }
      } else {
        try {
          await diggedestroyModel.deleteUserDiggPost(post.id!);
          undigged();
        } on HttpException catch (e) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(e.message)),
          );
        }
      }
    }

    final diggAction = Row(
      children: [
        GestureDetector(
          child: Icon(post.digged == 0
              ? Icons.favorite_border_outlined
              : Icons.favorite),
          onTap: onTapDiggAction,
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
          diggAction,
          SizedBox(width: 16),
          commentAction,
        ],
      ),
    );
  }
}
