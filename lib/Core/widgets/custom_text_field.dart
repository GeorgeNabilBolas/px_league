import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../constants/app_text_styles.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.controller,
    required this.hintText,
    this.validatorFunc,
    this.keyboardType,
    this.obscureText,
    this.suffixIcon,
  });

  final TextEditingController? controller;
  final String hintText;
  final String? Function(String?)? validatorFunc;
  final TextInputType? keyboardType;
  final bool? obscureText;
  final Widget? suffixIcon;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      validator: validatorFunc,
      style: AppTextStyles.text16DarkGreenW700,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        hintTextDirection: TextDirection.rtl,
        hintText: hintText,
        hintStyle: AppTextStyles.text14DarkGreenW400,
        filled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: AppColors.darkGreen),
          borderRadius: BorderRadius.circular(8),
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(width: 2, color: AppColors.darkGreen),
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
