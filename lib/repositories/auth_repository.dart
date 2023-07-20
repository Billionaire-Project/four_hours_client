import 'package:dio/dio.dart';
import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;

part 'auth_repository.g.dart';

class AuthRepository extends BaseRepository {
  final FirebaseAuth auth;

  AuthRepository({
    required this.auth,
  });

  final storage = const FlutterSecureStorage();

  // It will give us a stream of the state change of the user (maybe the token changes)
  Stream<User?> authStateChanges() => auth.authStateChanges();
  User? get currentUser => auth.currentUser;

  Future<void> signInWithGoogle() async {
    try {
      // Trigger the authentication flow
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

      printDebug('AuthRepository', 'googleUser: $googleUser');

      if (googleUser != null) {
        // Obtain the auth details from the request
        final GoogleSignInAuthentication googleAuth =
            await googleUser.authentication;

        printDebug('AuthRepository', 'googleAuth: $googleAuth');

        // Create a new credential
        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth.accessToken,
          idToken: googleAuth.idToken,
        );

        printDebug('AuthRepository', 'credential: $credential');

        try {
          _getFirebaseAuth(credential: credential);
        } on FirebaseAuthException catch (e) {
          if (e.code == 'account-exists-with-different-credential') {
            throw const AuthException('different credential');
          } else if (e.code == 'invalid-credential') {
            throw const AuthException('invalid credential');
          } else {
            throw const AuthException('Unknown error');
          }
        }
      } else {
        printDebug('AuthRepository', 'Google Sign-In canceled by user');
        return;
      }
    } catch (e) {
      printDebug('AuthRepository', 'Google Sign-In Error: $e');
    }
  }

  Future<void> signInWithApple() async {
    final appleCredential = await SignInWithApple.getAppleIDCredential(
      scopes: [
        AppleIDAuthorizationScopes.email,
        AppleIDAuthorizationScopes.fullName,
      ],
    );

    final credential = OAuthProvider('apple.com').credential(
      idToken: appleCredential.identityToken,
    );

    _getFirebaseAuth(credential: credential);
  }

  Future<void> signOut() async {
    await _logoutUser();

    await auth.signOut();

    await storage.delete(key: LocalStorageKey.token);
  }

  Future<UserModel> getMyInformation() async {
    Response response = await dioClient.get('/auth/me/');

    UserModel result = UserModel.fromJson(response.data);

    return result;
  }

  Future<Response> deleteAccount() async {
    Response response = await dioClient.delete('/auth/delete/');

    return response;
  }

  Future<Response> _loginUser() async {
    try {
      Response response = await dioClient.get('/auth/login/');

      return response;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  Future<Response> _logoutUser() async {
    try {
      Response response = await dioClient.put('/auth/logout/');

      return response;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  void _getFirebaseAuth({required OAuthCredential credential}) async {
    final firebaseAuthCred = await auth.signInWithCredential(credential);
    final token = await firebaseAuthCred.user?.getIdToken();
    final uid = firebaseAuthCred.user?.uid;
    await storage.write(key: LocalStorageKey.token, value: token);
    await storage.write(
      key: LocalStorageKey.tokenTimeout,
      value: DateTime.now().add(const Duration(hours: 1)).toString(),
    );
    await storage.write(key: LocalStorageKey.uid, value: uid);

    await _loginUser();
  }
}

class AuthException implements Exception {
  final String message;

  const AuthException(this.message);
}

@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) {
  return FirebaseAuth.instance;
}

@Riverpod(keepAlive: true)
AuthRepository authRepository(AuthRepositoryRef ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);

  return AuthRepository(auth: firebaseAuth);
}
