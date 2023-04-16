import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/network/dio_client.dart';

class UserRepository {
  Future<Response> getSingleUser() async {
    try {
      Response response =
          await DioClient().get('https://jsonplaceholder.typicode.com/todos/1');
      return response;
    } catch (e) {
      rethrow;
    }
  }
}

final userRepositoryProvider = Provider<UserRepository>((ref) {
  return UserRepository();
});


//https://github.dev/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/features/jobs/data/jobs_repository.dart