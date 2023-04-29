import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
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

class _AuthInterceptor extends Interceptor {
  final storage = const FlutterSecureStorage();
  final auth = FirebaseAuth.instance;
  //! DioClient에서 authService를 사용할 수 없다.
  //! 모든 repository는 DioClient를 사용하고 있고
  //! service는 repository에서 받아오는 response를 사용한 로직을 사용하기도 해서
  //! DioClient에서 authService를 사용하면 circular dependency가 발생한다.

  Future<String> refreshToken() async {
    final user = auth.currentUser;
    if (user != null) {
      final token = await user.getIdToken();
      await storage.write(key: LocalStorageKey.token, value: token);
      await storage.write(
        key: LocalStorageKey.tokenTimeout,
        value: DateTime.now().add(const Duration(hours: 1)).toString(),
      );
      return token;
    } else {
      throw ('User is null');
    }
  }

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    // token의 유효시간은 1시간, 1시간이 지나면 token을 refresh하고, tokenTimeout을 다시 설정한다.
    final tokenTimeout = await storage.read(key: LocalStorageKey.tokenTimeout);
    if (tokenTimeout != null) {
      final tokenTimeoutDateTime = DateTime.parse(tokenTimeout);
      if (tokenTimeoutDateTime.isBefore(DateTime.now())) {
        final token = await refreshToken();
        await storage.write(key: LocalStorageKey.token, value: token);
      }
    }

    final uid = await storage.read(key: LocalStorageKey.uid);
    final token = await storage.read(key: LocalStorageKey.token);

    options.headers['agent-uid'] = '$uid';
    options.headers['authorization'] = 'Bearer $token';

    return handler.next(options);
  }

  // @override
  // void onResponse(
  //   Response response,
  //   ResponseInterceptorHandler handler,
  // ) async {
  // int statusCode = response.statusCode ?? 0;

  // bool isJjaannApiHost =
  //     RegExp(r'^api\.([a-z\d][a-z\d\-\_]+\.){0,}jjaann\.com$')
  //         .hasMatch(response.realUri.host);
  // if (isJjaannApiHost && statusCode >= 200 && statusCode <= 299) {

  // if (statusCode >= 200 && statusCode <= 299) {
  //   String token = (response.headers['authorization']?[0] ?? '')
  //       .replaceAllMapped(RegExp(r'^Bearer[\s]+'), (match) {
  //     return '';
  //   });
  //   String tokenTimeout = response.headers['authorization-timeout']?[0] ?? '';
  //   if (token.isEmpty || tokenTimeout.isEmpty) {
  //     await storage.delete(key: LocalStorageKey.token);
  //     await storage.delete(key: LocalStorageKey.tokenTimeout);
  //   } else {
  //     await storage.write(key: LocalStorageKey.token, value: token);
  //     await storage.write(
  //       key: LocalStorageKey.tokenTimeout,
  //       value: tokenTimeout,
  //     );
  //   }
  // }
  //   return handler.next(response);
  // }

  @override
  void onError(
    DioError err,
    ErrorInterceptorHandler handler,
  ) async {
    final statusCode = err.response?.statusCode;

    // error code가 401, 402, 403일 경우, token 갱신, 이후에 다시 요청을 어케하지?
    if (statusCode == 401 | 402 | 403) {
      await refreshToken();
    }
    return handler.next(err);
  }
}
