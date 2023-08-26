import 'package:GopherImage/playground/playground.dart';
import 'package:GopherImage/post/create/post_create.dart';
import 'package:GopherImage/post/index/post_index.dart';
import 'package:GopherImage/user/profile/user_profile.dart';
import 'package:flutter/material.dart';

class AppPageMain extends StatelessWidget {
  final int currentIndex;

  AppPageMain({this.currentIndex = 0});

  // 一组页面主体小部件
  final pageMain = [
    // 发现
    PostIndex(),

    // 添加
    PostCreate(),

    // 用户
    UserProfile(),

    // 练习
    Playground()
  ];

  @override
  Widget build(BuildContext context) {
    return pageMain.elementAt(currentIndex);
  }
}
