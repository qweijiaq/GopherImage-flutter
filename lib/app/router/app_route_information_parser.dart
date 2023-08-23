import 'package:GopherImage/app/router/app_route_configuration.dart';
import 'package:flutter/material.dart';

class AppRouterInformationParser
    extends RouteInformationParser<AppRouteConfiguration> {
  // 解析路由信息
  @override
  parseRouteInformation(routeInformation) async {
    print('解析路由信息');
    print(routeInformation.location);
    if (routeInformation.location == '/about') {
      return AppRouteConfiguration.about();
    }

    return AppRouteConfiguration.home();
  }

  // 恢复路由信息
  @override
  restoreRouteInformation(configuration) {
    if (configuration.isHomePage) {
      return RouteInformation(location: '/');
    }

    if (configuration.isAboutPage) {
      return RouteInformation(location: '/about');
    }

    return null;
  }
}
