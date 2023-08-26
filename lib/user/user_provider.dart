import 'package:provider/provider.dart';

import 'create/user_create_model.dart';

final userCreateProvider = ChangeNotifierProvider(
  create: (context) => UserCreateModel(),
);

final userProviders = [
  userCreateProvider,
];
