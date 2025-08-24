part of 'app_navigator.dart';

class HomeTabNavigator extends _FTNavigator {
  void toHomeTab(BuildContext context, {String? tabID}) {
    findAppScreenTabsRouter(
      context,
    )?.navigate(HomeTabRoute(children: [HomeScreenRoute()]));
  }

  void navigateToCoinScreen(BuildContext context, {required String coinID}) {
    findAppScreenTabsRouter(
      context,
    )?.navigate(CoinScreenRoute(children: [HomeScreenRoute()], coinId: coinID));
  }

  void popUntilRoot() {
    try {
      final nestedRouter =
          HomeRouterScreen.homeRouterKey.currentState?.controller;
      nestedRouter?.popUntilRoot();
    } on Exception {
      //TODO [Family Tree] : We can send logs to login system
      print("Exception in Home Tab Navigator : popUntilRoot()");
    }
  }
}
