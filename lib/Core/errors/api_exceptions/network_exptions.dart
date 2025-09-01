abstract class NetworkExceptions {
  const NetworkExceptions();
  String get message;
}

class RequestCancelledException extends NetworkExceptions {
  const RequestCancelledException();
  @override
  String get message => "Request cancelled";
}

class UnauthorizedRequestException extends NetworkExceptions {
  const UnauthorizedRequestException(this.reason);
  final String reason;
  @override
  String get message => reason;
}

class BadRequestException extends NetworkExceptions {
  const BadRequestException();
  @override
  String get message => "Bad request";
}

class NotFoundException extends NetworkExceptions {
  const NotFoundException(this.reason);
  final String reason;
  @override
  String get message => reason;
}

class MethodNotAllowedException extends NetworkExceptions {
  const MethodNotAllowedException();
  @override
  String get message => "Method not allowed";
}

class NotAcceptableException extends NetworkExceptions {
  const NotAcceptableException();
  @override
  String get message => "Not acceptable";
}

class RequestTimeoutException extends NetworkExceptions {
  const RequestTimeoutException();
  @override
  String get message => "Connection request timeout";
}

class SendTimeoutException extends NetworkExceptions {
  const SendTimeoutException();
  @override
  String get message => "Send timeout in connection with API server";
}

class UnprocessableEntityException extends NetworkExceptions {
  const UnprocessableEntityException(this.reason);
  final String reason;
  @override
  String get message => reason;
}

class ConflictException extends NetworkExceptions {
  const ConflictException();

  @override
  String get message => "Error due to a conflict";
}

class InternalServerErrorException extends NetworkExceptions {
  const InternalServerErrorException();
  @override
  String get message => "Internal server error";
}

class NotImplementedException extends NetworkExceptions {
  const NotImplementedException();
  @override
  String get message => "Not implemented";
}

class ServiceUnavailableException extends NetworkExceptions {
  const ServiceUnavailableException();
  @override
  String get message => "Service unavailable";
}

class NoInternetConnectionException extends NetworkExceptions {
  const NoInternetConnectionException();
  @override
  String get message => "No internet connection";
}

class FormatException extends NetworkExceptions {
  const FormatException();
  @override
  String get message => "Format exception occurred";
}

class UnableToProcessException extends NetworkExceptions {
  const UnableToProcessException();
  @override
  String get message => "Unable to process the data";
}

class DefaultErrorException extends NetworkExceptions {
  const DefaultErrorException(this.error);
  final String error;
  @override
  String get message => error;
}

class UnexpectedErrorException extends NetworkExceptions {
  const UnexpectedErrorException();
  @override
  String get message => "Unexpected error occurred";
}
