import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/widgets/custom_button.dart';
import '../../../cubit/onboarding/onboarding_cubit.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CustomButton(
      textStyle: AppTextStyles.text16GreenBold,
      backgroundColor: AppColors.white,
      text: AppStrings.skip,
      onTap: () {
        context.read<OnboardingCubit>().skipToEnd();
      },
    );
  }
}
