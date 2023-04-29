import 'package:flutter/material.dart';
import 'package:four_hours_client/routes/app_state.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:four_hours_client/views/splash_screen/splash_page.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:four_hours_client/views/create_writing_screen/create_writing_page.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/widgets/common_widgets_page.dart';

import 'package:four_hours_client/views/home_screen/home_page.dart';

part 'app_router.g.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final appState = ref.watch(appStateProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: _rootNavigatorKey,
    initialLocation: SplashPage.path,
    refreshListenable: appState,
    redirect: (BuildContext context, GoRouterState state) {
      if (state.error != null) {
        return null;
      }
      const String splashLocation = SplashPage.path;
      const String logInLocation = LoginPage.path;
      const String writeLocation = WritePage.path;

      final bool isAuth = appState.isLoggedIn;

      final isSplashLocation = state.location == splashLocation;
      if (isSplashLocation) {
        return isAuth ? writeLocation : logInLocation;
      }

      final bool isLogInLocation = state.location == logInLocation;

      if (isLogInLocation) {
        return isAuth ? writeLocation : null;
      }
      return isAuth ? null : splashLocation;
    },
    routes: [
      GoRoute(
        path: SplashPage.path,
        builder: (BuildContext context, GoRouterState state) =>
            const SplashPage(),
      ),
      GoRoute(
        path: LoginPage.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          key: state.pageKey,
          child: const LoginPage(),
        ),
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
              path: WritePage.path,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  NoTransitionPage(
                    key: state.pageKey,
                    child: const WritePage(),
                  ),
              routes: [
                GoRoute(
                  path: CreateWritingPage.path,
                  builder: (BuildContext context, GoRouterState state) =>
                      const CreateWritingPage(),
                  parentNavigatorKey: _rootNavigatorKey,
                ),
              ]),
          GoRoute(
            path: SharedPage.path,
            pageBuilder: (BuildContext context, GoRouterState state) =>
                NoTransitionPage(
              key: state.pageKey,
              child: const SharedPage(),
            ),
          )
        ],
      ),
      GoRoute(
        path: CommonWidgetsPage.path,
        parentNavigatorKey: _rootNavigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const CommonWidgetsPage(),
      ),
    ],
  );
}
