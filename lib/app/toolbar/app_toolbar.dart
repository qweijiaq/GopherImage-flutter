import 'package:GopherImage/app/toolbar/components/post_index_menu.dart';
import 'package:GopherImage/app/toolbar/components/post_list_layout_switcher.dart';
import 'package:flutter/material.dart';

class AppToolbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Widget? primary;
    primary = PostIndexMenu();

    Widget? secondary;
    secondary = PostListLayoutSwitcher();

    return SliverToBoxAdapter(
      child: Container(
        child: Column(
          children: [
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 24),
              child: primary,
            ),
            Container(
              alignment: Alignment.bottomRight,
              padding: EdgeInsets.only(right: 8),
              child: secondary,
            ),
          ],
        ),
      ),
    );
  }
}
