import 'package:freezed_annotation/freezed_annotation.dart';

part 'receipt_model.freezed.dart';
part 'receipt_model.g.dart';

@freezed
class ReceiptModel with _$ReceiptModel {
  factory ReceiptModel({
    @JsonKey(name: 'is_postable') required bool isPostable,
    @JsonKey(name: 'is_readable') required bool isReadable,
    @JsonKey(name: 'readable_ended_at') required String? readableEndedAt,
    @JsonKey(name: 'postable_at') required String? postableAt,
    @JsonKey(name: 'post_delete_stack') required int postDeleteStack,
  }) = _ReceiptModel;

  factory ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$ReceiptModelFromJson(json);
}
