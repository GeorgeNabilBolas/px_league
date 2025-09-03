part of 'auth_cubit.dart';

@immutable
sealed class AuthState {}

final class AuthInitial extends AuthState {}

final class AuthLoading extends AuthState {}

final class AuthSuccess extends AuthState {
  AuthSuccess();
}

final class AuthFailure extends AuthState {
  AuthFailure(this.exception);
  final AuthException exception;
}
