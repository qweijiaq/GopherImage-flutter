import 'package:provider/provider.dart';

import '../app_service.dart';
import 'create/digg_create_model.dart';
import 'destroy/digg_destroy_model.dart';

final diggCreateProvider =
    ChangeNotifierProxyProvider<AppService, DiggCreateModel>(
  create: (context) => DiggCreateModel(
    appService: context.read<AppService>(),
  ),
  update: (context, appService, likeCreateModel) =>
      DiggCreateModel(appService: appService),
);

final diggDestroyProvider =
    ChangeNotifierProxyProvider<AppService, DiggDestroyModel>(
  create: (context) => DiggDestroyModel(
    appService: context.read<AppService>(),
  ),
  update: (context, appService, diggCreateModel) =>
      DiggDestroyModel(appService: appService),
);

final diggProviders = [
  diggCreateProvider,
  diggDestroyProvider,
];
