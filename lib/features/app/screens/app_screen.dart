import 'package:auto_route/auto_route.dart';
import 'package:crypto_app/features/app/screens/home_screen_layout.dart';
import 'package:flutter/material.dart';

@RoutePage()
class AppScreen extends StatelessWidget {
  const AppScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const HomeScreenLayout();
  }
}
