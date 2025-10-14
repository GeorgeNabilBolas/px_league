import 'dart:developer';

import 'package:dio/dio.dart';


class ApiService {
  ApiService(this._dio);
  final Dio _dio;

  final _url = 'https://v3.football.api-sports.io/fixtures/';
  Future<Map<String, dynamic>> get({String? url, Map<String, String>? queryParameters}) async {
    try {
      final response = await _dio.get(
        url ?? _url,
        queryParameters: queryParameters,
        options: Options(
          headers: {
            'x-rapidapi-key': '726e51d7e1d2ec75ae3d2497d173e4cd',
            'x-rapidapi-host': 'v3.football.api-sports.io',
          },
        ),
      );
      log(response.realUri.toString());
      return response.data;
    } catch (e) {
      rethrow;
    }
  }
}
