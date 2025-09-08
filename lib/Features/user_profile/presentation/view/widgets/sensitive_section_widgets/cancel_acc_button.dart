import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';

class CancelAcctionButton extends StatelessWidget {
  const CancelAcctionButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () => context.pop(),
      child: Text(
        AppStrings.cancel,
        style: AppTextStyles.text12MediumGreenW700,
      ),
    );
  }
}
