import 'package:flutter/material.dart';
import 'Core/constants/app_colors.dart';
import 'Features/onboarding/presentation/view/onboarding_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PX League',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Cairo',
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.darkGreen),
        scaffoldBackgroundColor: Colors.white,
        primaryColor: AppColors.darkGreen,
      ),
      home: const OnboardingView(),
    );
  }
}
