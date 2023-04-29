import 'dart:async';

import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr build() {}

  Future<void> signInWithGoogle() async {
    final authRepository = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authRepository.signInWithGoogle);
  }

  Future<void> signInWithApple() async {
    final authRepository = ref.watch(authRepositoryProvider);

    state = const AsyncLoading();

    state = await AsyncValue.guard(authRepository.signInWithApple);
  }

  Future<void> signOut() async {
    final authRepository = ref.watch(authRepositoryProvider);

    state = await AsyncValue.guard(authRepository.signOut);
  }
}
