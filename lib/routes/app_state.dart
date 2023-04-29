import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:four_hours_client/repositories/auth_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_state.g.dart';

class AppState extends ChangeNotifier {
  final Stream<User?> authStateChanges;

  AppState(this.authStateChanges) {
    _listenAuthSateChange();
  }

  late final StreamSubscription<User?> _authStateChangesStream;

  bool _isLoggedIn = false;
  bool get isLoggedIn => _isLoggedIn;

  void _listenAuthSateChange() {
    _authStateChangesStream =
        authStateChanges.asBroadcastStream().listen((User? user) {
      _isLoggedIn = user != null;
      notifyListeners();
    });
  }

  @override
  void dispose() {
    _authStateChangesStream.cancel();
    super.dispose();
  }
}

@riverpod
AppState appState(AppStateRef ref) {
  final authStateChanges = ref.watch(authRepositoryProvider).authStateChanges();
  return AppState(authStateChanges);
}
