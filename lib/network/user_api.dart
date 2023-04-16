import 'package:dio/dio.dart';
import 'package:four_hours_client/network/dio_client.dart';

class UserApi {
  Future<Response> getSingleUser() async {
    try {
      Response response = await DioClient().get('users/2');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}
