import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../cubit/onboarding/onboarding_cubit.dart';

class NextButton extends StatelessWidget {
  const NextButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      margin: EdgeInsets.only(top: 20.h, right: 20.w),
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),

      textStyle: AppTextStyles.text16WhiteW700,
      backgroundColor: AppColors.darkGreen,
      text: AppStrings.next,
      onTap: () {
        context.read<OnboardingCubit>().nextPage();
      },
    );
  }
}
