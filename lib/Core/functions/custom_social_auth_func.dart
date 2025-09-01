import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../Features/auth/presentation/cubit/auth/auth_cubit.dart';
import 'custom_ar_snackbar.dart';

Future<void> customSocialAuthFunc(
  BuildContext context,
  SocialAuthType type,
) async {
  final authCubit = BlocProvider.of<AuthCubit>(context);

  switch (type) {
    case SocialAuthType.google:
      await authCubit.signInWithGoogle();
      break;
    case SocialAuthType.facebook:
      await authCubit.signInWithFacebook();
      break;
  }

  if (context.mounted) {
    if (authCubit.state is AuthFailure) {
      customArSnackBar(context, (authCubit.state as AuthFailure).exception.message);
    }
  }
}

enum SocialAuthType { google, facebook }
