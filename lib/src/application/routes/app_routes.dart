import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:gorgeous_quiz/src/core/utils/constants.dart';
import 'package:gorgeous_quiz/src/presentation/menu/menu_page.dart';
import 'package:gorgeous_quiz/src/presentation/not_found/not_found_page.dart';
import 'package:gorgeous_quiz/src/presentation/splash/splash_page.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final GoRouter _router = GoRouter(
    initialLocation: "/",
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    routes: [
      GoRoute(
        path: "/",
        name: Routes.root,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: SplashPage(),
        ),
      ),
      GoRoute(
        path: "/menu",
        name: Routes.menu,
        pageBuilder: (context, state) => const NoTransitionPage(
          child: MenuPage(),
        ),
      ),
    ],
    errorBuilder: (context, state) => const NotFoundPage(),
  );

  static GoRouter get router => _router;
}
