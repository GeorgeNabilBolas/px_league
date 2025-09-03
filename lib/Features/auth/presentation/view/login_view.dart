import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../../../Core/constants/app_strings.dart';
import '../../../../Core/constants/app_text_styles.dart';
import '../../../../Core/routes/app_routes.dart';
import 'auth_view.dart';
import 'widgets/auth_widgets/auth_intro.dart';
import 'widgets/auth_widgets/auth_social.dart';
import 'widgets/auth_widgets/auth_with.dart';
import 'widgets/auth_widgets/policies_and_terms.dart';
import 'widgets/login_widgets/login_form.dart';
import 'widgets/auth_widgets/auth_switcher.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return AuthView(
      child: Column(
        spacing: 16.h,
        mainAxisAlignment: MainAxisAlignment.center,
        children: const [
          AuthIntro(
            title: AppStrings.loginTitle,
            subTitle: AppStrings.loginSubTitle,
          ),
          LoginForm(),
          AuthWith(title: AppStrings.orSignUp),
          AuthSocial(),
          PoliciesAndTerms(),
          AuthSwitcher(
            title: AppStrings.noAccount,
            routeName: AppStrings.signup,
            routePath: AppRoutes.signupRoute,
          ),
        ],
      ),
    );
  }
}
