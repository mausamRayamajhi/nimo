import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

class HomeRouterScreen extends AutoRouter {
  static final homeRouterKey = GlobalKey<AutoRouterState>();

  HomeRouterScreen() : super(key: homeRouterKey);
}

@RoutePage(name: 'HomeTabRoute')
class HomeWrapperPage extends StatelessWidget {
  const HomeWrapperPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HomeRouterScreen();
  }
}
