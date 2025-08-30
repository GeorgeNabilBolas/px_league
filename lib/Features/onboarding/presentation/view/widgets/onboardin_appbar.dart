import 'package:flutter/material.dart';

import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/constants/app_text_styles.dart';
import '../../../../../Core/widgets/custom_app_logo.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: CustomAppLogo(
        logoSize: kToolbarHeight * .75,
        textStyle: AppTextStyles.text31DarkGreenW700,
      ),
      backgroundColor: AppColors.white,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
