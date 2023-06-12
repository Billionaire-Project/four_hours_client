import 'dart:async';

import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  AuthRepository? authRepository;

  @override
  FutureOr build() {
    _init();
  }

  Future<void> signInWithGoogle() async {
    try {
      state = const AsyncLoading();

      state = await AsyncValue.guard(authRepository!.signInWithGoogle);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> signInWithApple() async {
    try {
      state = const AsyncLoading();

      state = await AsyncValue.guard(authRepository!.signInWithApple);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<void> signOut() async {
    try {
      state = await AsyncValue.guard(authRepository!.signOut);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _init() {
    authRepository = ref.read(authRepositoryProvider);
  }
}
