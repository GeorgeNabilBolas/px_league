import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/di/di.dart';
import '../../../../../../Core/helpers/validations/email_validator.dart';
import '../../../../../../Core/helpers/validations/validation_rule.dart';
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
        if (!EmailValidator.isValid(value)) {
          return EmailValidator.getValidationError();
        }
        return null;
      },
      keyboardType: TextInputType.emailAddress,
    );
  }
}
