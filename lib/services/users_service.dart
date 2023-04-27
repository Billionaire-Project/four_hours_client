import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/repositories/users_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'users_service.g.dart';

class UsersService {
  final UsersRepository usersRepository;

  UsersService({
    required this.usersRepository,
  });

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

@riverpod
UsersService usersService(UsersServiceRef ref) {
  return UsersService(
    usersRepository: ref.watch(usersRepositoryProvider),
  );
}
