import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_strings.dart';
import 'sign_up_form_button.dart';
import '../auth_widgets/auth_email_text_field.dart';
import '../auth_widgets/auth_password_text_field.dart';

class SignUpForm extends StatefulWidget {
  const SignUpForm({
    super.key,
  });

  @override
  State<SignUpForm> createState() => _SignUpFormState();
}

class _SignUpFormState extends State<SignUpForm> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;
  late TextEditingController confirmPasswordController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
    confirmPasswordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        spacing: 12.h,
        children: [
          AuthEmailTextField(
            controller: emailController,
          ),
          AuthPasswordTextField(
            hintText: AppStrings.password,
            controller: passwordController,
          ),
          AuthPasswordTextField(
            hintText: AppStrings.confirmPassword,
            controller: confirmPasswordController,
          ),
          SignUpFormButton(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            confirmPasswordController: confirmPasswordController,
            text: AppStrings.signup,
          ),
        ],
      ),
    );
  }
}
