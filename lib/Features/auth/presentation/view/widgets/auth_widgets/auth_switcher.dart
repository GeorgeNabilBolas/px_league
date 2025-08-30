import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../../Core/constants/app_text_styles.dart';

class AuthSwitcher extends StatelessWidget {
  const AuthSwitcher({
    super.key,
    required this.title,
    required this.routeName,
    required this.routePath,
  });
  final String title;
  final String routeName;
  final String routePath;
  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textDirection: TextDirection.rtl,
      textAlign: TextAlign.center,
      TextSpan(
        children: [
          TextSpan(
            text: title,
            style: AppTextStyles.text12DarkGreenW400,
          ),
          TextSpan(
            recognizer: TapGestureRecognizer()..onTap = () => context.go(routePath),
            text: routeName,
            style: AppTextStyles.text12MediumGreenW900,
          ),
        ],
      ),
    );
  }
}
