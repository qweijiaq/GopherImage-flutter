import 'package:GopherImage/app/components/app_logo.dart';
import 'package:flutter/material.dart';

class AppPageBottom extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int>? onTap;

  AppPageBottom({
    this.onTap,
    this.currentIndex = 0,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      onTap: onTap,
      items: [
        BottomNavigationBarItem(
          icon: AppLogo(size: 21),
          activeIcon: AppLogo(
            size: 21,
            variation: 'alt',
            color: Theme.of(context).primaryColor,
          ),
          label: '发现',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_a_photo_outlined),
          activeIcon: Icon(Icons.add_a_photo),
          label: '添加',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.account_circle_outlined),
          activeIcon: Icon(Icons.account_circle),
          label: '用户',
        ),
      ],
    );
  }
}
