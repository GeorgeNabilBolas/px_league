import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../Core/errors/firebase_exceptions/handle_auth_exceptions.dart';
import '../../../../Core/helpers/Internet_handler.dart';
import '../../../../Core/models/user_model.dart';
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
  Future<AuthResult<void>> signUpWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await InternetHandler.isInternetAvailable();
      await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await _addUserToFirestore();
      return AuthSuccess<void>(null);
    } catch (e) {
      return AuthFailure<void>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<void>> logInWithEmailAndPassword(
    String email,
    String password,
  ) async {
    try {
      await InternetHandler.isInternetAvailable();
      await _firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      await _addUserToFirestore();
      return AuthSuccess<void>(null);
    } catch (e) {
      return AuthFailure<void>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<void>> signInWithFacebook() async {
    try {
      await InternetHandler.isInternetAvailable();
      final LoginResult loginResult = await _facebookAuth.login();
      final credential = FacebookAuthProvider.credential(
        loginResult.accessToken?.tokenString ?? '',
      );
      await _firebaseAuth.signInWithCredential(credential);
      await _addUserToFirestore();
      return AuthSuccess<void>(null);
    } catch (e) {
      return AuthFailure<void>(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }

  @override
  Future<AuthResult<void>> signInWithGoogle() async {
    try {
      await InternetHandler.isInternetAvailable();
      final GoogleSignInAccount googleUser = await _googleSignIn.authenticate();
      final GoogleSignInAuthentication googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      await _firebaseAuth.signInWithCredential(credential);
      await _addUserToFirestore();
      return AuthSuccess<void>(null);
    } catch (e) {
      return AuthFailure<void>(HandleAuthExceptions.getAuthExceptionType(e));
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

  Future<void> _addUserToFirestore() async {
    final user = await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .get();
    await FirebaseFirestore.instance
        .collection('users')
        .doc(_firebaseAuth.currentUser?.uid)
        .set(
          UserModel(
            email: user.data()?['email'] ?? _firebaseAuth.currentUser?.email,
            displayName: user.data()?['displayName'] ?? _firebaseAuth.currentUser?.displayName,
            photoURL: user.data()?['photoURL'] ?? _firebaseAuth.currentUser?.photoURL,
            uid: user.data()?['uid'] ?? _firebaseAuth.currentUser?.uid,
            totalPoints: user.data()?['totalPoints'] ?? 25,
          ).toMap(),
        );
  }
}
