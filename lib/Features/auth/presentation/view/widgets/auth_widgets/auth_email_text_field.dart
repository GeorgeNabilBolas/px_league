import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/widgets/custom_text_field.dart';

class AuthEmailTextField extends StatelessWidget {
  const AuthEmailTextField({
    super.key,
    required this.controller,
  });

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: controller,
      hintText: AppStrings.email,
      validatorFunc: (value) {
        if (value!.isEmpty) {
          return AppStrings.requiredEmail;
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
