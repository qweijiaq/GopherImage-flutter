import 'package:provider/provider.dart';

import 'app_service.dart';
import 'auth/auth_model.dart';

final appServiceProvider = ChangeNotifierProxyProvider<AuthModel, AppService>(
  create: (context) => AppService(authModel: context.read<AuthModel>()),
  update: (context, authModel, appService) => AppService(authModel: authModel),
);

final appProviders = [
  appServiceProvider,
];
