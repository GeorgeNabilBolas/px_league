import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../constants/app_assets.dart';
import '../constants/app_strings.dart';

class CustomAppLogo extends StatelessWidget {
  const CustomAppLogo({
    super.key,
    required this.textStyle,
    required this.logoSize,
  });
  final TextStyle textStyle;
  final double logoSize;
  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 8.w,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(AppAssets.appIcon, height: logoSize),
        Text(
          AppStrings.appName,
          style: textStyle,
        ),
      ],
    );
  }
}
