import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:GopherImage/post/post.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class PostListLayoutSwitcher extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Observer(
        builder: (context) {
          final postIndexStore = context.read<PostIndexStore>();
          final layout = postIndexStore.layout;
          final setLayout = postIndexStore.setLayout;

          final stackIcon = layout == PostListLayout.stack
              ? Icon(Icons.view_agenda)
              : Icon(Icons.view_agenda_outlined);

          final gridIcon = layout == PostListLayout.grid
              ? Icon(Icons.auto_awesome_mosaic)
              : Icon(Icons.auto_awesome_mosaic_outlined);

          return Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              GestureDetector(
                child: stackIcon,
                onTap: () => setLayout(PostListLayout.stack),
              ),
              SizedBox(width: 8),
              GestureDetector(
                child: gridIcon,
                onTap: () => setLayout(PostListLayout.grid),
              ),
            ],
          );
        },
      ),
    );
  }
}
