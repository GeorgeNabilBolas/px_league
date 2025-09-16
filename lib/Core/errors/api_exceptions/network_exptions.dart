abstract class NetworkExceptions {
  const NetworkExceptions();
  String get message;
}

class RequestCancelledException extends NetworkExceptions {
  const RequestCancelledException();
  @override
  String get message => "تم الالغاء الاتصال بالخادم";
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
  String get message => "خطا في طلب البيانات";
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
  String get message => "غير مسموح بالطريقة المستخدمة";
}

class NotAcceptableException extends NetworkExceptions {
  const NotAcceptableException();
  @override
  String get message => "غير مقبول";
}

class RequestTimeoutException extends NetworkExceptions {
  const RequestTimeoutException();
  @override
  String get message => "خطا في وقف الاتصال بالخادم";
}

class SendTimeoutException extends NetworkExceptions {
  const SendTimeoutException();
  @override
  String get message => "وقت ارسال البيانات انتهت";
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
  String get message => "خطأ بسبب تعارض";
}

class InternalServerErrorException extends NetworkExceptions {
  const InternalServerErrorException();
  @override
  String get message => "خطأ في الخادم الداخلي";
}

class NotImplementedException extends NetworkExceptions {
  const NotImplementedException();
  @override
  String get message => "غير ممكّن التنفيذ";
}

class ServiceUnavailableException extends NetworkExceptions {
  const ServiceUnavailableException();
  @override
  String get message => "الخدمة غير متاحة";
}

class NoInternetConnectionException extends NetworkExceptions {
  const NoInternetConnectionException();
  @override
  String get message => "لا يوجد اتصال بالإنترنت";
}

class FormatException extends NetworkExceptions {
  const FormatException();
  @override
  String get message => "حدث خطأ في تنسيق البيانات";
}

class UnableToProcessException extends NetworkExceptions {
  const UnableToProcessException(this.reason);
  final String reason;
  @override
  String get message => "لا يمكن معالجة البيانات: $reason";
}

class DefaultErrorException extends NetworkExceptions {
  const DefaultErrorException(this.error);
  final String error;
  @override
  String get message => error;
}

class UnexpectedErrorException extends NetworkExceptions {
  const UnexpectedErrorException(this.error);
  final String error;
  @override
  String get message => "حدث خطأ غير متوقع: $error";
}
