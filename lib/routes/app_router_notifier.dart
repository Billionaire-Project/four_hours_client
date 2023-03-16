import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/views/shared_screen.dart/shared_page.dart';
import 'package:four_hours_client/views/top_navigator.dart/top_navigator_page.dart';
import 'package:four_hours_client/views/write_screen.dart/write_page.dart';
import 'package:go_router/go_router.dart';

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
