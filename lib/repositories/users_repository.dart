import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_repository.g.dart';

class UsersRepository extends BaseRepository {
  Future<Response> getMyInformation() async {
    Response response = await dioClient.get('/users/me/');

    return response;
  }

  Future<Response> userLogin() async {
    Response response = await dioClient.get('/users/login/');

    return response;
  }

  Future<Response> userLogout() async {
    Response response = await dioClient.put('/users/logout/');

    return response;
  }
}

@Riverpod(keepAlive: true)
UsersRepository usersRepository(UsersRepositoryRef ref) {
  return UsersRepository();
}
