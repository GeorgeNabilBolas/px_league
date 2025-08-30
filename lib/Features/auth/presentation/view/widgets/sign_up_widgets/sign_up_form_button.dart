import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/widgets/custom_button.dart';

class SignUpFormButton extends StatelessWidget {
  const SignUpFormButton({
    super.key,
    required this.formKey,
    required this.text,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final String text;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      padding: const EdgeInsets.all(16),
      text: text,
      onTap: () async {
        try {
          final userCredential = await signInWithFacebook();
          log(
            'isNewUser: ${userCredential.additionalUserInfo?.isNewUser}\n Email: ${userCredential.user?.email}\n DisplayName: ${userCredential.user?.displayName}\n PhotoURL: ${userCredential.user?.photoURL}\n',
          );
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(
                  'isNewUser: ${userCredential.additionalUserInfo?.isNewUser}\n Email: ${userCredential.user?.email}\n DisplayName: ${userCredential.user?.displayName}\n PhotoURL: ${userCredential.user?.photoURL}\n',
                ),
              ),
            );
          }
        } on FirebaseAuthException catch (e) {
          log(e.message.toString());
          if (context.mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(e.toString())),
            );
          }
        }
      },
      width: double.infinity,
      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
    );
  }
}

Future<UserCredential> signInWithFacebook() async {
  // Trigger the sign-in flow
  final LoginResult loginResult = await FacebookAuth.instance.login();

  // Create a credential from the access token
  final OAuthCredential facebookAuthCredential = FacebookAuthProvider.credential(
    loginResult.accessToken?.tokenString ?? '',
  );

  // Once signed in, return the UserCredential
  return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
}
