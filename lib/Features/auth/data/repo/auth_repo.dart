import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/networking/auth_result.dart';

abstract class AuthRepo {
  Future<AuthResult<void>> signInWithGoogle();
  Future<AuthResult<void>> signInWithFacebook();
  Future<AuthResult<void>> logInWithEmailAndPassword(String email, String password);
  Future<AuthResult<void>> signUpWithEmailAndPassword(String email, String password);
  Future<AuthResult<void>> resetPassword(String email);
}
