import 'package:dio/dio.dart';

class BaseService {
  void throwExceptions(Response response) {
    var error = response.data['error'];
    if (error != null) {
      throw error;
    }
  }
}
