import 'package:GopherImage/app/app_model.dart';
import 'package:GopherImage/app/app_service.dart';
import 'package:GopherImage/app/digg/digg_provider.dart';
import 'package:GopherImage/app/router/app_route_information_parser.dart';
import 'package:GopherImage/app/router/app_router_delegate.dart';
import 'package:GopherImage/post/post_provider.dart';
import 'package:GopherImage/user/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:GopherImage/app/themes/app_theme.dart';
import 'package:provider/provider.dart';

import 'app_provider.dart';
import 'auth/auth.dart';
import 'auth/auth_model.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppModel appModel = AppModel();
  final AuthModel authModel = AuthModel();

  bool initializing = true;

  initialize() async {
    final data = await AppStorage.getMap('auth');

    if (data != null) {
      final auth = Auth.fromJson(data);

      authModel.setAuth(auth);
    }

    setState(() {
      initializing = false;
    });
  }

  @override
  void initState() {
    super.initState();
    initialize();
  }

  @override
  Widget build(BuildContext context) {
    if (initializing) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        home: Scaffold(
          body: Center(
            child: Text('初始化...'),
          ),
        ),
      );
    }
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: authModel),
        ChangeNotifierProvider.value(value: appModel),
        ...appProviders,
        ...postProviders,
        ...diggProviders,
        ...userProviders,
      ],
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        theme: AppTheme.light,
        darkTheme: AppTheme.dark,
        routerDelegate: AppRouterDelegate(appModel),
        routeInformationParser: AppRouterInformationParser(),
      ),
    );
  }
}
