import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/services/auth_service.dart';

class AuthNotifier extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signInWithGoogle() async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authService.signInWithGoogle);
  }

  Future<void> signInWithApple() async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authService.signInWithApple);
  }

  Future<void> signOut() async {
    final authService = ref.read(authServiceProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authService.signOut);
  }
}

final authProvider =
    AsyncNotifierProvider<AuthNotifier, void>(AuthNotifier.new);
