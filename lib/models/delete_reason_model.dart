import 'package:freezed_annotation/freezed_annotation.dart';

part 'delete_reason_model.freezed.dart';
part 'delete_reason_model.g.dart';

@freezed
class DeleteReasonModel with _$DeleteReasonModel {
  factory DeleteReasonModel({
    required int id,
    required String reason,
  }) = _DeleteReasonModel;

  factory DeleteReasonModel.fromJson(Map<String, dynamic> json) =>
      _$DeleteReasonModelFromJson(json);
}
