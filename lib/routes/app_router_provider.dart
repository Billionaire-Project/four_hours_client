import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/routes/app_router_notifier.dart';
import 'package:four_hours_client/views/splash_screen/splash_page.dart';
import 'package:go_router/go_router.dart';

final _appNavigatorKey =
    GlobalKey<NavigatorState>(debugLabel: 'appNavigatorKey');

final appRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final appRouterNotifier = ref.watch(appRouterNotifierProvider.notifier);
  return GoRouter(
      navigatorKey: _appNavigatorKey,
      routes: appRouterNotifier.routes,
      debugLogDiagnostics: true,
      redirect: appRouterNotifier.redirect,
      refreshListenable: appRouterNotifier,
      initialLocation: SplashPage.path);
});
