import 'package:flutter/material.dart';
import 'package:four_hours_client/views/shared_screen.dart/shared_page.dart';
import 'package:four_hours_client/views/main_screen.dart/main_page.dart';
import 'package:four_hours_client/views/write_screen.dart/write_page.dart';
import 'package:go_router/go_router.dart';

enum AppRoute {
  main,
  write,
  shared,
  settings,
}

final GoRouter appRouter = GoRouter(initialLocation: '/', routes: [
  GoRoute(
      path: '/',
      name: AppRoute.main.name,
      pageBuilder: (BuildContext context, GoRouterState state) =>
          const NoTransitionPage(child: MainPage()),
      routes: [
        GoRoute(
            path: '/write',
            name: AppRoute.write.name,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage(child: WritePage())),
        GoRoute(
            path: '/shared',
            name: AppRoute.shared.name,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                const NoTransitionPage(child: SharedPage()))
      ]),
]);
