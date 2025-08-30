import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/widgets/custom_text_field.dart';

class AuthPasswordTextField extends StatefulWidget {
  const AuthPasswordTextField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  final String hintText;
  final TextEditingController controller;

  @override
  State<AuthPasswordTextField> createState() => _AuthPasswordTextFieldState();
}

class _AuthPasswordTextFieldState extends State<AuthPasswordTextField> {
  bool _isPasswordObscured = true;
  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      obscureText: _isPasswordObscured,
      suffixIcon: IconButton(
        onPressed: () => setState(() => _isPasswordObscured = !_isPasswordObscured),
        icon: Icon(_isPasswordObscured ? Icons.visibility_off : Icons.visibility),
      ),
      validatorFunc: (value) {
        if (value!.isEmpty) {
          return AppStrings.requiredPassword;
        }
        return null;
      },
      keyboardType: TextInputType.visiblePassword,
    );
  }
}
