import 'package:flutter/material.dart';
import 'package:four_hours_client/models/post_detail_extra_model.dart';
import 'package:four_hours_client/models/post_model.dart';
import 'package:four_hours_client/routes/app_state.dart';
import 'package:four_hours_client/views/delete_post_screen/delete_post_page.dart';
import 'package:four_hours_client/views/error_screen/error_page.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_post_detail_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_post_detail_page.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_post_detail_page.dart';
import 'package:four_hours_client/views/liked_posts_screen/liked_posts_page.dart';
import 'package:four_hours_client/views/login_screen/login_page.dart';
import 'package:four_hours_client/views/home_screen/write_tab/home_write_tab.dart';
import 'package:four_hours_client/views/widgets/common_skeleton_page.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:four_hours_client/views/create_post_screen/create_post_page.dart';
import 'package:four_hours_client/views/home_screen/shared_tab/home_shared_tab.dart';
import 'package:four_hours_client/views/widgets/common_widgets_page.dart';

import 'package:four_hours_client/views/home_screen/home_page.dart';

part 'app_router.g.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final _shellNavigatorKey = GlobalKey<NavigatorState>();

@riverpod
GoRouter appRouter(AppRouterRef ref) {
  final appState = ref.watch(appStateProvider);

  return GoRouter(
    debugLogDiagnostics: true,
    navigatorKey: navigatorKey,
    initialLocation: LoginPage.path,
    refreshListenable: appState,
    redirect: (BuildContext context, GoRouterState state) {
      if (state.error != null) {
        return ErrorPage.path;
      }
      const String logInLocation = LoginPage.path;
      const String writeLocation = HomeWriteTab.path;

      final bool isAuth = appState.isLoggedIn;

      final bool isLogInLocation = state.location == logInLocation;

      if (isLogInLocation) {
        return isAuth ? writeLocation : null;
      }
      return isAuth ? null : logInLocation;
    },
    routes: [
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
              path: HomeWriteTab.path,
              pageBuilder: (BuildContext context, GoRouterState state) =>
                  NoTransitionPage(
                    key: state.pageKey,
                    child: const HomeWriteTab(),
                  ),
              routes: [
                GoRoute(
                  path: WritePostDetailPage.path,
                  name: WritePostDetailPage.name,
                  builder: (BuildContext context, GoRouterState state) {
                    final PostDetailExtraModel extra =
                        state.extra as PostDetailExtraModel;

                    final PostModel post = extra.post;
                    final String time = extra.time;
                    final String postingDate = extra.postingDate;

                    if (state.params['postId'] != null) {
                      return WritePostDetailPage(
                        postId: state.params['postId']!,
                        post: post,
                        time: time,
                        postingDate: postingDate,
                      );
                    } else {
                      return const ErrorPage(
                          error: 'The post ID cannot be found,');
                    }
                  },
                  parentNavigatorKey: navigatorKey,
                ),
                GoRoute(
                  path: CreatePostPage.path,
                  builder: (BuildContext context, GoRouterState state) =>
                      const CreatePostPage(),
                  parentNavigatorKey: navigatorKey,
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
                    final PostDetailExtraModel extra =
                        state.extra as PostDetailExtraModel;

                    final PostModel post = extra.post;
                    final String time = extra.time;

                    if (state.params['postId'] != null) {
                      return SharedPostDetailPage(
                        postId: state.params['postId']!,
                        post: post,
                        time: time,
                      );
                    } else {
                      return const ErrorPage(
                          error: 'The post ID cannot be found,');
                    }
                  },
                  parentNavigatorKey: navigatorKey,
                ),
              ]),
        ],
      ),
      GoRoute(
        path: LikedPostsPage.path,
        pageBuilder: (BuildContext context, GoRouterState state) =>
            CustomTransitionPage(
          transitionDuration: const Duration(milliseconds: 100),
          key: state.pageKey,
          child: const LikedPostsPage(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) =>
              SlideTransition(
            position: animation.drive(
              Tween<Offset>(
                begin: const Offset(-1, 0),
                end: Offset.zero,
              ),
            ),
            child: child,
          ),
        ),
        parentNavigatorKey: navigatorKey,
        routes: [
          GoRoute(
            path: LikedPostDetailPage.path,
            name: LikedPostDetailPage.name,
            builder: (BuildContext context, GoRouterState state) {
              final PostDetailExtraModel extra =
                  state.extra as PostDetailExtraModel;

              final PostModel post = extra.post;
              final String time = extra.time;
              final String postingDate = extra.postingDate;

              if (state.params['postId'] != null) {
                return LikedPostDetailPage(
                  postId: state.params['postId']!,
                  post: post,
                  time: time,
                  postingDate: postingDate,
                );
              } else {
                return const ErrorPage(error: 'The post ID cannot be found,');
              }
            },
            parentNavigatorKey: navigatorKey,
          ),
        ],
      ),
      GoRoute(
        path: DeletePostPage.path,
        name: DeletePostPage.name,
        builder: (BuildContext context, GoRouterState state) {
          final extra = state.extra as Map<String, dynamic>?;
          final bool? isDetailPage = extra?['isDetailPage'];

          if (state.params['postId'] != null) {
            return DeletePostPage(
              postId: int.parse(state.params['postId']!),
              isDetailPage: isDetailPage,
            );
          } else {
            return const ErrorPage(error: 'The post ID cannot be found,');
          }
        },
        parentNavigatorKey: navigatorKey,
      ),
      GoRoute(
          path: ErrorPage.path,
          parentNavigatorKey: navigatorKey,
          builder: (BuildContext context, GoRouterState state) {
            final extra = state.extra as Map<String, String?>?;
            final error = extra?['error'];

            return ErrorPage(error: error);
          }),
      GoRoute(
        path: CommonWidgetsPage.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const CommonWidgetsPage(),
      ),
      GoRoute(
        path: CommonSkeletonPage.path,
        parentNavigatorKey: navigatorKey,
        builder: (BuildContext context, GoRouterState state) =>
            const CommonSkeletonPage(),
      ),
    ],
    errorPageBuilder: (context, state) => const NoTransitionPage(
      child: ErrorPage(
        error: '해당 페이지는 존재하지 않습니다',
      ),
    ),
  );
}
