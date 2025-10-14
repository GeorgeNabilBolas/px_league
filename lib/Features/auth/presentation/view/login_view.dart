import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../Core/constants/app_strings.dart';
import '../../../../Core/routes/app_routes.dart';
import '../cubit/auth_cubit/auth_cubit.dart';
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
      child: BlocListener<AuthCubit, AuthState>(
        listener: (context, state) => state.handleState(context),
        child: Column(
          spacing: 16.h,
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            AuthIntro(title: AppStrings.loginTitle, subTitle: AppStrings.loginSubTitle),
            LoginForm(),
            AuthWith(),
            AuthSocial(),
            PoliciesAndTerms(),
            AuthSwitcher(
              title: AppStrings.noAccount,
              routeName: AppStrings.signup,
              routePath: AppRoutes.signupRoute,
            ),
          ],
        ),
      ),
    );
  }
}
