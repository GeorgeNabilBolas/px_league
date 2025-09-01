part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  final UserCredential userCredential;
  AuthSuccess(this.userCredential);
}

final class AuthFailure extends AuthState {
  final AuthException exception;
  AuthFailure(this.exception);
}
