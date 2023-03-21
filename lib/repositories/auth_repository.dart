import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/repositories/services/firebase_auth_service.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthRepository extends FirebaseAuthService {
  final FirebaseAuth _auth;

  AuthRepository(this._auth);

  // It will give us a stream of the state change of the user (maybe the token changes)
  Stream<User?> get authStateChange => _auth.authStateChanges();

  @override
  bool isUserLoggedIn() {
    if (_auth.currentUser != null) {
      return true;
    } else {
      return false;
    }
  }

  @override
  Future<void> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication googleAuth =
        await googleUser!.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    try {
      await _auth.signInWithCredential(credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        throw const AuthException('User not found');
      } else if (e.code == 'wrong-password') {
        throw const AuthException('Wrong password provided for that user.');
      } else {
        throw const AuthException('Unknown error');
      }
    }
  }

  @override
  Future<void> signOut() async {
    await _auth.signOut();
  }
}

class AuthException implements Exception {
  final String message;

  const AuthException(this.message);
}

final authRepositoryProvider = Provider<AuthRepository>((ref) {
  return AuthRepository(FirebaseAuth.instance);
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authRepository = ref.read(authRepositoryProvider);
  return authRepository.authStateChange;
});
