import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/errors/firebase_exceptions/handle_auth_exceptions.dart';
import '../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../Core/helpers/custom_auth_handler.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../auth_widgets/auth_reset_password/auth_reset_password.dart';
import 'login_form_button.dart';
import '../auth_widgets/auth_email_text_field.dart';
import '../auth_widgets/auth_password_text_field.dart';

class LoginForm extends StatefulWidget {
  const LoginForm({
    super.key,
  });

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  late GlobalKey<FormState> formKey;
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    super.initState();
    formKey = GlobalKey<FormState>();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
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
          LoginFormButton(
            formKey: formKey,
            emailController: emailController,
            passwordController: passwordController,
            text: AppStrings.login,
          ),
          const AuthResetPass(),
        ],
      ),
    );
  }
}
