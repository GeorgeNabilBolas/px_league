import '../errors/api_exceptions/network_exptions.dart';

abstract class ApiResult<T> {
  R when<R>({
    required Function(T data) onSuccess,
    required Function(NetworkExceptions exception) onFailure,
  });
}

class ApiSuccess<T> extends ApiResult<T> {
  ApiSuccess(this.data);
  final T data;

  @override
  R when<R>({
    required Function(T data) onSuccess,
    required Function(NetworkExceptions exception) onFailure,
  }) {
    return onSuccess(data);
  }
}

class ApiFailure<T> extends ApiResult<T> {
  ApiFailure(this.exception);
  final NetworkExceptions exception;

  @override
  R when<R>({
    required Function(T data) onSuccess,
    required Function(NetworkExceptions exception) onFailure,
  }) {
    return onFailure(exception);
  }
}
