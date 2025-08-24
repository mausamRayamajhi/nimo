import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/navigation/app_router.gr.dart';
import 'package:crypto_app/core/navigation/observers/navigator_obervers.dart';
import 'package:crypto_app/core/navigation/router_screens/home_router_screen.dart';
import 'package:flutter/material.dart';

part 'home_tab_navigator.dart';

class AppNavigator {
  static HomeTabNavigator homeTab = HomeTabNavigator();


  static bool shouldNavigateToPreviousTab = false;

  /// The TabBackButton uses this func to go back.
  static void goBack(BuildContext context) {
    Navigator.maybePop(context);
    if (shouldNavigateToPreviousTab) {
      final tabIndex = NavigatorObservers.previousTabIndex;
      context.tabsRouter.setActiveIndex(tabIndex);
    }
    shouldNavigateToPreviousTab = false;
  }
}

class _FTNavigator {
  RoutingController? findAppScreenTabsRouter(BuildContext context) {
    return context.router.root.innerRouterOf(AppScreenRoute.name);
  }
}
