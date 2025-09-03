import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../../../../Core/helpers/custom_auth_handler.dart';
import '../../../../data/models/auth_type.dart';

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
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          customAuthHandler(
            context,
            type: SocialAuthType.loginWithEmailAndPassword,
            email: emailController.text,
            password: passwordController.text,
          );
        }
      },
      width: double.infinity,
      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
    );
  }
}
