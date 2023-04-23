import 'package:dio/dio.dart';

class DioExceptions implements Exception {
  late String message;

  DioExceptions.fromDioError(DioError dioError) {
    if (dioError.error != null) {
      message = dioError.error.toString();
      return;
    }
    switch (dioError.type) {
      case DioErrorType.connectionTimeout:
        message = "Caused by a connection timeout";
        break;
      case DioErrorType.sendTimeout:
        message = "It occurs when url is sent timeout";
        break;
      case DioErrorType.receiveTimeout:
        message = "Receive timeout in connection with API server";
        break;
      case DioErrorType.badCertificate:
        message =
            "Caused by an incorrect certificate as configured by [ValidateCertificate]";
        break;
      case DioErrorType.badResponse:
        message = _handleError(
          dioError.response?.statusCode,
          dioError.message,
        );
        break;
      case DioErrorType.cancel:
        message = "Request to API server was cancelled";
        break;
      case DioErrorType.connectionError:
        message = "Caused for example by a `xhr.onError` or SocketExceptions";
        break;

      case DioErrorType.unknown:
        message = "Unexpected error occurred";
        break;
      default:
        message = "Something went wrong";
        break;
    }
  }

  String _handleError(int? statusCode, String? message) {
    if (message != null) {
      return message;
    }
    switch (statusCode) {
      case 400:
        return 'Bad request';
      case 401:
        return 'Unauthorized';
      case 403:
        return 'Forbidden';
      case 404:
        return 'Not found';
      case 500:
        return 'Internal server error';
      case 502:
        return 'Bad gateway';
      default:
        return 'Oops something went wrong';
    }
  }

  @override
  String toString() => message;
}
