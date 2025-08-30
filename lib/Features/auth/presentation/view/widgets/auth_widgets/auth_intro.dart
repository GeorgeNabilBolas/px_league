import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_text_styles.dart';

class AuthIntro extends StatelessWidget {
  const AuthIntro({
    super.key,
    required this.title,
    required this.subTitle,
  });

  final String title;
  final String subTitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 8.h,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          textDirection: TextDirection.rtl,
          title,
          style: AppTextStyles.text26DarkGreenW700,
        ),
        Text(
          textDirection: TextDirection.rtl,
          subTitle,
          style: AppTextStyles.text16MediumGreenW700,
        ),
      ],
    );
  }
}
