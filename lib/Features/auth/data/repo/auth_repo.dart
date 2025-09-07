import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/networking/auth_result.dart';

abstract class AuthRepo {
  Future<AuthResult<UserCredential>> signInWithGoogle();
  Future<AuthResult<UserCredential>> signInWithFacebook();
  Future<AuthResult<UserCredential>> logInWithEmailAndPassword(String email, String password);
  Future<AuthResult<UserCredential>> signUpWithEmailAndPassword(String email, String password);
  Future<AuthResult<void>> resetPassword(String email);
}
