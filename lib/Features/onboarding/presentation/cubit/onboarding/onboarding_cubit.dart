import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/onboarding_model.dart';

class OnboardingCubit extends Cubit<int> {
  OnboardingCubit() : super(0);

  void changePage(int page) => emit(page);

  void nextPage() {
    if (state < onboardingModelList.length - 1) {
      emit(state + 1);
    }
  }

  void skip() => emit(onboardingModelList.length - 1);
}
