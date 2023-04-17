import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  User? get currentUser => _auth.currentUser;

  final storage = const FlutterSecureStorage();

  // It will give us a stream of the state change of the user (maybe the token changes)
  Stream<User?> get authStateChange => _auth.authStateChanges();

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
      getFirebaseAuth(credential: credential);
    } on FirebaseAuthException catch (e) {
      if (e.code == 'account-exists-with-different-credential') {
        throw const AuthException('different credential');
      } else if (e.code == 'invalid-credential') {
        throw const AuthException('invalid credential');
      } else {
        throw const AuthException('Unknown error');
      }
    }
  }

  Future<void> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final oAuthProvider = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
    );

    getFirebaseAuth(credential: oAuthProvider);
  }

  Future<void> signOut() async {
    await _auth.signOut();
  }

  void getFirebaseAuth({required OAuthCredential credential}) async {
    final firebaseAuthCred = await _auth.signInWithCredential(credential);
    final token = await firebaseAuthCred.user?.getIdToken();
    final uid = firebaseAuthCred.user?.uid;
    await storage.write(key: LocalStorageKey.token, value: token);
    await storage.write(key: LocalStorageKey.uid, value: uid);
  }
}

class AuthException implements Exception {
  final String message;

  const AuthException(this.message);
}

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  final authService = ref.read(authServiceProvider);
  return authService.authStateChange;
});
