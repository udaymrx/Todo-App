// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i8;
import 'package:flutter/material.dart' as _i9;
import 'package:nicetodo/view/auth/settings_page.dart' as _i7;
import 'package:nicetodo/view/auth/signin_page.dart' as _i3;
import 'package:nicetodo/view/auth/verification_page.dart' as _i5;
import 'package:nicetodo/view/todo/add_task_page.dart' as _i6;
import 'package:nicetodo/view/todo/add_text_field.dart' as _i1;
import 'package:nicetodo/view/todo/homepage.dart' as _i2;
import 'package:nicetodo/view/todo/image_test.dart' as _i4;

class AppRouter extends _i8.RootStackRouter {
  AppRouter([_i9.GlobalKey<_i9.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i8.PageFactory> pagesMap = {
    MyHomeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i1.MyHomePage());
    },
    HomeRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i2.HomePage());
    },
    SignInRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i3.SignInPage());
    },
    SimplePhotoViewDemoRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i4.SimplePhotoViewDemoPage());
    },
    VerificationRoute.name: (routeData) {
      final args = routeData.argsAs<VerificationRouteArgs>();
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData,
          child: _i5.VerificationPage(key: args.key, email: args.email));
    },
    AddTaskRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i6.AddTaskPage());
    },
    SettingsRoute.name: (routeData) {
      return _i8.AdaptivePage<dynamic>(
          routeData: routeData, child: const _i7.SettingsPage());
    }
  };

  @override
  List<_i8.RouteConfig> get routes => [
        _i8.RouteConfig(MyHomeRoute.name, path: '/'),
        _i8.RouteConfig(HomeRoute.name, path: '/home'),
        _i8.RouteConfig(SignInRoute.name, path: '/sign-in-page'),
        _i8.RouteConfig(SimplePhotoViewDemoRoute.name,
            path: '/simple-photo-view-demo-page'),
        _i8.RouteConfig(VerificationRoute.name, path: '/verification-page'),
        _i8.RouteConfig(AddTaskRoute.name, path: '/add-task-page'),
        _i8.RouteConfig(SettingsRoute.name, path: '/settings-page')
      ];
}

/// generated route for
/// [_i1.MyHomePage]
class MyHomeRoute extends _i8.PageRouteInfo<void> {
  const MyHomeRoute() : super(MyHomeRoute.name, path: '/');

  static const String name = 'MyHomeRoute';
}

/// generated route for
/// [_i2.HomePage]
class HomeRoute extends _i8.PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/home');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [_i3.SignInPage]
class SignInRoute extends _i8.PageRouteInfo<void> {
  const SignInRoute() : super(SignInRoute.name, path: '/sign-in-page');

  static const String name = 'SignInRoute';
}

/// generated route for
/// [_i4.SimplePhotoViewDemoPage]
class SimplePhotoViewDemoRoute extends _i8.PageRouteInfo<void> {
  const SimplePhotoViewDemoRoute()
      : super(SimplePhotoViewDemoRoute.name,
            path: '/simple-photo-view-demo-page');

  static const String name = 'SimplePhotoViewDemoRoute';
}

/// generated route for
/// [_i5.VerificationPage]
class VerificationRoute extends _i8.PageRouteInfo<VerificationRouteArgs> {
  VerificationRoute({_i9.Key? key, required String email})
      : super(VerificationRoute.name,
            path: '/verification-page',
            args: VerificationRouteArgs(key: key, email: email));

  static const String name = 'VerificationRoute';
}

class VerificationRouteArgs {
  const VerificationRouteArgs({this.key, required this.email});

  final _i9.Key? key;

  final String email;

  @override
  String toString() {
    return 'VerificationRouteArgs{key: $key, email: $email}';
  }
}

/// generated route for
/// [_i6.AddTaskPage]
class AddTaskRoute extends _i8.PageRouteInfo<void> {
  const AddTaskRoute() : super(AddTaskRoute.name, path: '/add-task-page');

  static const String name = 'AddTaskRoute';
}

/// generated route for
/// [_i7.SettingsPage]
class SettingsRoute extends _i8.PageRouteInfo<void> {
  const SettingsRoute() : super(SettingsRoute.name, path: '/settings-page');

  static const String name = 'SettingsRoute';
}
