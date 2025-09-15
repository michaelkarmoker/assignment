import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

import '../../../../utils/appconstant.dart';
import 'logging_interceptor.dart';

class DioClient {
  final String baseUrl;
  final LoggingInterceptor loggingInterceptor;

  Dio? dio;

  DioClient(
      this.baseUrl,
      Dio? dioC, {
        required this.loggingInterceptor,
      }) {
    initDioClient(dioC);
  }

  void resetClientWithNewToken() {
    initDioClient(null);
  }

  Future<Response> get(
      String uri, {
        Map<String, dynamic>? queryParameters,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {

      var response = await dio!.get(
        uri,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } on SocketException catch (e) {
      throw SocketException(e.toString());
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> post(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );

      var response = await dio!.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        log("Response body===>${data.toString()}");
      }


      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> put(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        CancelToken? cancelToken,
        ProgressCallback? onSendProgress,
        ProgressCallback? onReceiveProgress,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );

      if (kDebugMode) {
        log("$data");
      }
      var response = await dio!.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      if (kDebugMode) {
        log("Response body===>${data.toString()}");
      }
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }

  Future<Response> delete(
      String uri, {
        data,
        Map<String, dynamic>? queryParameters,
        Map<String, dynamic>? additionalHeaders,
        Options? options,
        CancelToken? cancelToken,
      }) async {
    try {
      final mergedOptions = buildRequestOptions(
        additionalHeaders: additionalHeaders,
        baseOptions: options,
      );
      if (kDebugMode) {
        log("$data");
      }
      var response = await dio!.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: mergedOptions,
        cancelToken: cancelToken,
      );
      if (kDebugMode) {
        log("Response body===>${data.toString()}");
      }
      return response;
    } on FormatException catch (_) {
      throw const FormatException("Unable to process the data");
    } catch (e) {
      rethrow;
    }
  }



  Options buildRequestOptions({
    Map<String, dynamic>? additionalHeaders,
    Options? baseOptions,
  }) {

    Map<String, String> defaultHeaders = {
     AppConstants.contentType: 'application/json; charset=UTF-8',
    };
    additionalHeaders?.forEach((k, v) {
      defaultHeaders[k] = v;
    });

    return baseOptions?.copyWith(headers: defaultHeaders) ??
        Options(headers: defaultHeaders);
  }

  void initDioClient(Dio? dioC, {Map<String, dynamic>? additionalHeaders}) {

    Map<String, String> headers = {
      AppConstants.contentType: 'application/json; charset=UTF-8',
    };
    additionalHeaders?.forEach((k, v) {
      headers[k] = v;
    });

    dio = dioC ?? Dio();
    dio
      ?..options.baseUrl = baseUrl
      ..options.connectTimeout = const Duration(seconds: 60)
      ..options.receiveTimeout = const Duration(seconds: 60)
      ..httpClientAdapter
      ..options.headers = headers;
    if (kDebugMode) {
      dio!.interceptors.add(loggingInterceptor);
      dio!.interceptors.add(PrettyDioLogger());
    }



  }
}
