import 'validation_rule.dart';

class PasswordValidator {
  static const List<ValidationRule> _defaultRules = [
    LengthValidationRule(8),
    UppercaseValidationRule(),
    LowercaseValidationRule(),
    NumberValidationRule(),
    SpecialCharValidationRule(),
  ];

  static bool validate(String password) {
    return _defaultRules.every((rule) => rule.validate(password));
  }

  static List<String> getValidationErrors(String password) {
    return _defaultRules
        .where((rule) => !rule.validate(password))
        .map((rule) => rule.getErrorMessage())
        .map((e) => '• $e')
        .toList();
  }
}
