// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_obscured_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostsObscuredPaginationModel _$$_PostsObscuredPaginationModelFromJson(
        Map<String, dynamic> json) =>
    _$_PostsObscuredPaginationModel(
      start: json['start'] as String,
      offset: json['offset'] as String,
      next: json['next'] as String?,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostsObscuredPaginationModelToJson(
        _$_PostsObscuredPaginationModel instance) =>
    <String, dynamic>{
      'start': instance.start,
      'offset': instance.offset,
      'next': instance.next,
      'posts': instance.posts,
    };
