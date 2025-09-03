import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/routes/app_routes.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../cubit/onboarding/onboarding_cubit.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.only(top: 20.h, left: 20.w, right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h),
      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
      text: AppStrings.getStarted,
      onTap: () => context.go(AppRoutes.signupRoute),
      width: double.infinity,
    );
  }
}
