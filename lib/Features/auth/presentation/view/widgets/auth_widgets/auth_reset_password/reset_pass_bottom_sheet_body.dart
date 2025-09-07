import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../Core/constants/app_colors.dart';
import '../../../../../../../Core/constants/app_strings.dart';
import '../../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../../../Core/helpers/custom_auth_handler.dart';
import '../../../../../../../Core/models/auth_modal.dart';
import '../../../../../../../Core/widgets/custom_button.dart';
import '../auth_email_text_field.dart';

class ResetPassBottomSheetBody extends StatefulWidget {
  const ResetPassBottomSheetBody({super.key});

  @override
  State<ResetPassBottomSheetBody> createState() => _ResetPassBottomSheetBodyState();
}

class _ResetPassBottomSheetBodyState extends State<ResetPassBottomSheetBody> {
  late TextEditingController emailController;

  @override
  void initState() {
    super.initState();
    emailController = TextEditingController();
  }

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        spacing: 12.h,
        children: [
          Text(
            textDirection: TextDirection.rtl,
            AppStrings.forgotPasswordTitle,
            style: AppTextStyles.text16DarkGreenW700,
          ),
          Text(
            textDirection: TextDirection.rtl,
            AppStrings.forgotPasswordSubTitle,
            style: AppTextStyles.text12DarkGreenW400,
          ),
          AuthEmailTextField(
            controller: emailController,
          ),
          CustomButton(
            padding: const EdgeInsets.all(16),
            text: AppStrings.send,
            onTap: () async => customAuthHandler(
              context,
              authModal: AuthModal(
                type: SocialAuthType.resetPassword,
                email: emailController.text,
              ),
            ),
            width: double.infinity,
            textStyle: AppTextStyles.text16WhiteW700,
            backgroundColor: AppColors.darkGreen,
          ),
        ],
      ),
    );
  }
}
