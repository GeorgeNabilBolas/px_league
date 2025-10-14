import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../../Core/constants/app_colors.dart';
import '../../../../../../../Core/constants/app_strings.dart';
import '../../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../../Core/widgets/custom_button.dart';
import '../../../../cubit/reset_auth_cubit/reset_auth_cubit.dart';
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
    return BlocListener<ResetAuthCubit, ResetAuthState>(
      listener: (context, state) => state.handleState(context),
      child: Padding(
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
              onTap: () async =>
                  await context.read<ResetAuthCubit>().resetPassword(emailController.text),
              width: double.infinity,
              textStyle: AppTextStyles.text16WhiteW700,
              backgroundColor: AppColors.darkGreen,
            ),
          ],
        ),
      ),
    );
  }
}
