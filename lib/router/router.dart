import 'package:auto_route/auto_route.dart';
import 'package:nicetodo/view/auth/initial_page.dart';
import 'package:nicetodo/view/auth/settings_page.dart';
import 'package:nicetodo/view/auth/verification_page.dart';

import '../view/auth/signin_page.dart';
import '../view/todo/add_task_page.dart';
import '../view/todo/homepage.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: InitialPage, initial: true),
    AutoRoute(
      path: '/home',
      page: HomePage,
    ),
    AutoRoute(page: SignInPage),
    AutoRoute(page: VerificationPage),
    AutoRoute(page: AddTaskPage),
    AutoRoute(page: SettingsPage),
  ],
)
class $AppRouter {}
