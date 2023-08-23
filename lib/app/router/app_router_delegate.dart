import 'package:GopherImage/app/app_model.dart';
import 'package:GopherImage/app/router/app_route_configuration.dart';
import 'package:flutter/material.dart';

import '../../playground/routing/components/about.dart';
import '../components/app_home.dart';

class AppRouterDelegate extends RouterDelegate<AppRouteConfiguration>
    with ChangeNotifier, PopNavigatorRouterDelegateMixin {
  final _navigatorKey;
  final AppModel appModel;

  AppRouterDelegate(this.appModel)
      : _navigatorKey = GlobalKey<NavigatorState>() {
    // 监听 appModel
    appModel.addListener(notifyListeners);
  }

  // 销毁资源
  @override
  void dispose() {
    super.dispose();
  }

  // 获取 Navigator 使用的 key
  @override
  get navigatorKey => _navigatorKey;

  // 设置新路由地址
  @override
  setNewRoutePath(configuration) async {
    print('设置新路由地址');
    print(configuration.pageName);

    if (configuration.isHomePage) {
      appModel.setPageName('');
    }

    if (configuration.isAboutPage) {
      appModel.setPageName('About');
    }
  }

  // 当前路由配置
  @override
  get currentConfiguration {
    if (appModel.pageName == '') {
      return AppRouteConfiguration.home();
    }

    if (appModel.pageName == 'About') {
      return AppRouteConfiguration.about();
    }

    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Navigator(
      // key: _navigatorKey,
      pages: [
        MaterialPage(
          key: ValueKey('AppHome'),
          child: AppHome(),
        ),
        if (appModel.pageName == 'About')
          MaterialPage(
            key: ValueKey('About'),
            child: About(),
          ),
      ],
      onPopPage: (route, result) {
        if (!route.didPop(result)) {
          return false;
        }
        appModel.setPageName('');
        return true;
      },
    );
  }
}
