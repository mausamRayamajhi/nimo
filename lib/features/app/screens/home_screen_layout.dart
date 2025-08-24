import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/navigation/app_router.gr.dart';
import 'package:flutter/material.dart';

@RoutePage()
class HomeScreenLayout extends StatelessWidget {
  const HomeScreenLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return AutoTabsRouter(
      duration: const Duration(),
      lazyLoad: false,
      routes: const [
        HomeScreenRoute(),
        // Add other tab routes here, like WatchlistRoute(), etc.
      ],
      builder: (context, child) {
        // final tabsRouter = AutoTabsRouter.of(context);
        return Scaffold(body: child);
      },
    );
  }
}
