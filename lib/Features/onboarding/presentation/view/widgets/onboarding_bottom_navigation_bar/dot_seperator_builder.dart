import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../data/models/onboarding_model.dart';
import '../../../cubit/onboarding/onboarding_cubit.dart';
import 'dot_widget.dart';

class DotSeperatorBuilder extends StatelessWidget {
  const DotSeperatorBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        onboardingModelList.length,
        (index) => DotWidget(isActive: index == context.watch<OnboardingCubit>().state),
      ),
    );
  }
}
