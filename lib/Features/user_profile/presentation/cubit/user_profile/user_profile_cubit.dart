import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
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
}
