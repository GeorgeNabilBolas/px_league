import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../cubit/onboarding/onboarding_cubit.dart';
import 'get_started_button.dart';
import 'next_button.dart';
import 'skip_button.dart';

class PageViewControllerBar extends StatelessWidget {
  const PageViewControllerBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final onboardingCubit = context.read<OnboardingCubit>();

    return BlocBuilder<OnboardingCubit, int>(
      builder: (context, state) {
        if (onboardingCubit.isLastPage) {
          return const GetStartedButton();
        } else {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              SkipButton(),
              NextButton(),
            ],
          );
        }
      },
    );
  }
}
