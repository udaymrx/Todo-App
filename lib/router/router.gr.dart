// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:nicetodo/view/auth/initial_page.dart' as _i1;
import 'package:nicetodo/view/auth/settings_page.dart' as _i6;
import 'package:nicetodo/view/auth/signin_page.dart' as _i3;
import 'package:nicetodo/view/auth/verification_page.dart' as _i4;
import 'package:nicetodo/view/todo/add_task_page.dart' as _i5;
import 'package:nicetodo/view/todo/homepage.dart' as _i2;

class AppRouter extends _i7.RootStackRouter {
  AppRouter([_i8.GlobalKey<_i8.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i7.PageFactory> pagesMap = {
    InitialRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.InitialPage());
    },
    HomeRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i4.VerificationPage(key: args.key, email: args.email));
    },
    AddTaskRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i5.AddTaskPage());
    },
    SettingsRoute.name: (routeData) {
      return _i7.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.SettingsPage());
    }
  };

  @override
  List<_i7.RouteConfig> get routes => [
        _i7.RouteConfig(InitialRoute.name, path: '/'),
        _i7.RouteConfig(HomeRoute.name, path: '/home'),
        _i7.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i7.RouteConfig(VerificationRoute.name, path: '/verification-page'),
        _i7.RouteConfig(AddTaskRoute.name, path: '/add-task-page'),
        _i7.RouteConfig(SettingsRoute.name, path: '/settings-page')
      ];
}

/// generated route for
/// [_i1.InitialPage]
class InitialRoute extends _i7.PageRouteInfo<void> {
  const InitialRoute() : super(InitialRoute.name, path: '/');

  static const String name = 'InitialRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i7.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.VerificationPage]
class VerificationRoute extends _i7.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({_i8.Key? key, required String email})
      : super(VerificationRoute.name,
            path: '/verification-page',
            args: VerificationRouteArgs(key: key, email: email));

  static const String name = 'VerificationRoute';
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.email});

  final _i8.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i5.AddTaskPage]
class AddTaskRoute extends _i7.PageRouteInfo<void> {
  const AddTaskRoute() : super(AddTaskRoute.name, path: '/add-task-page');

  static const String name = 'AddTaskRoute';
}

/// generated route for
/// [_i6.SettingsPage]
class SettingsRoute extends _i7.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}
