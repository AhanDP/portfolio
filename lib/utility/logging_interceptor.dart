import 'dart:developer';
import 'package:dio/dio.dart';
import 'utils.dart';

class LoggingInterceptor extends Interceptor {
  final int _maxCharactersPerLine = 200;

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    if (Utils.excludePath(options.path)) {
      log("--> START HTTP REQUEST");
      log("${options.method} ${options.path}");
      log("Content type: ${options.contentType}");
      log("Request data: ${options.data is FormData ? (options.data as FormData).fields : options.data}");
      log("Query params: ${options.queryParameters}");
      log("Header: ${options.headers}");
      log("--> END HTTP REQUEST");
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    if (Utils.excludePath(response.requestOptions.path)) {
      log("<-- START HTTP RESPONSE");
      log("${response.statusCode} ${response.requestOptions.method} ${response.requestOptions.path}");
      String responseAsString = response.data.toString();
      if (responseAsString.length > _maxCharactersPerLine) {
        int iterations =
            (responseAsString.length / _maxCharactersPerLine).floor();
        for (int i = 0; i <= iterations; i++) {
          int endingIndex = i * _maxCharactersPerLine + _maxCharactersPerLine;
          if (endingIndex > responseAsString.length) {
            endingIndex = responseAsString.length;
          }
          log(responseAsString.substring(
              i * _maxCharactersPerLine, endingIndex));
        }
      } else {
        log('${response.data}');
      }
      log("<-- END HTTP RESPONSE");
    }

    return super.onResponse(response, handler);
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) {
    log("<-- Error -->");
    log('${err.error}');
    log('${err.message}');
    return super.onError(err, handler);
  }
}
