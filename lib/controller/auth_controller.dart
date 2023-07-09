import 'dart:async';

import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_controller.g.dart';

@riverpod
class AuthController extends _$AuthController {
  AuthRepository? authRepository;
  FirebaseAuth? auth;

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

  Future<void> deleteAccount() async {
    try {
      state = await AsyncValue.guard(authRepository!.deleteAccount);

      await auth!.signOut();

      const storage = FlutterSecureStorage();

      await storage.delete(key: LocalStorageKey.token);
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _init() {
    authRepository = ref.read(authRepositoryProvider);
    auth = ref.watch(firebaseAuthProvider);
  }
}
