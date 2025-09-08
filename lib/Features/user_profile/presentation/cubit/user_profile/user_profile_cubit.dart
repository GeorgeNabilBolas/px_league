import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../../Core/helpers/Internet_handler.dart';
import '../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../Core/routes/app_routes.dart';
import '../../../data/repo/user_profile_repo.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.userProfileRepo) : super(UserProfileInitial());
  final UserProfileRepo userProfileRepo;
  Future<void> deleteAccount() async {
    emit(UserProfileLoading());
    final result = await userProfileRepo.deleteAccount();
    result.when(
      onSuccess: (userCredential) => emit(UserProfileSuccess()),
      onFailure: (exception) => emit(UserProfileFailure(exception)),
    );
  }

  void stateHandler(UserProfileState state, BuildContext context) {
    switch (state) {
      case UserProfileInitial():
      case UserProfileLoading():
        showAdaptiveDialog(
          context: context,
          barrierDismissible: false,
          builder: (context) => const Center(
            child: CircularProgressIndicator(),
          ),
        );
        break;
      case UserProfileSuccess():
        while (context.canPop()) {
          context.pop();
        }
        context.go(AppRoutes.signupRoute);
        break;
      case UserProfileFailure():
        while (context.canPop()) {
          context.pop();
        }
        customArSnackBar(context, state.exception.message);
        break;
    }
  }
}
