import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/constants/app_assets.dart';
import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/constants/app_strings.dart';
import '../../../../../Core/constants/app_text_styles.dart';

class OnboardingAppBar extends StatelessWidget implements PreferredSizeWidget {
  const OnboardingAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Row(
        spacing: 10,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.appIcon, height: kToolbarHeight * .75),
          const Text(
            AppStrings.appName,
            style: AppTextStyles.text31GreenBold,
          ),
        ],
      ),
      backgroundColor: AppColors.white,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
