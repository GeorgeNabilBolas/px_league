import 'package:flutter/material.dart';

import 'onboarding_bottom_navigation_bar/dot_seperator_builder.dart';
import 'onboarding_bottom_navigation_bar/page_view_controller_bar.dart';

class OnboardingBottomNavigationBar extends StatelessWidget {
  const OnboardingBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        DotSeperatorBuilder(),
        PageViewControllerBar(),
      ],
    );
  }
}
