import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class TestSavingNotifier extends AsyncNotifier<bool> {
  @override
  bool build() {
    requestToSave();
    return false;
  }

  Future<void> requestToSave() async {
    state = const AsyncValue.loading();

    void request() async {
      state = const AsyncValue.data(true);
    }

    Timer(const Duration(seconds: 2), request);
  }
}

final testSavingNotifierProvider =
    AsyncNotifierProvider<TestSavingNotifier, bool>(TestSavingNotifier.new);
