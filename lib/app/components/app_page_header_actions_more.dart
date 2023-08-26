import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../post/post.dart';

class AppPageHeaderActionsMore extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postIndexStore = context.read<PostIndexStore>();

    return PopupMenuButton(
      icon: Icon(Icons.more_horiz),
      offset: Offset(0, 50),
      onCanceled: () {
        print('popupMenuButton: onCanceled');
      },
      onSelected: (PostListLayout value) {
        postIndexStore.setLayout(value);
        print('popupMenuButton: onSelected $value');
      },
      itemBuilder: (context) => [
        PopupMenuItem(
          child: Icon(
            Icons.view_agenda_outlined,
            color: postIndexStore.layout == PostListLayout.stack
                ? Theme.of(context).primaryColor
                : null,
          ),
          value: PostListLayout.stack,
        ),
        PopupMenuItem(
          child: Icon(
            Icons.grid_view,
            color: postIndexStore.layout == PostListLayout.grid
                ? Theme.of(context).primaryColor
                : null,
          ),
          value: PostListLayout.grid,
        ),
      ],
    );
  }
}
