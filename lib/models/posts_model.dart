import 'package:four_hours_client/models/post_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'posts_model.freezed.dart';
part 'posts_model.g.dart';

@freezed
class PostsModel with _$PostsModel {
  factory PostsModel({
    required List<PostModel?> posts,
  }) = _PostsModel;

  factory PostsModel.fromJson(Map<String, dynamic> json) =>
      _$PostsModelFromJson(json);
}
