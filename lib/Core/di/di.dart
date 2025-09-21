import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../Features/auth/data/repo/auth_repo.dart';
import '../../Features/auth/data/repo/auth_repo_imp.dart';
import '../../Features/today_matches_page/data/repo/today_matches_repo.dart';
import '../../Features/today_matches_page/data/repo/today_matches_repo_impl.dart';
import '../../Features/user_profile/data/repo/user_profile_repo.dart';
import '../../Features/user_profile/data/repo/user_profile_repo_impl.dart';
import '../networking/api_services.dart';

final getIt = GetIt.instance;

void setupDI() {
  getIt.registerSingleton<FirebaseFirestore>(FirebaseFirestore.instance);
  getIt.registerSingleton<FirebaseAuth>(FirebaseAuth.instance);
  getIt.registerSingleton<GoogleSignIn>(GoogleSignIn.instance);
  getIt.registerSingleton<FacebookAuth>(FacebookAuth.instance);
  getIt.registerSingleton<Dio>(Dio());
  getIt.registerSingleton<ApiService>(ApiService(getIt.get<Dio>()));
  getIt.registerSingleton<TodayMatchesRepo>(TodayMatchesRepoImpl(getIt.get<ApiService>()));
  getIt.registerSingleton<AuthRepo>(
    AuthRepoImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      googleSignIn: getIt.get<GoogleSignIn>(),
      facebookAuth: getIt.get<FacebookAuth>(),
    ),
  );
  getIt.registerSingleton<UserProfileRepo>(
    UserProfileRepoImpl(
      firebaseAuth: getIt.get<FirebaseAuth>(),
      googleSignIn: getIt.get<GoogleSignIn>(),
      firestore: getIt.get<FirebaseFirestore>(),
    ),
  );
}
