import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_strings.dart';
import '../../../../../../Core/constants/app_text_styles.dart';
import '../../../../../../Core/routes/app_routes.dart';

class PoliciesAndTerms extends StatelessWidget {
  const PoliciesAndTerms({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: AppStrings.agreeTermsAndConditions,
            style: AppTextStyles.text12DarkGreenW400,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => context.push(AppRoutes.termsRoute),
            text: AppStrings.termsAndConditions,
            style: AppTextStyles.text12MediumGreenW900,
          ),
          TextSpan(
            text: AppStrings.and,
            style: AppTextStyles.text12DarkGreenW400,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => context.push(AppRoutes.privacyRoute),
            text: AppStrings.privacyPolicy,
            style: AppTextStyles.text12MediumGreenW900,
          ),
        ],
      ),
    );
  }
}
