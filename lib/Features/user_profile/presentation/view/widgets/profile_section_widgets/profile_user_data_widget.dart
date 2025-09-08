import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'profile_image_widget.dart';
import 'profile_name_and_email_widget.dart';

class ProfileUserDataWidget extends StatelessWidget {
  const ProfileUserDataWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 15.w,
      children: const [
        ProfileImage(),
        Expanded(child: ProfileNameAndEmailWidget()),
      ],
    );
  }
}
