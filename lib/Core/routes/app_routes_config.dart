import 'package:firebase_auth/firebase_auth.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/auth/presentation/view/login_view.dart';
import '../../Features/auth/presentation/view/sign_up_view.dart';
import '../../Features/main_page/presentation/view/main_page_view.dart';
import '../../Features/onboarding/presentation/view/onboarding_view.dart';
import '../../Features/privacy_policy/presentation/view/privacy_policy_view.dart';
import '../../Features/terms_and_conditions/presentation/view/terms_and_conditions_view.dart';
import '../../Features/user_profile/presentation/view/user_profile_view.dart';
import '../../Features/image_picker_demo/presentation/view/image_picker_demo_view.dart';
import 'app_routes.dart';

class AppRoutesConfig {
  static Future<GoRouter> createRouter() async {
    return GoRouter(
      initialLocation: await initialRoute(),
      routes: [
        GoRoute(
          path: AppRoutes.initialRoute,
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: AppRoutes.termsRoute,
          builder: (context, state) => const TermsAndConditionsView(),
        ),
        GoRoute(
          path: AppRoutes.privacyRoute,
          builder: (context, state) => const PrivacyPolicyView(),
        ),
        GoRoute(
          path: AppRoutes.loginRoute,
          builder: (context, state) => const LoginView(),
        ),
        GoRoute(
          path: AppRoutes.signupRoute,
          builder: (context, state) => const SignUpView(),
        ),
        GoRoute(
          path: AppRoutes.userProfileRoute,
          builder: (context, state) => const UserProfileView(),
        ),
        GoRoute(
          path: AppRoutes.mainPageRoute,
          builder: (context, state) => const MainPageView(),
        ),
      ],
    );
  }
}

Future<String> initialRoute() async {
  final prefs = await SharedPreferences.getInstance();

  final bool isOnboarded = prefs.getBool('isOnboarded') ?? false;
  final bool isLoggedIn = FirebaseAuth.instance.currentUser != null;
  if (isOnboarded && isLoggedIn) {
    return AppRoutes.mainPageRoute;
  } else if (isOnboarded && !isLoggedIn) {
    return AppRoutes.loginRoute;
  }
  return AppRoutes.initialRoute;
}
