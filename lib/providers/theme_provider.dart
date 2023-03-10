import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeNotifier extends Notifier<bool> {
  late SharedPreferences sharedPreferences;
  @override
  bool build() {
    sharedPreferences = ref.watch(sharedPreferencesProvider);
    state = sharedPreferences.getBool('isDarkMode') ?? false;
    return state;
  }

  void changeTheme() {
    state = !state;
    sharedPreferences.setBool('isDarkMode', state);
  }
}

final themeNotifierProvider =
    NotifierProvider<ThemeNotifier, bool>(ThemeNotifier.new);
