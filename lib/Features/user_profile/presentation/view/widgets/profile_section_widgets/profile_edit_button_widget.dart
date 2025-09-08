import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';

class ProfileEditButtonWidget extends StatelessWidget {
  const ProfileEditButtonWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton.icon(
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        foregroundColor: const WidgetStatePropertyAll(AppColors.white),
        backgroundColor: const WidgetStatePropertyAll(AppColors.mediumGreen),
      ),
      label: const Text(AppStrings.edit),
      icon: const Icon(Icons.edit),
      onPressed: () {},
    );
  }
}
