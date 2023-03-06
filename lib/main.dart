import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/firebase_options.dart';
import 'package:four_hours_client/provider/shared_preference_provider.dart';
import 'package:four_hours_client/provider/theme_provider.dart';
import 'package:four_hours_client/view/write_screen.dart/write_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  WidgetsFlutterBinding.ensureInitialized();
  final sharedPreferences = await SharedPreferences.getInstance();

  runApp(ProviderScope(overrides: [
    sharedPreferencesProvider.overrideWithValue(sharedPreferences),
  ], child: const MyApp()));
}

class MyApp extends ConsumerWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isDarkMode = ref.watch(themeNotifierProvider);

    return MaterialApp(
      title: 'Four Hours',
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: const WritePage(),
    );
  }
}
