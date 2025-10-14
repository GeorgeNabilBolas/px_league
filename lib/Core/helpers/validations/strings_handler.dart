class StringsHandler {
  static String validateString(String? string) {
    if (string!.isEmpty || string.trim().isEmpty) {
      throw Exception('لا يوجد بيانات لتعديل');
    }

    return string.trim();
  }
}
