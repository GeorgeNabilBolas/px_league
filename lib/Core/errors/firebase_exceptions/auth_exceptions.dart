abstract class AuthException {
  const AuthException();
  String get message;
}

class UserNotFoundException extends AuthException {
  const UserNotFoundException() : super();
  @override
  String get message => 'لا يوجد حساب بهذا البريد الالكتروني';
}

class WrongPasswordException extends AuthException {
  const WrongPasswordException() : super();
  @override
  String get message => 'كلمة المرور غير صحيحة';
}

class EmailAlreadyInUseException extends AuthException {
  const EmailAlreadyInUseException() : super();
  @override
  String get message => 'هذا البريد الالكتروني موجود بالفعل';
}

class WeakPasswordException extends AuthException {
  const WeakPasswordException() : super();
  @override
  String get message => 'كلمة المرور ضعيفة جدا';
}

class InvalidEmailException extends AuthException {
  const InvalidEmailException() : super();
  @override
  String get message => 'البريد الالكتروني غير صحيح';
}

class UserDisabledException extends AuthException {
  const UserDisabledException() : super();
  @override
  String get message => 'هذا الحساب تم تعطيله';
}

class TooManyRequestsException extends AuthException {
  const TooManyRequestsException() : super();
  @override
  String get message => 'عدد الطلبات المدخلة اكبر بكثير من المسموح به';
}

class NetworkRequestFailedException extends AuthException {
  const NetworkRequestFailedException() : super();
  @override
  String get message => 'الاتصال بالانترنت ضعيف';
}

class UnexpectedErrorException extends AuthException {
  const UnexpectedErrorException(this.exception);
  final String exception;
  @override
  String get message => "حدث خطأ غير متوقع: $exception";
}

class FormatException extends AuthException {
  const FormatException();
  @override
  String get message => "حدث خطأ في التنسيق";
}

class CanceledException extends AuthException {
  const CanceledException() : super();
  @override
  String get message => 'العملية تم إلغاؤها';
}

class InterruptedException extends AuthException {
  const InterruptedException() : super();
  @override
  String get message => 'العملية تم إلغاؤها';
}

class ClientConfigurationErrorException extends AuthException {
  const ClientConfigurationErrorException() : super();
  @override
  String get message => 'خطأ في تكوين العميل';
}

class ProviderConfigurationErrorException extends AuthException {
  const ProviderConfigurationErrorException() : super();
  @override
  String get message => 'خطأ في تكوين المزود';
}

class UiUnavailableException extends AuthException {
  const UiUnavailableException() : super();
  @override
  String get message => 'الواجهة غير متاحة';
}

class UserMismatchException extends AuthException {
  const UserMismatchException() : super();
  @override
  String get message => 'المستخدم غير مطابق';
}
