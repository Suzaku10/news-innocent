import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:news_innocent/data/exception/response_exception.dart';

const _defaultConnectTimeout = Duration.millisecondsPerMinute;
const _defaultReceiveTimeout = Duration.millisecondsPerMinute;

class NetworkServiceDio {
  final String baseUrl;
  final List<Interceptor> interceptors;
  final Dio _dio = Dio();

  NetworkServiceDio(this.baseUrl, {this.interceptors = const []}) {
    _dio
      ..options.baseUrl = baseUrl
      ..options.connectTimeout = _defaultConnectTimeout
      ..options.receiveTimeout = _defaultReceiveTimeout
      ..httpClientAdapter
      ..options.headers = {
        'Content-Type': 'application/json; charset=UTF-8',
      };

    if (interceptors.isNotEmpty) {
      _dio.interceptors.addAll(interceptors);
    }

    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor(
          responseBody: true,
          error: true,
          requestHeader: true,
          responseHeader: true,
          request: true,
          requestBody: true));
    }
  }

  Future<dynamic> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      var response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      if (response.statusCode == HttpStatus.ok) {
        return response.data;
      } else {
        throw ResponseException(
          response.statusCode,
          data: response.data.toString(),
        );
      }
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } on DioError catch (e) {
      if (e.type == DioErrorType.connectTimeout) {
        throw Exception("Timeout");
      } else {
        throw Exception("Another Dio Error: ${e.message}");
      }
    } catch (e) {
      rethrow;
    }
  }
}
