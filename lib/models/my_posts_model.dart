import 'package:four_hours_client/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'my_posts_model.freezed.dart';
part 'my_posts_model.g.dart';

@freezed
class MyPostsModel with _$MyPostsModel {
  factory MyPostsModel({
    required String start,
    required String offset,
    required String? next,
    required Map<String, List<PostModel>> posts,
  }) = _MyPostsModel;

  factory MyPostsModel.fromJson(Map<String, dynamic> json) =>
      _$MyPostsModelFromJson(json);
}
