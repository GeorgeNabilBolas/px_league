import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';

class ProfileStatisticsCard extends StatelessWidget {
  const ProfileStatisticsCard({super.key, required this.value, required this.label});

  final String value;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 8),
      decoration: BoxDecoration(
        color: AppColors.darkGold,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        children: [
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            value,
            style: AppTextStyles.text16WhiteW700,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
            label,
            style: AppTextStyles.text12WhiteW400,
          ),
        ],
      ),
    );
  }
}
