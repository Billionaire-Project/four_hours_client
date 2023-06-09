import 'package:dio/dio.dart';
import 'package:four_hours_client/models/receipt_model.dart';
import 'package:four_hours_client/repositories/posts_repository.dart';
import 'package:four_hours_client/utils/functions.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'receipt_controller.g.dart';

@Riverpod(keepAlive: true)
class ReceiptController extends _$ReceiptController {
  @override
  Future<ReceiptModel> build() {
    return getReceipt();
  }

  Future<ReceiptModel> getReceipt() async {
    try {
      final postsRepository = ref.read(postsRepositoryProvider);

      state = await AsyncValue.guard(postsRepository.getReceipt);

      if (!state.hasValue) {
        throw ('There is no receipt');
      }

      return state.value!;
    } on DioError catch (e) {
      throw throwExceptions(e);
    }
  }
}
