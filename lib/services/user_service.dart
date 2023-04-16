import 'package:dio/dio.dart';
import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/network/user_api.dart';
import 'package:four_hours_client/services/base_service.dart';

class UserService extends BaseService {
  Future<List<UserModel>> getUsersRequested() async {
    try {
      final response = await UserApi().getSingleUser();
      final users = (response.data['data'] as List)
          .map((e) => UserModel.fromJson(e))
          .toList();

      throwError(response);

      return users;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}
