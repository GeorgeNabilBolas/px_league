import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../../Core/helpers/custom_ar_snackbar.dart';
import '../../../../../Core/helpers/custom_loading_dialog.dart';
import '../../../../../Core/routes/app_routes.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final result = await authRepo.signInWithGoogle();
    result.when(
      onSuccess: (_) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    final result = await authRepo.signInWithFacebook();
    result.when(
      onSuccess: (_) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepo.logInWithEmailAndPassword(email, password);
    result.when(
      onSuccess: (_) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepo.signUpWithEmailAndPassword(email, password);
    result.when(
      onSuccess: (_) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }
}
