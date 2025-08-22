import 'package:flutter/material.dart';

import '../../data/models/onboarding_model.dart';
import 'widgets/onboardin_appbar.dart';
import 'widgets/onboarding_body/onboarding_body.dart';
import 'widgets/onboarding_body/onboarding_page_view.dart';
import 'widgets/onboarding_bottom_navigation_bar/onboarding_bottom_navigation_bar.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const OnboardingAppBar(),
      body: Column(
        children: [
          Expanded(
            child: OnboardingPageView(),
          ),
          const Padding(
            padding: EdgeInsets.all(40),
            child: OnboardingBottomNavigationBar(),
          ),
        ],
      ),
    );
  }
}
