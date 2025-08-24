import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/navigation/app_router.gr.dart';
import 'package:flutter/widgets.dart';

class NavigatorObservers extends AutoRouterObserver {
  static const String screenName = 'Screen Name';
  static int previousTabIndex = 0;

  @override
  void didPush(Route route, Route? previousRoute) {
    printScreenName(route);
  }

  @override
  void didChangeTabRoute(TabPageRoute route, TabPageRoute previousRoute) {
    printScreenNameByTabPageRoute(route);
    previousTabIndex = previousRoute.index;
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    if (previousRoute != null) {
      printScreenName(previousRoute);
    }
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {}

  void printScreenName(Route<dynamic> route) {
    if (route.settings is AutoRoutePage &&
        route.settings.name != null &&
        route.settings.name != AppScreenRoute.name) {
      final String name = getScreenName(route.settings.name!);
    }
  }

  void printScreenNameByTabPageRoute(TabPageRoute route) {
    if (route.routeInfo.name != AppScreenRoute.name) {
      final String name = getScreenName(route.routeInfo.name);
    }
  }

  String getScreenName(String name) {
    final String originalName = name;
    if (name.toLowerCase().contains('route')) {
      name = name.toLowerCase().replaceAll('route', '');
      name = originalName.substring(0, name.length);
    }
    return name;
  }
}
