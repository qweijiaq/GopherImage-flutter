import 'package:GopherImage/app/header/components/app_header_search.dart';
import 'package:GopherImage/app/header/components/app_header_title.dart';
import 'package:GopherImage/app/header/components/app_header_user.dart';
import 'package:flutter/material.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      floating: true,
      elevation: 30,
      title: AppHeaderTitle(),
      actions: [
        AppHeaderSearch(),
        AppHeaderUser(),
      ],
    );
  }
}
