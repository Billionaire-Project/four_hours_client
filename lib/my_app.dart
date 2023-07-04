import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/network/dio_client.dart';
import 'package:four_hours_client/network/endpoints.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/routes/app_router.dart';
import 'package:four_hours_client/utils/app_theme.dart';

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final appTheme = ref.watch(appThemeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider);

    String baseUrl = Endpoints.of(context).baseUrl;
    DioClient.setBaseUrl(baseUrl);

    return MaterialApp.router(
      title: '4hours',
      routerConfig: appRouter,
      theme: appTheme,
      darkTheme: appTheme.copyWith(
        brightness: Brightness.dark,
      ),
      themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
    );
  }
}
