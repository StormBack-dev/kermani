import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class KermaniDioHelper {
  static const String _baseUrl = 'https://debug.behaminplus.ir/behandam-diet/api/';
  static final KermaniDioHelper _instance = KermaniDioHelper._();
  static Dio? _dio;
  KermaniDioHelper._();

  factory KermaniDioHelper() {
    return _instance;
  }
  Dio getDio() {
    if (_dio != null) {
      return _dio!;
    }
    _dio = Dio();

    _dio!.interceptors.clear();
    if (kDebugMode) {
      // _dio!.interceptors.add(_logPrettierInterceptor());
    }
    _dio!.interceptors.add(_tokenInterceptor());
    _dio!.options.baseUrl = _baseUrl;
    return _dio!;
  }

  Interceptor _tokenInterceptor() {
    return QueuedInterceptorsWrapper(
      onRequest: (options, handler) async {
        // final accessToken = await Api().getLocalAccessToken();
        const accessToken = '1283472|ncqZacuIgfiuF1cI2k8GJKEzOfoXGrFYO9HGhiYj';
        if (accessToken != null) {
          options.headers['Authorization'] = 'Bearer $accessToken';
        }
        handler.next(options);
      },
      onResponse: (response, handler) async {
        handler.next(response);
      },
      onError: (error, handler) async {
        if (error.response?.statusCode == 403 ||
            error.response?.statusCode == 401 ||
            error.response?.statusCode == 400) {
          log('error 400');
        }
        handler.next(error);
      },
    );
  }
  //   Interceptor _logPrettierInterceptor() {
  //   return PrettyDioLogger(
  //     requestHeader: true,
  //     requestBody: true,
  //     responseBody: true,
  //     responseHeader: false,
  //     error: true,
  //     compact: true,
  //     maxWidth: 90,
  //   );
  // }
}
