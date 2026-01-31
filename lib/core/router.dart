import 'dart:async';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:simple_app/core/constants/rout_names.dart';
import 'package:simple_app/core/global/rout_kies.dart';
import 'package:simple_app/features/auth/presentation/screens/login_screen.dart';
import 'package:simple_app/features/home/presentation/screens/home_screen.dart';

class AppRoutes {
  AppRoutes._();
  static final AppRoutes instance = AppRoutes._();
  factory AppRoutes() => instance;

  static FutureOr<String?> _handleHomeRedirect(BuildContext context, _) async {
    return null;
  }

  final router = GoRouter(
    navigatorKey: GlobalKeys.instance.rootKey,
    initialLocation: RoutNames.instance.home,
    routes: [
      GoRoute(
        name: RoutNames.instance.home,
        path: RoutNames.instance.home,
        redirect: _handleHomeRedirect,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const HomeScreen()),
      ),

      GoRoute(
        name: RoutNames.instance.login,
        path: RoutNames.instance.login,
        pageBuilder: (context, state) =>
            NoTransitionPage(child: const LoginScreen()),
      ),
    ],
  );
}
