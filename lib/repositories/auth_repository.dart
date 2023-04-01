import 'package:firebase_auth/firebase_auth.dart';
import 'package:four_hours_client/repositories/services/auth_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class AuthRepository {
  final AuthService _authService;
  AuthRepository(this._authService);

  final FirebaseAuth _auth = FirebaseAuth.instance;

  // It will give us a stream of the state change of the user (maybe the token changes)
  Stream<User?> get authStateChange => _auth.authStateChanges();

  Future<void> signInWithGoogle() async {
    return _authService.signInWithGoogle();
  }

  Future<void> signInWithApple() async {
    return _authService.signInWithApple();
  }

  Future<void> signOut() async {
    return _authService.signOut();
  }
}

final authRepositoryProvider = Provider<AuthRepository>(
    (ref) => AuthRepository(ref.read(authServiceProvider)));

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return authRepository.authStateChange;
});
