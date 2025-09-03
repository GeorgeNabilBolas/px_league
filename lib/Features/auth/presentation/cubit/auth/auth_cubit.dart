import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../../../../../Core/errors/firebase_exceptions/auth_exceptions.dart';
import '../../../../../Core/errors/firebase_exceptions/handle_auth_exceptions.dart';
import '../../../data/repo/auth_repo.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.authRepo) : super(AuthInitial());
  final AuthRepo authRepo;

  Future<void> signInWithGoogle() async {
    emit(AuthLoading());
    final result = await authRepo.signInWithGoogle();
    result.when(
      onSuccess: (userCredential) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }

  Future<void> signInWithFacebook() async {
    emit(AuthLoading());
    final result = await authRepo.signInWithFacebook();
    result.when(
      onSuccess: (userCredential) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }

  Future<void> logInWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepo.logInWithEmailAndPassword(email, password);
    result.when(
      onSuccess: (userCredential) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }

  Future<void> signUpWithEmailAndPassword(String email, String password) async {
    emit(AuthLoading());
    final result = await authRepo.signUpWithEmailAndPassword(email, password);
    result.when(
      onSuccess: (userCredential) => emit(AuthSuccess()),
      onFailure: (exception) => emit(AuthFailure(exception)),
    );
  }
}
