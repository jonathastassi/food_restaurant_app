import 'package:dio/dio.dart';

class HttpClientResponse {
  final dynamic data;
  final int? statusCode;

  HttpClientResponse({
    required this.data,
    required this.statusCode,
  });
}

abstract class HttpClient {
  Future<HttpClientResponse> get(String url);
}

class HttpClientImpl implements HttpClient {
  late final Dio _dio;

  HttpClientImpl({required Dio dio}) {
    _dio = dio;
  }

  @override
  Future<HttpClientResponse> get(String url) async {
    try {
      final response =
          await _dio.get('https://challange.goomer.com.br/restaurants');

      return HttpClientResponse(
        data: response.data,
        statusCode: response.statusCode,
      );
    } catch (e) {
      rethrow;
    }
  }
}
