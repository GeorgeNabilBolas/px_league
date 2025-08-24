import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../Features/login/presentation/view/login_view.dart';
import '../../Features/onboarding/presentation/view/onboarding_view.dart';

class AppRoutes {
  static Future<GoRouter> createRouter() async {
    final prefs = await SharedPreferences.getInstance();
    final bool isOnboarded = prefs.getBool('isOnboarded') ?? false;

    return GoRouter(
      initialLocation: isOnboarded ? '/login' : '/onboarding',
      routes: [
        GoRoute(
          path: '/onboarding',
          builder: (context, state) => const OnboardingView(),
        ),
        GoRoute(
          path: '/login',
          builder: (context, state) => const LoginView(),
        ),
      ],
    );
  }
}
