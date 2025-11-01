import 'package:flutter_dotenv/flutter_dotenv.dart';

class ApiConfig {
  static final String apiKey = dotenv.env['RAPID_API_KEY'] ?? '';

  static const String apiHost = 'v3.football.api-sports.io';

  static void validate() {
    if (apiKey.isEmpty) {
      throw Exception('RAPID_API_KEY not configured');
    }
  }
}
