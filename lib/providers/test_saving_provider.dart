import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/providers/shared_preference_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class TestSavingNotifier extends AsyncNotifier<bool> {
  late SharedPreferences sharedPreferences;

  @override
  bool build() {
    sharedPreferences = ref.watch(sharedPreferencesProvider);

    return false;
  }

  Future<bool> saveWriting(String text) async {
    await sharedPreferences.setString(SharedPreferenceKey.temporaryText, text);
    return true;
  }

  Future<void> requestToSave(String text) async {
    state = const AsyncValue.loading();

    Timer(const Duration(seconds: 1), () async {
      bool result = await saveWriting(text);
      if (result) {
        state = const AsyncValue.data(true);
      } else {
        state = AsyncValue.error('Error', StackTrace.current);
      }
    });
  }
}

final testSavingNotifierProvider =
    AsyncNotifierProvider<TestSavingNotifier, bool>(TestSavingNotifier.new);
