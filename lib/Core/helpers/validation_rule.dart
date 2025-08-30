sealed class ValidationRule {
  bool validate(String password);
  String getErrorMessage();
}

class LengthValidationRule implements ValidationRule {
  const LengthValidationRule(this.minLength);
  final int minLength;

  @override
  bool validate(String password) => password.length >= minLength;

  @override
  String getErrorMessage() => 'كلمة المرور يجب أن تكون على الأقل $minLength حرف';
}

class UppercaseValidationRule implements ValidationRule {
  const UppercaseValidationRule();
  @override
  bool validate(String password) => password.contains(RegExp(r'[A-Z]'));

  @override
  String getErrorMessage() => 'كلمة المرور يجب أن تحتوي على الأقل حرف كبير';
}

class LowercaseValidationRule implements ValidationRule {
  const LowercaseValidationRule();
  @override
  bool validate(String password) => password.contains(RegExp(r'[a-z]'));

  @override
  String getErrorMessage() => 'كلمة المرور يجب أن تحتوي على الأقل حرف صغيرة';
}

class NumberValidationRule implements ValidationRule {
  const NumberValidationRule();
  @override
  bool validate(String password) => password.contains(RegExp(r'[0-9]'));

  @override
  String getErrorMessage() => 'كلمة المرور يجب أن تحتوي على الأقل رقم';
}

class SpecialCharValidationRule implements ValidationRule {
  const SpecialCharValidationRule();
  @override
  bool validate(String password) => password.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

  @override
  String getErrorMessage() => 'كلمة المرور يجب أن تحتوي على الأقل حرف خاصة';
}
