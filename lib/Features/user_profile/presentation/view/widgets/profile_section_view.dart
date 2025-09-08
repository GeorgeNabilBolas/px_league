import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../Core/constants/app_colors.dart';
import 'profile_section_widgets/profile_edit_button_widget.dart';
import 'profile_section_widgets/profile_statistics_widget.dart';
import 'profile_section_widgets/profile_user_data_widget.dart';

class ProfileSectionView extends StatelessWidget {
  const ProfileSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: AppColors.lightGreen,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        spacing: 20.h,
        children: const [
          ProfileUserDataWidget(),
          ProfileStatisticsWidget(),
          ProfileEditButtonWidget(),
        ],
      ),
    );
  }
}
