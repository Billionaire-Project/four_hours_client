import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/repositories/user_repository.dart';
import 'package:four_hours_client/services/base_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class UserService extends Notifier with BaseService {
  @override
  FutureOr build() {}

  Future<UserModel> getSingleUser() async {
    final userRepository = ref.read(userRepositoryProvider);
    final response = await userRepository.getSingleUser();

    return UserModel.fromJson(response.data);
  }
}

final userServiceProvider =
    NotifierProvider<UserService, void>(UserService.new);
