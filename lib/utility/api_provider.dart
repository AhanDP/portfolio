import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../model/user.dart';
import '../response_handler/fcm_response.dart';
import '../response_handler/lead_response.dart';
import '../response_handler/loan_type_response.dart';
import '../response_handler/login_response.dart';
import '../response_handler/register_response.dart';
import 'api_endpoint.dart';
import 'logging_interceptor.dart';

class ApiProvider {
  late Dio _dio;

  ApiProvider() {
    BaseOptions options = BaseOptions(
        receiveTimeout: const Duration(days: 1),
        connectTimeout: const Duration(days: 1));
    _dio = Dio(options);
    _dio.interceptors.add(LoggingInterceptor());
    Map<String, dynamic> customHeaders = {
      'content-type': 'application/json',
      'x-platform': 'portfolio'
    };
    options.headers.addAll(customHeaders);
    loadAuthorizationHeader();
  }

  Future<void> loadAuthorizationHeader() async {
    User? user = await User.get();

    if (user != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${user.accessToken}';
    }
  }

  Future<LoginResponse> login(Map<String, dynamic>? request) async {
    try {
      Response response = await _dio.post(apiEndpoint.loginUrl, data: request);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        return LoginResponse.fromMap(map);
      } else {
        return LoginResponse.withError(false, 'Different response code');
      }
    } catch (error) {
      return LoginResponse.withError(
          false, _handleError(error, login, request!)!);
    }
  }

  Future<RegisterResponse> register(Map<String, dynamic>? request) async {
    try {
      Response response =
      await _dio.post(apiEndpoint.registerurl, data: request);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        return RegisterResponse.fromMap(map);
      } else {
        return RegisterResponse.withError(false, 'Different response code');
      }
    } catch (error) {
      return RegisterResponse.withError(
          false, _handleError(error, register, request!)!);
    }
  }

  Future<LeadResponse> fetchLeads(Map<String, dynamic>? request) async {
    User? user = await User.get();
    if (user != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${user.accessToken!}';
    }
    try {
      Response response =
      await _dio.post(apiEndpoint.fetchLeadUrl, data: request);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        return LeadResponse.fromMap(map);
      } else {
        return LeadResponse.withError(false, 'Different response code');
      }
    } catch (error) {
      return LeadResponse.withError(
          false, _handleError(error, fetchLeads, request!)!);
    }
  }

  Future<LoanTypeResponse> loanTypeList(Map<String, dynamic>? request) async {
    User? user = await User.get();
    if (user != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${user.accessToken!}';
    }
    try {
      Response response =
      await _dio.get(apiEndpoint.loanTypeUrl, queryParameters: request);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        return LoanTypeResponse.fromMap(map);
      } else {
        return LoanTypeResponse.withError(false, 'Different response code');
      }
    } catch (error) {
      return LoanTypeResponse.withError(
          false, _handleError(error, loanTypeList, request!)!);
    }
  }

  Future<FcmResponse> postFcmToken(
      Map<String, dynamic>? request) async {
    User? user = await User.get();
    if (user != null) {
      _dio.options.headers['Authorization'] = 'Bearer ${user.accessToken!}';
    }
    try {
      Response response =
      await _dio.post(apiEndpoint.fcmUrl, data: request);
      if (response.statusCode == 200) {
        Map<String, dynamic> map = response.data;
        return FcmResponse.fromMap(map);
      } else {
        return FcmResponse.withError(
            false, 'Different response code');
      }
    } catch (error) {
      return FcmResponse.withError(false, _handleError(error, postFcmToken, request!)!);
    }
  }

  String? _handleError(error, Function f, Map<String, dynamic> request) {
    log('error.response :: $error');

    String? errorDescription = "";
    if (error is DioError) {
      DioError dioError = error;
      if (error.response!.statusCode == 422) {
        Map<String, dynamic> data = error.response!.data;
        debugPrint('data :: $data');
        // errorDescription = data['error'];
      } else if (dioError.response!.statusCode == 401) {
        handleRefreshLogic().then((value) {
          if (value == true) {
            f(request);
          }
        });
      } else {
        debugPrint('dioError.type :: ${dioError.type}');
        switch (dioError.type) {
          case DioErrorType.cancel:
            errorDescription = "Request to API server was cancelled";
            break;
          case DioErrorType.connectionTimeout:
            errorDescription = "Connection timeout with API server";
            break;
          case DioErrorType.unknown:
            errorDescription =
                "Connection to API server failed due to internet connection";
            break;
          case DioErrorType.receiveTimeout:
            errorDescription = "Receive timeout in connection with API server";
            break;
          case DioErrorType.badResponse:
            errorDescription =
                "Received invalid status code: ${dioError.response!.statusCode}";
            break;
          case DioErrorType.sendTimeout:
            errorDescription = "Send timeout in connection with API server";
            break;
          case DioErrorType.badCertificate:
            errorDescription = "Certificate error";
            break;
          case DioErrorType.connectionError:
            errorDescription = "Certificate error";
            break;
        }
      }
    } else {
      errorDescription = "Unexpected error occurred";
    }
    return errorDescription;
  }

  Future<bool?> handleRefreshLogic() async {
    User? user = await User.get();
    if (user?.accessToken != null) {
      /*LoginResponse response =
          await refresh({'refresh_token': user?.refreshToken});
      if (response.status == true) {
        await user?.delete();
        return await response.user?.save();
      }*/
    }
    return false;
  }
}
