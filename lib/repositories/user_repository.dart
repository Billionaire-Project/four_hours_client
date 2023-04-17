import 'package:dio/dio.dart';
import 'package:four_hours_client/repositories/base_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class UserRepository extends BaseRepository {
  Future<Response> getSingleUser() async {
    // TODO: 내 정보 가져오는 API로 변경
    Response response = await dioClient.get('/api/v1/posts/');

    return response;
  }
}

final userRepositoryProvider =
    Provider<UserRepository>((ref) => UserRepository());


//https://github.dev/bizz84/starter_architecture_flutter_firebase/blob/master/lib/src/features/jobs/data/jobs_repository.dart