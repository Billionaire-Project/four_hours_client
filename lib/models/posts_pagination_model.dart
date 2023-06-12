import 'package:four_hours_client/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'posts_pagination_model.freezed.dart';
part 'posts_pagination_model.g.dart';

@freezed
class PostsPaginationModel with _$PostsPaginationModel {
  factory PostsPaginationModel({
    required String start,
    required String offset,
    required String? next,
    required List<PostModel> posts,
  }) = _PostsPaginationModel;

  factory PostsPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PostsPaginationModelFromJson(json);
}
