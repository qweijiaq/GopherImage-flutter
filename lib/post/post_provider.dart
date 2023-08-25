import 'package:GopherImage/post/show/post_show_model.dart';
import 'package:provider/provider.dart';

import '../app/app_service.dart';
import 'index/post_index_model.dart';

final postShowProvider = ChangeNotifierProvider<PostShowModel>(
  create: (context) => PostShowModel(),
);

final postIndexProvider =
    ChangeNotifierProxyProvider<AppService, PostIndexModel>(
  create: (context) => PostIndexModel(appService: context.read<AppService>()),
  update: (context, appService, postIndexModel) {
    return PostIndexModel(
      appService: appService,
      posts: postIndexModel?.posts,
      layout: postIndexModel?.layout,
    );
  },
);

// final postCreateProvider =
//     ChangeNotifierProxyProvider<AppService, PostCreateModel>(
//   create: (context) => PostCreateModel(appService: context.read<AppService>()),
//   update: (context, appService, postCreateModel) {
//     return PostCreateModel(
//       appService: appService,
//     );
//   },
// );

final postProviders = [
  postShowProvider,
  postIndexProvider,
  // postCreateProvider,
];
