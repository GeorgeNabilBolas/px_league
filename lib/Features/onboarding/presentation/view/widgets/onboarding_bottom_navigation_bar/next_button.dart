import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
      textStyle: AppTextStyles.text16WhiteBold,
      backgroundColor: AppColors.darkGreen,
      text: AppStrings.next,
      onTap: () {
        context.read<OnboardingCubit>().nextPage();
      },
    );
  }
}
