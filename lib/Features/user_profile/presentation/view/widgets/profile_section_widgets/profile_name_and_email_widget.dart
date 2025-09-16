import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../../Core/constants/app_text_styles.dart';

class ProfileNameAndEmailWidget extends StatelessWidget {
  const ProfileNameAndEmailWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 5.h,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          FirebaseAuth.instance.currentUser?.displayName ?? 'Anonymous User',
          style: AppTextStyles.text16DarkGreenW700,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
        Text(
          FirebaseAuth.instance.currentUser?.email ?? 'Anonymous User',
          style: AppTextStyles.text12DarkGreenW400,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
        ),
      ],
    );
  }
}
