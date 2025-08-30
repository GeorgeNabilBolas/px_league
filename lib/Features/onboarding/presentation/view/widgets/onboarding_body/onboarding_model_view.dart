import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../data/models/onboarding_model.dart';

class OnboardingModelView extends StatelessWidget {
  const OnboardingModelView({
    super.key,
    required this.onboardingModel,
  });
  final OnboardingModel onboardingModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          onboardingModel.imagePath,
          // width: MediaQuery.of(context).size.width * .8,
          height: MediaQuery.of(context).size.height * .3,
          fit: BoxFit.scaleDown,
        ),
        Text(
          textAlign: TextAlign.center,
          textDirection: TextDirection.rtl,
          onboardingModel.description,
          style: AppTextStyles.text26DarkGreenW700,
        ),
      ],
    );
  }
}
