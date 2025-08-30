import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import 'package:google_sign_in/google_sign_in.dart';

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
        try {
          await FirebaseAuth.instance.signOut();
          final user = FirebaseAuth.instance.currentUser;
          if (user != null) {
            log('User is already signed in\n ${user.email} ');
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('User is already signed in\n ${user.email} ')),
              );
            }
            return;
          } else {
            final userCredential = await _signIn();

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

Future<UserCredential> _signIn() async {
  await GoogleSignIn.instance.initialize();

  // Trigger the authentication flow
  final GoogleSignInAccount? googleUser = await GoogleSignIn.instance.authenticate();

  // Obtain the auth details from the request
  final GoogleSignInAuthentication googleAuth = googleUser!.authentication;

  // Create a new credential
  final credential = GoogleAuthProvider.credential(idToken: googleAuth.idToken);

  // Once signed in, return the UserCredential
  return await FirebaseAuth.instance.signInWithCredential(credential);
}
