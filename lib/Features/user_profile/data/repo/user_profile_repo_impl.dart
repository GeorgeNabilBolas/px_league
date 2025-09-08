import '../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../Core/helpers/Internet_handler.dart';
import '../../../../Core/networking/auth_result.dart';
import 'user_profile_repo.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../../../../Core/errors/firebase_exceptions/handle_auth_exceptions.dart';
import '../../../../Core/di/di.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  const UserProfileRepoImpl({
    required FirebaseAuth firebaseAuth,
    required GoogleSignIn googleSignIn,
    required FirebaseFirestore firestore,
  }) : _firebaseAuth = firebaseAuth,
       _googleSignIn = googleSignIn,
       _firestore = firestore;
  final FirebaseAuth _firebaseAuth;
  final GoogleSignIn _googleSignIn;
  final FirebaseFirestore _firestore;
  @override
  Future<AuthResult<void>> deleteAccount() async {
    try {
      await InternetHandler.isInternetAvailable();
      final googleUser = await _googleSignIn.authenticate();
      final googleAuth = googleUser.authentication;
      final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);
      await _firebaseAuth.currentUser?.reauthenticateWithCredential(credential);
      await _firestore.collection('users').doc(_firebaseAuth.currentUser?.uid).delete();
      return AuthSuccess(await _firebaseAuth.currentUser?.delete());
    } catch (e) {
      return AuthFailure(HandleAuthExceptions.getAuthExceptionType(e));
    }
  }
}
