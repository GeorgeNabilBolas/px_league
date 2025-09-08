import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_strings.dart';
import 'profile_statistics_card.dart';

class ProfileStatisticsWidget extends StatelessWidget {
  const ProfileStatisticsWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: const [
        Expanded(
          child: ProfileStatisticsCard(
            value: '73%',
            label: AppStrings.accuracy,
          ),
        ),
        Expanded(
          child: ProfileStatisticsCard(
            value: '15',
            label: AppStrings.attempts,
          ),
        ),
        Expanded(
          child: ProfileStatisticsCard(
            value: '45',
            label: AppStrings.points,
          ),
        ),
      ],
    );
  }
}
