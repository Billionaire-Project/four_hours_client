abstract class FirebaseAuthService {
  Future<void> signInWithGoogle();

  Future<void> signOut();

  bool isUserLoggedIn();
}
