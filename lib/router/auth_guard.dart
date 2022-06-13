import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:nicetodo/util/service/shared_prefrence.dart';
import 'router.gr.dart';

class AuthGuard extends AutoRouteGuard {
  @override
  void onNavigation(NavigationResolver resolver, StackRouter router) {
    final isAuthenticated = UserPreferences.isSignedIn;
    if (isAuthenticated) {
      resolver.next();
      debugPrint('User is logged in..');
    } else if (!isAuthenticated) {
      debugPrint('User is not logged in..');
      router.push(const SignInRoute());
    }
  }
}
