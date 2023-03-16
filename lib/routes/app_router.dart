import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/routes/app_router_notifier.dart';
import 'package:four_hours_client/views/write_screen.dart/write_page.dart';
import 'package:go_router/go_router.dart';

final _key = GlobalKey<NavigatorState>(debugLabel: 'appRouterKey');

final appRouterProvider = Provider.autoDispose<GoRouter>((ref) {
  final appRouterNotifier = ref.watch(appRouterNotifierProvider.notifier);
  return GoRouter(
      navigatorKey: _key,
      routes: appRouterNotifier.routes,
      debugLogDiagnostics: true,
      initialLocation: WritePage.path);
});
