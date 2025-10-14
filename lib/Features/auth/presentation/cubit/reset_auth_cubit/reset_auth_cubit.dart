import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../data/repo/auth_repo.dart';

part 'reset_auth_state.dart';

class ResetAuthCubit extends Cubit<ResetAuthState> {
  ResetAuthCubit(this.authRepo) : super(ResetAuthInitial());
  final AuthRepo authRepo;

  Future<void> resetPassword(String email) async {
    emit(ResetAuthLoading());
    final result = await authRepo.resetPassword(email);
    result.when(
      onSuccess: (_) => emit(ResetAuthSuccess()),
      onFailure: (exception) => emit(ResetAuthFailure(exception)),
    );
  }
}
