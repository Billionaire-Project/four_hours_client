import 'package:flutter/material.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/routes/app_state.dart';
import 'package:four_hours_client/views/liked_post_screen/liked_post_page.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:four_hours_client/views/shared_post_detail_screen/shared_post_detail_page.dart';
import 'package:four_hours_client/views/splash_screen/splash_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:four_hours_client/views/create_post_screen/create_post_page.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_tab.dart';
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
        //TODO: redirect to error page
        return null;
      }
      const String splashLocation = SplashPage.path;
      const String logInLocation = LoginPage.path;
      const String writeLocation = HomeWriteTab.path;

      final bool isAuth = appState.isLoggedIn;

      final isSplashLocation = state.location == splashLocation;
      if (isSplashLocation) {
        return isAuth ? writeLocation : logInLocation;
      }

      final bool isLogInLocation = state.location == logInLocation;

      if (isLogInLocation) {
        return isAuth ? writeLocation : null;
      }
      return isAuth ? null : logInLocation;
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
      GoRoute(
        path: LikedPostPage.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            NoTransitionPage(
          key: state.pageKey,
          child: const LikedPostPage(),
        ),
        parentNavigatorKey: _rootNavigatorKey,
      ),
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (context, state, child) {
          return HomePage(child: child);
        },
        routes: [
          GoRoute(
              path: HomeWriteTab.path,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  NoTransitionPage(
                    key: state.pageKey,
                    child: const HomeWriteTab(),
                  ),
              routes: [
                GoRoute(
                  path: CreatePostPage.path,
                  builder: (BuildContext context, GoRouterState state) =>
                      const CreatePostPage(),
                  parentNavigatorKey: _rootNavigatorKey,
                ),
              ]),
          GoRoute(
              path: HomeSharedTab.path,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  NoTransitionPage(
                    key: state.pageKey,
                    child: const HomeSharedTab(),
                  ),
              routes: [
                GoRoute(
                  path: SharedPostDetailPage.path,
                  name: SharedPostDetailPage.name,
                  builder: (BuildContext context, GoRouterState state) {
                    final post = state.extra! as PostModel;

                    if (state.params['postId'] != null) {
                      return SharedPostDetailPage(
                        postId: state.params['postId']!,
                        post: post,
                      );
                    } else {
                      //TODO: redirect or show error page
                      return const SizedBox.shrink();
                    }
                  },
                  parentNavigatorKey: _rootNavigatorKey,
                ),
              ])
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
