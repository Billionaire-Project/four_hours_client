import 'package:four_hours_client/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_posts_pagination_model.freezed.dart';
part 'my_posts_pagination_model.g.dart';

@freezed
class MyPostsPaginationModel with _$MyPostsPaginationModel {
  factory MyPostsPaginationModel({
    required String start,
    required String offset,
    required String? next,
    required Map<String, List<PostModel>> posts,
  }) = _MyPostsPaginationModel;

  factory MyPostsPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$MyPostsPaginationModelFromJson(json);
}
