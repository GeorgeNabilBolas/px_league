import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../Core/errors/firebase_exceptions/handle_auth_exceptions.dart';
import '../../../../Core/helpers/Internet_handler.dart';
import '../../../../Core/networking/auth_result.dart';
import 'auth_repo.dart';

class AuthRepoImpl implements AuthRepo {
  const AuthRepoImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FacebookAuth facebookAuth,
  }) : _firebaseAuth = firebaseAuth,
       _googleSignIn = googleSignIn,
       _facebookAuth = facebookAuth;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FacebookAuth _facebookAuth;

  @override
  Future<AuthResult<UserCredential>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await InternetHandler.isInternetAvailable();

      final result = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthSuccess<UserCredential>(result);
    } catch (e) {
      return AuthFailure<UserCredential>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<UserCredential>> logInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await InternetHandler.isInternetAvailable();
      final result = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      return AuthSuccess<UserCredential>(result);
    } catch (e) {
      return AuthFailure<UserCredential>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<UserCredential>> signInWithFacebook() async {
    try {
      await InternetHandler.isInternetAvailable();
      final LoginResult loginResult = await _facebookAuth.login();
      final credential = FacebookAuthProvider.credential(
        loginResult.accessToken?.tokenString ?? '',
      );
      return AuthSuccess<UserCredential>(await _firebaseAuth.signInWithCredential(credential));
    } catch (e) {
      return AuthFailure<UserCredential>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<UserCredential>> signInWithGoogle() async {
    try {
      await InternetHandler.isInternetAvailable();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      return AuthSuccess<UserCredential>(await _firebaseAuth.signInWithCredential(credential));
    } catch (e) {
      return AuthFailure<UserCredential>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<void>> resetPassword(String email) async {
    try {
      await InternetHandler.isInternetAvailable();
      await _firebaseAuth.sendPasswordResetEmail(email: email);
      return AuthSuccess<void>(null);
    } catch (e) {
      return AuthFailure<void>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }
}
