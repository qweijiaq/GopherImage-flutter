import 'package:GopherImage/app/header/app_header.dart';
import 'package:GopherImage/app/toolbar/app_toolbar.dart';
import 'package:GopherImage/post/index/components/post_list.dart';
import 'package:flutter/material.dart';

class PostIndex extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: [
        AppHeader(),
        AppToolbar(),
        PostList(),
      ],
    );
  }
}
