import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../cubit/auth/auth_cubit.dart';

class LoginFormButton extends StatelessWidget {
  const LoginFormButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.emailController,
    required this.passwordController,
  });

  final GlobalKey<FormState> formKey;
  final String text;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      padding: const EdgeInsets.all(16),
      text: text,
      onTap: () async {
        await BlocProvider.of<AuthCubit>(context).signInWithFacebook();
        if (BlocProvider.of<AuthCubit>(context).state is AuthSuccess) {
          print((BlocProvider.of<AuthCubit>(context).state as AuthSuccess).userCredential);
        }
        if (BlocProvider.of<AuthCubit>(context).state is AuthFailure) {
          log((BlocProvider.of<AuthCubit>(context).state as AuthFailure).exception.message);
        }
      },
      width: double.infinity,
      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
    );
  }
}
