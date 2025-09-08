import 'package:flutter/material.dart';

import '../../../../../../Core/constants/app_colors.dart';
import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import 'cancel_acc_button.dart';
import 'delete_acc_action_button.dart';

class DeleteAccDialog extends StatelessWidget {
  const DeleteAccDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      title: Text(
        textDirection: TextDirection.rtl,
        AppStrings.deleteAccountTitle,
        style: AppTextStyles.text16DarkGreenW700,
      ),
      content: Text(
        textDirection: TextDirection.rtl,
        AppStrings.deleteAccountAlert,
        style: AppTextStyles.text14MediumGreenW700,
      ),

      actions: const [
        CancelAcctionButton(),
        DeleteAccountActionButton(),
      ],
    );
  }
}
