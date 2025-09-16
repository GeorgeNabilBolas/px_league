import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../Core/constants/app_assets.dart';
import '../../../../../Core/constants/app_strings.dart';
import '../../../../../Core/constants/app_text_styles.dart';
import '../../../../../Core/helpers/date_formatter.dart';

class TodayMatchesPageTopBar extends StatelessWidget {
  const TodayMatchesPageTopBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Padding(
        padding: EdgeInsets.only(top: 20.h),
        child: Row(
          spacing: 18.w,
          children: [
            SvgPicture.asset(height: 50.h, width: 50.w, AppAssets.mainPageTitleDecoration),
            Column(
              spacing: 6.h,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppStrings.matchesToday, style: AppTextStyles.text24DarkGreenW700),
                Text(DateFormatter.formatTodayAr(), style: AppTextStyles.text12DarkGreenW400),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
