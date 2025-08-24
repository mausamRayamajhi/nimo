import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/core/navigation/routes/home_tab_routes.dart';
import 'package:crypto_app/core/navigation/routes/paths/navigation_paths.dart';
import 'package:crypto_app/core/navigation/app_router.gr.dart';
@AutoRouterConfig(replaceInRouteName: '')
class AppRouter extends RootStackRouter {
  AppRouter({super.navigatorKey});

  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: NavigationPathsTopLevel.appPath,
          page: AppScreenRoute.page,
          children: [
            homeTabRoute,
          ],
        ),
      ];
}
