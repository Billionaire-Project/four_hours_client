import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/services/auth_service.dart';

class AuthProvider extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<bool> signInWithGoogle() async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authService.signInWithGoogle);

    if (state.hasError || !state.hasValue || state.isLoading) {
      return false;
    }
    return true;
  }

  Future<bool> signInWithApple() async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authService.signInWithApple);

    if (state.hasError || !state.hasValue || state.isLoading) {
      return false;
    }
    return true;
  }

  Future<void> signOut() async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authService.signOut);
  }
}

final authProvider =
    AsyncNotifierProvider<AuthProvider, void>(AuthProvider.new);
