import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/shared_screen/shared_page.dart';
import 'package:four_hours_client/views/top_navigator/top_navigator_page.dart';
import 'package:four_hours_client/views/write_screen/write_page.dart';
import 'package:go_router/go_router.dart';

final _shellNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'shellNavigatorKey');

class AppRouterNotifier extends AutoDisposeAsyncNotifier<void>
    implements Listenable {
  VoidCallback? routerListener;

  @override
  Future<void> build() async {
    ref.listenSelf((_, __) {
      if (state.isLoading) return;
      routerListener?.call();
    });
  }

  List<RouteBase> get routes => [
        ShellRoute(
            navigatorKey: _shellNavigatorKey,
            builder: (context, state, child) {
              return TopNavigatorPage(child: child);
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
