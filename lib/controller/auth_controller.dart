import 'dart:async';

import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  @override
  FutureOr build() {}

  Future<void> signInWithGoogle() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);

      state = const AsyncLoading();

      state = await AsyncValue.guard(authRepository.signInWithGoogle);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> signInWithApple() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);

      state = const AsyncLoading();

      state = await AsyncValue.guard(authRepository.signInWithApple);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> signOut() async {
    try {
      final authRepository = ref.read(authRepositoryProvider);

      state = await AsyncValue.guard(authRepository.signOut);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}
