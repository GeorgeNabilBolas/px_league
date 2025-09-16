import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../Features/auth/presentation/cubit/auth/auth_cubit.dart';
import '../models/auth_modal.dart';
import '../routes/app_routes.dart';
import 'custom_ar_snackbar.dart';

void customAuthHandler(
  BuildContext context, {
  required AuthModal authModal,
}) {
  final authCubit = BlocProvider.of<AuthCubit>(context);
  if (authCubit.state is AuthLoading || authCubit.state is AuthSuccess) {
    return;
  }
  _handleAuthStates(context, authModal.type);
  _selectAuthType(context, authModal);
}

void _selectAuthType(BuildContext context, AuthModal authModal) {
  final authCubit = BlocProvider.of<AuthCubit>(context);

  switch (authModal.type) {
    case SocialAuthType.google:
      authCubit.signInWithGoogle();
      break;
    case SocialAuthType.facebook:
      authCubit.signInWithFacebook();
      break;
    case SocialAuthType.signupWithEmailAndPassword:
      authCubit.signUpWithEmailAndPassword(authModal.email!, authModal.password!);
      break;
    case SocialAuthType.loginWithEmailAndPassword:
      authCubit.logInWithEmailAndPassword(authModal.email!, authModal.password!);
      break;
    case SocialAuthType.resetPassword:
      authCubit.resetPassword(authModal.email!);
      break;
  }
}

void _handleAuthStates(BuildContext context, SocialAuthType type) {
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
          _authSuccessHandler(context, subscription, type);
          break;
      }
    }
  });
}

void _authSuccessHandler(
  BuildContext context,
  StreamSubscription<dynamic> subscription,
  SocialAuthType type,
) {
  if (type == SocialAuthType.resetPassword) {
    _resetPasswordSuccessHandler(context);
  } else {
    if (context.mounted) {
      context.go(AppRoutes.mainPageRoute);
    }
  }
  subscription.cancel();
}

void _resetPasswordSuccessHandler(BuildContext context) {
  customArSnackBar(context, 'تم ارسال رابط التحقق إلى بريدك الالكتروني');
  Navigator.pop(context);
}
