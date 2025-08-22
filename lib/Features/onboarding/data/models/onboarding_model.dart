// lib/model/onboarding_model.dart

import '../../../../Core/constants/app_assets.dart';
import '../../../../Core/constants/app_strings.dart';

class OnboardingModel {
  const OnboardingModel({
    required this.imagePath,
    required this.description,
  });
  final String imagePath;
  final String description;
}

List<OnboardingModel> onboardingModelList = [
  const OnboardingModel(
    imagePath: AppAssets.onboarding1,
    description: AppStrings.onboarding1Title,
  ),
  const OnboardingModel(
    imagePath: AppAssets.onboarding2,
    description: AppStrings.onboarding2Title,
  ),
  const OnboardingModel(
    imagePath: AppAssets.onboarding3,
    description: AppStrings.onboarding3Title,
  ),
];
