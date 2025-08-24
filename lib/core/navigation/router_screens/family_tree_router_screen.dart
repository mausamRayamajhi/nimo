import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

@RoutePage(name: 'FamilyTreeTabRoute')
class FamilyTreeRouterScreen extends AutoRouter {
  static final familyTreeRouterKey = GlobalKey<AutoRouterState>();

  FamilyTreeRouterScreen() : super(key: familyTreeRouterKey);
}
