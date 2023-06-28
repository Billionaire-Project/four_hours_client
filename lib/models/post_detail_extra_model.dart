import 'package:four_hours_client/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'post_detail_extra_model.freezed.dart';
part 'post_detail_extra_model.g.dart';

@freezed
class PostDetailExtraModel with _$PostDetailExtraModel {
  factory PostDetailExtraModel({
    required PostModel post,
    required String time,
    String? postingDate,
  }) = _PostDetailExtraModel;

  factory PostDetailExtraModel.fromJson(Map<String, dynamic> json) =>
      _$PostDetailExtraModelFromJson(json);
}
