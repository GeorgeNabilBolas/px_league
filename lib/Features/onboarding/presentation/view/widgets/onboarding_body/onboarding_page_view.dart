import 'package:flutter/material.dart';

import '../../../../data/models/onboarding_model.dart';
import 'onboarding_body.dart';

class OnboardingPageView extends StatelessWidget {
  const OnboardingPageView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
      itemBuilder: (context, index) {
        return OnboardinBody(
          onboardingModel: onboardingModelList[index],
        );
      },
      itemCount: onboardingModelList.length,
    );
  }
}
