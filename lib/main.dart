import 'package:crypto_app/core/navigation/app_router.dart';
import 'package:crypto_app/features/app_lunch/di/app_launch_module.dart';
import 'package:flutter/material.dart';

final navigatorKey = GlobalKey<NavigatorState>();
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AppLaunchModule().initialise(); // Setup Service Locator
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});
  final _appRouter = AppRouter(navigatorKey: navigatorKey);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _appRouter.config(),
    );
  }
}
