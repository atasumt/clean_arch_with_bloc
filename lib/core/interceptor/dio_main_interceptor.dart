import 'package:dio/dio.dart';
import 'package:flutter_project/app/logger/logger.dart';

InterceptorsWrapper dioMainInterceptor() {
  return InterceptorsWrapper(onRequest: (requestOptions, handler) {
    requestOptions.queryParameters.removeWhere((key, value) => value == "");
    return handler.next(requestOptions);
  }, onResponse: (response, handler) {
    if (response.requestOptions.data != null) {
      var requestData = response.requestOptions.data;
    }

    logger().d('Response', response.data);
    return handler.next(response);
  }, onError: (DioError e, handler) {
    if (e.requestOptions.data != null) {
      var requestData = e.requestOptions.data;
    }

    if (e.response?.statusCode == 402) {
      //logout user and go to login page
    }

    logger().d('Error', e.error);
    return handler.next(e);
  });
}
