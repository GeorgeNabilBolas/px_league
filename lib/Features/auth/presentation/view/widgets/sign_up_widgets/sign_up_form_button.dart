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

class SignUpFormButton extends StatelessWidget {
  const SignUpFormButton({
    super.key,
    required this.text,
    required this.formKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;
  final String text;

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      padding: const EdgeInsets.all(16),
      text: text,
      onTap: () async {
        final password = passwordController.text;
        final confirmPassword = confirmPasswordController.text;
        final email = emailController.text;
        final isValid = formKey.currentState!.validate();
        if (isValid) {
          if (password != confirmPassword) {
            customArSnackBar(context, 'كلمة السر غير متطابقة');
          } else {
            await context.read<AuthCubit>().signUpWithEmailAndPassword(email, password);
          }
        }
      },
      width: double.infinity,
      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
    );
  }
}
