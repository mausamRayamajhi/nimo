// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:crypto_app/core/navigation/router_screens/family_tree_router_screen.dart'
    as _i3;
import 'package:crypto_app/core/navigation/router_screens/home_router_screen.dart'
    as _i6;
import 'package:crypto_app/features/app/screens/app_screen.dart' as _i1;
import 'package:crypto_app/features/app/screens/home_screen_layout.dart' as _i5;
import 'package:crypto_app/features/coin/screen/coin/coin_screen.dart' as _i2;
import 'package:crypto_app/features/home/screens/home_screen.dart' as _i4;
import 'package:flutter/material.dart' as _i8;

/// generated route for
/// [_i1.AppScreen]
class AppScreenRoute extends _i7.PageRouteInfo<void> {
  const AppScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(AppScreenRoute.name, initialChildren: children);

  static const String name = 'AppScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i1.AppScreen();
    },
  );
}

/// generated route for
/// [_i2.CoinScreen]
class CoinScreenRoute extends _i7.PageRouteInfo<CoinScreenRouteArgs> {
  CoinScreenRoute({
    _i8.Key? key,
    required String coinId,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         CoinScreenRoute.name,
         args: CoinScreenRouteArgs(key: key, coinId: coinId),
         initialChildren: children,
       );

  static const String name = 'CoinScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CoinScreenRouteArgs>();
      return _i2.CoinScreen(key: args.key, coinId: args.coinId);
    },
  );
}

class CoinScreenRouteArgs {
  const CoinScreenRouteArgs({this.key, required this.coinId});

  final _i8.Key? key;

  final String coinId;

  @override
  String toString() {
    return 'CoinScreenRouteArgs{key: $key, coinId: $coinId}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! CoinScreenRouteArgs) return false;
    return key == other.key && coinId == other.coinId;
  }

  @override
  int get hashCode => key.hashCode ^ coinId.hashCode;
}

/// generated route for
/// [_i3.FamilyTreeRouterScreen]
class FamilyTreeTabRoute extends _i7.PageRouteInfo<void> {
  const FamilyTreeTabRoute({List<_i7.PageRouteInfo>? children})
    : super(FamilyTreeTabRoute.name, initialChildren: children);

  static const String name = 'FamilyTreeTabRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return _i3.FamilyTreeRouterScreen();
    },
  );
}

/// generated route for
/// [_i4.HomeScreen]
class HomeScreenRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeScreenRoute.name, initialChildren: children);

  static const String name = 'HomeScreenRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.HomeScreen();
    },
  );
}

/// generated route for
/// [_i5.HomeScreenLayout]
class HomeScreenLayoutRoute extends _i7.PageRouteInfo<void> {
  const HomeScreenLayoutRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeScreenLayoutRoute.name, initialChildren: children);

  static const String name = 'HomeScreenLayoutRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.HomeScreenLayout();
    },
  );
}

/// generated route for
/// [_i6.HomeWrapperPage]
class HomeTabRoute extends _i7.PageRouteInfo<void> {
  const HomeTabRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeTabRoute.name, initialChildren: children);

  static const String name = 'HomeTabRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.HomeWrapperPage();
    },
  );
}
