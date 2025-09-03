import 'validation_rule.dart';

class EmailValidator {
  static bool isValid(String value) {
    return const EmailValidationRule().validate(value);
  }

  static String getValidationError() => const EmailValidationRule().getErrorMessage();
}
