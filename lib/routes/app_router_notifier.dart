import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/services/auth_service.dart';
import 'package:go_router/go_router.dart';

import 'package:four_hours_client/views/home_screen/home_page.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/splash_screen/splash_page.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';

final _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorKey');

class AppRouterNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<void> build() async {
    ref.listenSelf((_, __) {
      // One could write more conditional logic for when to call redirection
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  List<RouteBase> get routes => [
        GoRoute(
            path: SplashPage.path,
            builder: (context, state) => const SplashPage()),
        GoRoute(
            path: LoginPage.path,
            pageBuilder: (context, state) =>
                NoTransitionPage(key: state.pageKey, child: const LoginPage())),
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
                          key: state.pageKey, child: const WritePage())),
              GoRoute(
                  path: SharedPage.path,
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      NoTransitionPage(
                          key: state.pageKey, child: const SharedPage()))
            ]),
      ];

  String? redirect(BuildContext context, GoRouterState state) {
    final authState = ref.watch(authStateProvider);

    if (authState.isLoading || authState.hasError) return null;

    final bool isAuth = authState.valueOrNull != null;

    const String splashLocation = SplashPage.path;
    const String logInLocation = LoginPage.path;
    const String writeLocation = WritePage.path;

    final isSplashLocation = state.location == splashLocation;
    if (isSplashLocation) {
      return isAuth ? writeLocation : logInLocation;
    }

    final bool isLogInLocation = state.location == logInLocation;

    if (isLogInLocation) {
      return isAuth ? writeLocation : null;
    }
    return isAuth ? null : splashLocation;
  }

  @override
  void addListener(VoidCallback listener) {
    routerListener = listener;
  }

  @override
  void removeListener(VoidCallback listener) {
    routerListener = null;
  }
}

final appRouterNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppRouterNotifier, void>(() {
  return AppRouterNotifier();
});
