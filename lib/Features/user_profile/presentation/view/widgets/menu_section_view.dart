import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/constants/app_colors.dart';
import '../../../../../Core/constants/app_strings.dart';
import '../../../../../Core/routes/app_routes.dart';
import '../../../../../Core/widgets/custom_list_tile.dart';

class MenuSectionView extends StatelessWidget {
  const MenuSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: [
        CustomListTile(
          icon: Icons.security,
          title: AppStrings.privacyPolicy,
          backgroundColor: AppColors.darkGreen,
          onTap: () => context.push(AppRoutes.privacyRoute),
        ),
        CustomListTile(
          icon: Icons.help_outline,
          title: AppStrings.termsAndConditions,
          backgroundColor: AppColors.darkGreen,
          onTap: () => context.push(AppRoutes.termsRoute),
        ),
        const CustomListTile(
          icon: Icons.star_outline,
          title: AppStrings.rateApp,
          backgroundColor: AppColors.darkGreen,
        ),
        const CustomListTile(
          icon: Icons.share,
          title: AppStrings.shareApp,
          backgroundColor: AppColors.darkGreen,
        ),
      ],
    );
  }
}
