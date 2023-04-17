import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:four_hours_client/constants/constants.dart';
import 'package:four_hours_client/network/dio_exceptions.dart';
import 'package:four_hours_client/network/endpoints.dart';

class DioClient {
  final Dio _dio = Dio();

  static final DioClient _singleton = DioClient._internal();

  factory DioClient() => _singleton;

  final storage = const FlutterSecureStorage();

  DioClient._internal() {
    _dio.options.baseUrl = Endpoints.baseUrl;
    _dio.options.connectTimeout = Endpoints.connectTimeout;
    _dio.options.receiveTimeout = Endpoints.receiveTimeout;
    _dio.interceptors.add(_AuthInterceptor());
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

class _AuthInterceptor extends Interceptor {
  final storage = const FlutterSecureStorage();

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final uuid = await storage.read(key: LocalStorageKey.uuid);
    final token = await storage.read(key: LocalStorageKey.token);

    options.headers['agent-uuid'] = '$uuid';
    options.headers['authorization'] = 'Bearer $token';

    return handler.next(options);
  }

  // @override
  // void onResponse(
  //   Response response,
  //   ResponseInterceptorHandler handler,
  // ) async {
  //   int statusCode = response.statusCode ?? 0;

  //   bool isJjaannApiHost =
  //       RegExp(r'^api\.([a-z\d][a-z\d\-\_]+\.){0,}jjaann\.com$')
  //           .hasMatch(response.realUri.host);
  //   if (isJjaannApiHost && statusCode >= 200 && statusCode <= 299) {
  //     String token = (response.headers['authorization']?[0] ?? '')
  //         .replaceAllMapped(RegExp(r'^Bearer[\s]+'), (match) {
  //       return '';
  //     });
  //     String tokenTimeout = response.headers['authorization-timeout']?[0] ?? '';
  //     if (token.isEmpty || tokenTimeout.isEmpty) {
  //       await storage.delete(key: LocalStorageKey.token);
  //       await storage.delete(key: LocalStorageKey.tokenTimeout);
  //     } else {
  //       await storage.write(key: LocalStorageKey.token, value: token);
  //       await storage.write(
  //         key: LocalStorageKey.tokenTimeout,
  //         value: tokenTimeout,
  //       );
  //     }
  //   }
  //   return handler.next(response);
  // }
}
