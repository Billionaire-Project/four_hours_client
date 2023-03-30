import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:four_hours_client/views/shared_tab/shared_page.dart';
import 'package:four_hours_client/views/home_screen/home_page.dart';
import 'package:four_hours_client/views/write_tab/write_page.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorKey');

class AppRouterNotifier extends AutoDisposeAsyncNotifier<void> {
  @override
  Future<void> build() async {}

  List<RouteBase> get routes => [
        // GoRoute(
        //     path: HomePage.path,
        //     builder: (context, state) => const AuthChecker()),
        GoRoute(
            path: LoginPage.path,
            builder: (context, state) => const LoginPage()),
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return HomePage(child: child);
            },
            routes: [
              GoRoute(
                  path: WritePage.path,
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      const NoTransitionPage(child: WritePage())),
              GoRoute(
                  path: SharedPage.path,
                  pageBuilder: (BuildContext context, GoRouterState state) =>
                      const NoTransitionPage(child: SharedPage()))
            ]),
      ];

  String? redirect(BuildContext context, GoRouterState state) {
    if (this.state.isLoading || this.state.hasError) return null;

    final authState = ref.watch(authStateProvider);

    const String logInLocation = LoginPage.path;
    const String homeLocation = HomePage.path;

    final bool isLogIn = authState.when(
        data: (user) {
          if (user != null) return true;
          return false;
        },
        error: (_, __) => false,
        loading: () => false);

    if (isLogIn) {
      return homeLocation;
    }
    return logInLocation;
  }
}

final appRouterNotifierProvider =
    AutoDisposeAsyncNotifierProvider<AppRouterNotifier, void>(() {
  return AppRouterNotifier();
});
