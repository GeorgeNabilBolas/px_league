import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../Core/constants/app_strings.dart';
import '../../../../Core/routes/app_routes.dart';
import 'auth_view.dart';
import 'widgets/auth_widgets/auth_intro.dart';
import 'widgets/auth_widgets/auth_social.dart';
import 'widgets/auth_widgets/auth_switcher.dart';
import 'widgets/auth_widgets/auth_with.dart';
import 'widgets/auth_widgets/policies_and_terms.dart';
import 'widgets/sign_up_widgets/sign_up_form.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AuthView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        spacing: 16.h,
        children: const [
          AuthIntro(
            title: AppStrings.signupTitle,
            subTitle: AppStrings.signupSubTitle,
          ),
          SignUpForm(),
          AuthWith(title: AppStrings.orSignUp),
          AuthSocial(),
          PoliciesAndTerms(),
          AuthSwitcher(
            title: AppStrings.alreadyHaveAccount,
            routeName: AppStrings.login,
            routePath: AppRoutes.loginRoute,
          ),
        ],
      ),
    );
  }
}
