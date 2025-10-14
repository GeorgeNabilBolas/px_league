import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../cubit/auth_cubit/auth_cubit.dart';

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
          await context.read<AuthCubit>().logInWithEmailAndPassword(
            emailController.text,
            passwordController.text,
          );
        }
      },
      width: double.infinity,
      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
    );
  }
}
