import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/app_colors.dart';
import 'profile_section_widget.dart/profile_edit_button_widget.dart';
import 'profile_section_widget.dart/profile_statistics_widget.dart';
import 'profile_section_widget.dart/profile_user_data_widget.dart';

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGold,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 20.h,
        children: [
          const ProfileUserDataWidget(),
          const ProfileStatisticsWidget(),
          const ProfileEditButtonWidget(),
        ],
      ),
    );
  }
}
