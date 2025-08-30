import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../cubit/onboarding/onboarding_cubit.dart';
import 'widgets/onboardin_appbar.dart';
import 'widgets/onboarding_body.dart';
import 'widgets/onboarding_bottom_navigation_bar.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => OnboardingCubit(),
      child: Scaffold(
        appBar: OnboardingAppBar(),
        body: SafeArea(
          minimum: EdgeInsets.only(bottom: 20.h),
          child: Column(
            children: [
              Expanded(child: OnboardingBody()),
              OnboardingBottomNavigationBar(),
            ],
          ),
        ),
      ),
    );
  }
}
