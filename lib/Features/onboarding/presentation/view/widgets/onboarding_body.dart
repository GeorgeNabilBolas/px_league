import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/onboarding_model.dart';
import '../../cubit/onboarding/onboarding_cubit.dart';
import 'onboarding_body/onboarding_model_view.dart';

class OnboardingBody extends StatelessWidget {
  const OnboardingBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();
    return PageView.builder(
      onPageChanged: (value) => onboardingCubit.onPageChanged(value),
      controller: onboardingCubit.pageController,
      itemBuilder: (context, index) {
        return OnboardingModelView(
          onboardingModel: onboardingModelList[index],
        );
      },
      itemCount: onboardingModelList.length,
    );
  }
}
