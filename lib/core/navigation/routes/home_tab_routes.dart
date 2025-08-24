import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/navigation/app_router.gr.dart';
import 'package:crypto_app/core/navigation/routes/paths/navigation_path_home.dart';

final homeTabRoute = AutoRoute(
  path: NavigationPathsHome.homeTabSegment,
  page: HomeTabRoute.page,
  children: [
    AutoRoute(path: '', page: HomeScreenRoute.page),
    AutoRoute(path: 'coin', page: CoinScreenRoute.page),
  ],
);
