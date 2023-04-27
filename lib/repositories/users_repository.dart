import 'package:dio/dio.dart';
import 'package:four_hours_client/network/dio_client.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_repository.g.dart';

class UsersRepository {
  final DioClient dioClient;
  UsersRepository({required this.dioClient});

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

@riverpod
UsersRepository usersRepository(UsersRepositoryRef ref) {
  return UsersRepository(
    dioClient: ref.watch(dioClientProvider),
  );
}
