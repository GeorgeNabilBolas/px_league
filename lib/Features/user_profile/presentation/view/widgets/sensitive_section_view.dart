import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'sensitive_section_widgets/delete_acc_list_tile.dart';
import 'sensitive_section_widgets/logout_acc_action_button.dart';

class SensitiveSectionView extends StatelessWidget {
  const SensitiveSectionView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 20.h,
      children: const [
        LogoutAccListTile(),
        DeleteAccListTile(),
      ],
    );
  }
}
