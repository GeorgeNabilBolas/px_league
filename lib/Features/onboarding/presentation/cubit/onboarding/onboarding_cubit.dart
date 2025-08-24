import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../data/models/onboarding_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  late final PageController pageController = PageController();

  void nextPage() {
    if (state < onboardingModelList.length - 1) {
      pageController.nextPage(
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    }
  }

  void skipToEnd() {
    pageController.animateToPage(
      onboardingModelList.length - 1,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
    );
  }

  void onPageChanged(int pageIndex) {
    emit(pageIndex);
  }

  void getStarted() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('isOnboarded', true);
  }

  bool get isLastPage => state == onboardingModelList.length - 1;

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
