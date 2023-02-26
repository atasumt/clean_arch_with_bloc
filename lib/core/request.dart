import 'package:dio/dio.dart';
import 'package:flutter_project/app/const/shared/strings.dart';
import 'package:flutter_project/core/interceptor/dio_main_interceptor.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


class Request {
  final Dio _dio = Dio();
  Request() {
    updateDioInterceptors();
  }

  void updateAuthorization(String token) {
    _dio.options.headers['authorization'] = token;
  }

  void updateDioInterceptors() {
    _dio.options = BaseOptions(
      baseUrl: baseUrl,
      receiveDataWhenStatusError: true,
      validateStatus: (value) {
        return value! <= 500;
      },
      headers: {'Accept': 'application/json'},
    );
    _dio
      ..interceptors.add(PrettyDioLogger(
        requestBody: true,
        responseBody: false,
      ))
      ..interceptors.add(dioMainInterceptor());
  }

  // requests
  Future<Response> get(String path) async {
    return await _dio.get(path);
  }

  Future<Response> post(String path, {Object? data}) async {
    return await _dio.post(path, data: data);
  }
}
