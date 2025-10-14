

class DateFormatter {
  // Map weekdays
  static const List<String> _weekdays = [
    'الاثنين', // 1 = Monday
    'الثلاثاء',
    'الأربعاء',
    'الخميس',
    'الجمعة',
    'السبت',
    'الأحد',
  ];

  // Map months
  static const List<String> _months = [
    'يناير',
    'فبراير',
    'مارس',
    'ابريل',
    'مايو',
    'يونيو',
    'يوليو',
    'اغسطس',
    'سبتمبر',
    'أكتوبر',
    'نوفمبر',
    'ديسمبر',
  ];

  // Method to format DateTime to Arabic string
  //fromat to:
  //الاثنين، 15 سبتمبر، 2025
  static String formatTodayAr() {
    final date = DateTime.now();
    final weekday = _weekdays[date.weekday - 1];
    final month = _months[date.month - 1];
    return '$weekday، ${date.day} $month، ${date.year}';
  }

  static String formatDateYyyyMmDd(DateTime date) {
    final year = date.year.toString().padLeft(2, '0');
    final month = date.month.toString().padLeft(2, '0');
    final day = date.day.toString().padLeft(2, '0');
    return '$year-$month-$day';
  }

  static String formatTimeHhMm(String date) {
    final time = DateTime.tryParse(date)?.add(const Duration(hours: 3));
    final hour = time?.hour.toString().padLeft(2, '0') ?? '00';
    final minute = time?.minute.toString().padLeft(2, '0') ?? '00';
    return '$hour:$minute';
  }
}
