import 'package:GopherImage/post/index/post_index_store.dart';
import 'package:GopherImage/post/show/post_show_model.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app/app_service.dart';
import 'create/post_create_model.dart';

final postShowProvider = ChangeNotifierProvider<PostShowModel>(
  create: (context) => PostShowModel(),
);

final postIndexStoreProvider = ProxyProvider<AppService, PostIndexStore>(
  update: (context, appService, postIndexStore) {
    ScrollController scrollController;
    if (postIndexStore?.scrollController == null) {
      scrollController = ScrollController();
    } else {
      scrollController = postIndexStore!.scrollController;
    }
    return PostIndexStore(
      appService: appService,
      posts: postIndexStore?.posts,
      layout: postIndexStore?.layout,
      scrollController: scrollController,
    );
  },
);

final postCreateProvider =
    ChangeNotifierProxyProvider<AppService, PostCreateModel>(
  create: (context) => PostCreateModel(appService: context.read<AppService>()),
  update: (context, appService, postCreateModel) {
    return PostCreateModel(
      appService: appService,
    );
  },
);

final postProviders = [
  postShowProvider,
  postIndexStoreProvider,
  postCreateProvider,
];
