import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/firebase_options.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:four_hours_client/providers/theme_provider.dart';
import 'package:four_hours_client/routes/app_router.dart';
import 'package:four_hours_client/utils/app_theme.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(
    ProviderScope(
      overrides: [
        sharedPreferencesProvider.overrideWithValue(sharedPreferences),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    final appTheme = ref.watch(appThemeProvider);
    final isDarkMode = ref.watch(themeNotifierProvider);

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
