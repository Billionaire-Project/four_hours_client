import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';

class AuthProvider extends AsyncNotifier<void> {
  @override
  FutureOr<void> build() {}

  Future<void> signInWithGoogle() async {
    final authRepository = ref.read(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authRepository.signInWithGoogle);
  }
}

final authProvider =
    AsyncNotifierProvider<AuthProvider, void>(AuthProvider.new);
