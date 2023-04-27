import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/base_repository.dart';

class UsersRepository extends BaseRepository {
  static final UsersRepository _singleton = UsersRepository._internal();
  factory UsersRepository() => _singleton;
  UsersRepository._internal();

  Future<Response> getMyInformation() async {
    Response response = await dioClient.get('/users/me/');

    return response;
  }

  Future<Response> login() async {
    Response response = await dioClient.get('/users/login/');

    return response;
  }

  Future<Response> logout() async {
    Response response = await dioClient.put('/users/logout/');

    return response;
  }
}



//https://github.dev/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/features/jobs/data/jobs_repository.dart