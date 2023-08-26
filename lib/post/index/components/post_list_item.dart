import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app/app_model.dart';
import '../../components/post_header.dart';
import '../../components/post_media.dart';
import '../../post.dart';
import '../../show/post_show_model.dart';
import '../post_index_model.dart';

class PostListItem extends StatelessWidget {
  final Post item;
  final PostListLayout layout;

  PostListItem({
    required this.item,
    this.layout = PostListLayout.stack,
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

    bool isPortrait = false;

    if (item.file!.width != null && item.file!.height != null) {
      isPortrait = item.file!.width! < item.file!.height!;
    }

    final aspectRatio = isPortrait ? 3 / 4 : 3 / 2;

    final postListItemMedia = Stack(
      fit: layout == PostListLayout.grid ? StackFit.expand : StackFit.loose,
      children: [
        AspectRatio(
          aspectRatio: aspectRatio,
          child: PostMedia(post: item),
        ),
        postListItemMediaMask,
      ],
    );

    final stackListItem = Container(
      padding: EdgeInsets.only(bottom: 16),
      child: Column(
        children: [
          postListItemMedia,
          SizedBox(
            height: 8,
          ),
          PostHeader(post: item),
        ],
      ),
    );

    final gridListItem = Container(
      child: postListItemMedia,
    );

    Widget postListItem = stackListItem;

    if (layout == PostListLayout.grid) {
      postListItem = gridListItem;
    }

    return postListItem;
  }
}
