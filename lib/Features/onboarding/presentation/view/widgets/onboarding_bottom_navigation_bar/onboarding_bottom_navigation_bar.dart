import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';

class OnboardingBottomNavigationBar extends StatelessWidget {
  const OnboardingBottomNavigationBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        TextButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            backgroundColor: WidgetStatePropertyAll(AppColors.white),
          ),
          onPressed: () {},
          child: Text(
            AppStrings.skip,
            style: AppTextStyles.text16GreenBold,
          ),
        ),
        Row(
          children: [
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.darkGreen,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightGreen,
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 8),
              height: 8,
              width: 8,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: AppColors.lightGreen,
              ),
            ),
          ],
        ),
        TextButton(
          style: ButtonStyle(
            shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
            ),
            backgroundColor: WidgetStatePropertyAll(AppColors.darkGreen),
          ),
          onPressed: () {},
          child: Text(
            AppStrings.next,
            style: AppTextStyles.text16WhiteBold,
          ),
        ),
      ],
    );
  }
}
