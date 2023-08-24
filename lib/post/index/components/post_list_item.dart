import 'package:GopherImage/post/components/post_header.dart';
import 'package:GopherImage/post/components/post_media.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_model.dart';
import '../../post.dart';
import '../../show/post_show_model.dart';

class PostListItem extends StatelessWidget {
  final Post item;

  PostListItem({
    required this.item,
  });

  @override
  Widget build(BuildContext context) {
    final appModel = context.read<AppModel>();
    final postShowModel = context.read<PostShowModel>();

    final postListItemMediaMask = Positioned.fill(
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          splashColor: Colors.deepPurpleAccent.withOpacity(0.3),
          onTap: () {
            appModel.setPageName('PostShow');
            appModel.setResourceId('${item.id}');
            postShowModel.setPost(item);
          },
        ),
      ),
    );

    final postListItemMedia = Stack(
      children: [
        PostMedia(post: item),
        postListItemMediaMask,
      ],
    );

    return Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          postListItemMedia,
          PostHeader(post: item),
        ],
      ),
    );
  }
}
