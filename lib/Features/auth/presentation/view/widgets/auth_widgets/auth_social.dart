import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../../Core/constants/app_assets.dart';

class AuthSocial extends StatelessWidget {
  const AuthSocial({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SvgPicture.asset(
          AppAssets.googleIcon,
          height: 40.h,
          width: 40.w,
        ),
        SvgPicture.asset(
          AppAssets.facebookIcon,
          height: 40.h,
          width: 40.w,
        ),
      ],
    );
  }
}
