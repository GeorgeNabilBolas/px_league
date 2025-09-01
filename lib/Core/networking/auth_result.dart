import '../errors/firebase_exceptions/auth_exceptions.dart';

abstract class AuthResult<T> {
  R when<R>({
    required Function(T data) onSuccess,
    required Function(AuthException exception) onFailure,
  });
}

class AuthSuccess<T> extends AuthResult<T> {
  AuthSuccess(this.data);
  final T data;

  @override
  R when<R>({
    required Function(T data) onSuccess,
    required Function(AuthException exception) onFailure,
  }) {
    return onSuccess(data);
  }
}

class AuthFailure<T> extends AuthResult<T> {
  AuthFailure(this.exception);
  final AuthException exception;

  @override
  R when<R>({
    required Function(T data) onSuccess,
    required Function(AuthException exception) onFailure,
  }) {
    return onFailure(exception);
  }
}
