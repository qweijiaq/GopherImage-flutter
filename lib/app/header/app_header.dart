import 'package:GopherImage/app/header/components/app_header_search.dart';
import 'package:GopherImage/app/header/components/app_header_title.dart';
import 'package:GopherImage/app/header/components/app_header_user.dart';
import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class AppHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postIndexStore = context.read<PostIndexStore>();

    onStretchTrigger() async {
      postIndexStore.reset();
      WidgetsBinding.instance.addPostFrameCallback(
        (_) => postIndexStore.getPosts(),
      );
    }

    return SliverAppBar(
      floating: true,
      elevation: 30,
      stretch: true,
      stretchTriggerOffset: 60,
      onStretchTrigger: onStretchTrigger,
      title: AppHeaderTitle(),
      actions: [
        AppHeaderSearch(),
        AppHeaderUser(),
      ],
    );
  }
}
