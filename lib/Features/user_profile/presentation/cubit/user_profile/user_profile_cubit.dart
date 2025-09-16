import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../data/repo/user_profile_repo.dart';

part 'user_profile_state.dart';

class UserProfileCubit extends Cubit<UserProfileState> {
  UserProfileCubit(this.userProfileRepo) : super(UserProfileInitial());
  final UserProfileRepo userProfileRepo;

  Future<void> deleteAccount() async {
    emit(UserProfileLoading());
    final result = await userProfileRepo.deleteUser();
    result.when(
      onSuccess: (_) => emit(UserProfileSuccess()),
      onFailure: (exception) => emit(UserProfileFailure(exception)),
    );
  }

  Future<void> updateProfile({String? displayName}) async {
    emit(UserProfileLoading());
    final result = await userProfileRepo.updateUserDisplayName(displayName: displayName);
    result.when(
      onSuccess: (_) => emit(UserProfileSuccess()),
      onFailure: (exception) => emit(UserProfileFailure(exception)),
    );
  }

  Future<void> signOutUser() async {
    emit(UserProfileLoading());
    final result = await userProfileRepo.signOutUser();
    result.when(
      onSuccess: (_) => emit(UserProfileSuccess()),
      onFailure: (exception) => emit(UserProfileFailure(exception)),
    );
  }
}
