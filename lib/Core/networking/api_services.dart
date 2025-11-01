import 'package:dio/dio.dart';
import 'env_config.dart';

class ApiService {
  ApiService(this._dio) {
    ApiConfig.validate();
  }
  final Dio _dio;

  final _url = 'https://${ApiConfig.apiHost}/fixtures/';

  Future<Map<String, dynamic>> get({
    String? url,
    Map<String, String>? queryParameters,
  }) async {
    try {
      final response = await _dio.get(
        url ?? _url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'x-rapidapi-key': ApiConfig.apiKey,
            'x-rapidapi-host': ApiConfig.apiHost,
          },
        ),
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
