import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:four_hours_client/models/user_model.dart';
import 'package:four_hours_client/services/user_service.dart';

final userProvider = FutureProvider<UserModel>((ref) async {
  final userService = ref.read(userServiceProvider.notifier);
  final result = await userService.getSingleUser();

  return result;
});
