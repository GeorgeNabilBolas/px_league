import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_text_styles.dart';

class AuthWith extends StatelessWidget {
  const AuthWith({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      children: [
        const Expanded(
          child: Divider(
            color: AppColors.mediumGreen,
          ),
        ),
        Text(
          title,
          style: AppTextStyles.text12DarkGreenW400,
        ),
        const Expanded(
          child: Divider(
            color: AppColors.mediumGreen,
          ),
        ),
      ],
    );
  }
}
