import 'package:four_hours_client/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'posts_obscured_pagination_model.freezed.dart';
part 'posts_obscured_pagination_model.g.dart';

@freezed
class PostsObscuredPaginationModel with _$PostsObscuredPaginationModel {
  factory PostsObscuredPaginationModel({
    required String start,
    required String offset,
    required String? next,
    required List<PostModel> posts,
  }) = _PostsObscuredPaginationModel;

  factory PostsObscuredPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$PostsObscuredPaginationModelFromJson(json);
}
