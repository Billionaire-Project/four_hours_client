import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/repositories/users_repository.dart';

class UsersService {
  static final UsersService _singleton = UsersService._internal();

  factory UsersService() => _singleton;

  late final UsersRepository usersRepository;

  UsersService._internal() {
    usersRepository = UsersRepository();
  }

  Future<UserModel> getMyInformation() async {
    final response = await usersRepository.getMyInformation();

    return UserModel.fromJson(response.data);
  }

  Future<void> login() async {
    await usersRepository.login();
  }

  Future<void> logout() async {
    await usersRepository.logout();
  }
}
