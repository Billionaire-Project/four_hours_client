import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/services/users_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'test_provider.g.dart';

@Riverpod(keepAlive: true)
class Test extends _$Test {
  @override
  Future<UserModel> build() async {
    final UserModel user = await getMyInformation();
    return user;
  }

  Future<UserModel> getMyInformation() async {
    final usersService = ref.read(usersServiceProvider);

    UserModel result = await usersService.getMyInformation();
    return result;
  }
}
