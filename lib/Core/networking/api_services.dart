import 'package:dio/dio.dart';
import 'env_config.dart';

class ApiService {
  ApiService(this._dio) {
    EnvConfig.validate();
  }
  final Dio _dio;

  final _url = 'https://${EnvConfig.apiHost}/fixtures/';

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
            'x-rapidapi-key': EnvConfig.apiKey,
            'x-rapidapi-host': EnvConfig.apiHost,
          },
        ),
      );
      return response.data as Map<String, dynamic>;
    } catch (e) {
      rethrow;
    }
  }
}
