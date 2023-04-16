import 'package:dio/dio.dart';
import 'package:four_hours_client/network/dio_exceptions.dart';

class BaseService {
  String throwExceptions(DioError error) {
    final errorMessage = DioExceptions.fromDioError(error).toString();
    return errorMessage;
  }

  void throwError(Response response) {
    var error = response.data['error'];
    if (error != null) {
      throw error;
    }
  }
}
