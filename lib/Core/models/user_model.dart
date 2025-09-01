import 'package:firebase_auth/firebase_auth.dart';

class UserModel {
  final String uid;
  final String email;
  final String? displayName;
  final String? photoURL;
  final bool emailVerified;

  const UserModel({
    required this.uid,
    required this.email,
    this.displayName,
    this.photoURL,
    required this.emailVerified,
  });

  factory UserModel.fromFirebaseUser(UserCredential firebaseUser) {
    return UserModel(
      uid: firebaseUser.user!.uid,
      email: firebaseUser.user!.email ?? '',
      displayName: firebaseUser.user!.displayName,
      photoURL: firebaseUser.user!.photoURL,
      emailVerified: firebaseUser.user!.emailVerified,
    );
  }
}
