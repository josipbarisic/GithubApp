import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class NetworkService {
  late Dio _dio;
  late String? token;

  NetworkService() {
    _dio = Dio();
    token = dotenv.env['GITHUB_API_TOKEN'];
  }

  Future<Response?> getHttp({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers = _getHeaders(headers);
      Response response = await _dio.get(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (dioError, _) {
      log('Exception caught in GET $url: ${dioError.message}, Response: ${dioError.response}');
      return null;
    }
  }

  Future<Response?> postHttp({
    required String url,
    Map<String, dynamic>? queryParams,
    Map<String, dynamic>? headers,
  }) async {
    try {
      headers = _getHeaders(headers);
      Response response = await _dio.post(
        url,
        queryParameters: queryParams,
        options: Options(headers: headers),
      );
      return response;
    } on DioError catch (dioError, _) {
      log('Exception caught in POST $url: ${dioError.message}, Response: ${dioError.response}');
      return null;
    }
  }

  Map<String, dynamic>? _getHeaders(Map<String, dynamic>? headers) {
    if (token != null && headers == null) {
      headers = <String, dynamic>{'Authorization': 'token $token'};
    } else if (token != null && headers != null) {
      headers.addAll(<String, dynamic>{'Authorization': 'token $token'});
    }
    return headers;
  }
}
