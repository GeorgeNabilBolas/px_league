import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/auth/presentation/cubit/auth/auth_cubit.dart';
import '../errors/firebase_exceptions/auth_exceptions.dart';
import '../routes/app_routes.dart';
import 'custom_ar_snackbar.dart';
import 'Internet_handler.dart';

Future<void> customAuthHandler(
  BuildContext context, {
  required SocialAuthType type,
  String? email,
  String? password,
}) async {
  _checkInternetConnection(context);
  final authCubit = BlocProvider.of<AuthCubit>(context);
  if (authCubit.state is AuthLoading || authCubit.state is AuthSuccess) return;
  _handleAuthStates(context);
  _selectAuthType(context, type, email, password);
}

void _selectAuthType(BuildContext context, SocialAuthType type, String? email, String? password) {
  final authCubit = BlocProvider.of<AuthCubit>(context);

  switch (type) {
    case SocialAuthType.google:
      authCubit.signInWithGoogle();
      break;
    case SocialAuthType.facebook:
      authCubit.signInWithFacebook();
      break;
    case SocialAuthType.signupWithEmailAndPassword:
      authCubit.signUpWithEmailAndPassword(email!, password!);
      break;
    case SocialAuthType.loginWithEmailAndPassword:
      authCubit.logInWithEmailAndPassword(email!, password!);
      break;
  }
}

void _handleAuthStates(BuildContext context) {
  final authCubit = BlocProvider.of<AuthCubit>(context);
  final stateStream = authCubit.stream;
  late StreamSubscription subscription;

  subscription = stateStream.listen((state) {
    if (context.mounted) {
      switch (state) {
        case AuthInitial():
          break;
        case AuthLoading():
          customArSnackBar(context, 'جاري التحميل...');
          break;
        case AuthFailure():
          customArSnackBar(context, state.exception.message);
          subscription.cancel();
          break;
        case AuthSuccess():
          context.go(AppRoutes.userProfileRoute);
          subscription.cancel();
          break;
      }
    }
  });
}

void _checkInternetConnection(BuildContext context) async {
  final internetAvailable = await InternetHandler.isInternetAvailable();
  if (!context.mounted) return;
  if (!internetAvailable) {
    customArSnackBar(context, const NoInternetException().message);
  }
}

enum SocialAuthType {
  google,
  facebook,
  signupWithEmailAndPassword,
  loginWithEmailAndPassword,
}
