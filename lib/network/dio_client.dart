import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/network/dio_exceptions.dart';
import 'package:four_hours_client/network/endpoints.dart';

class DioClient {
  final Dio _dio = Dio();

  static final DioClient _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  DioClient._internal() {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.options.connectTimeout = Endpoints.connectTimeout;
    _dio.options.receiveTimeout = Endpoints.receiveTimeout;
  }

  String throwExceptions(DioError e) {
    final errorMessage = DioExceptions.fromDioError(e).toString();
    return errorMessage;
  }

  //* GET:-----------------------------------------------------------------------
  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.get(
        path,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  //* POST:----------------------------------------------------------------------
  Future<Response> post(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.post(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

  //* PUT:-----------------------------------------------------------------------
  Future<Response> put(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.put(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );

      return response;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }

//* DELETE:--------------------------------------------------------------------
  Future<dynamic> delete(
    String path, {
    data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    try {
      final Response response = await _dio.delete(
        path,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );

      return response.data;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}

final dioClientProvider = Provider<DioClient>((ref) {
  return DioClient();
});
