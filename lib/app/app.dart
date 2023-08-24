import 'package:GopherImage/app/app_model.dart';
import 'package:GopherImage/app/auth/auth_model.dart';
import 'package:GopherImage/app/router/app_route_information_parser.dart';
import 'package:GopherImage/app/router/app_router_delegate.dart';
import 'package:GopherImage/post/show/post_show_model.dart';
import 'package:flutter/material.dart';
import 'package:GopherImage/app/themes/app_theme.dart';
import 'package:provider/provider.dart';

class App extends StatefulWidget {
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final AppModel appModel = AppModel();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthModel>(create: (context) => AuthModel()),
        ChangeNotifierProvider<AppModel>(create: (context) => appModel),
        ChangeNotifierProvider<PostShowModel>(
            create: (context) => PostShowModel()),
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
