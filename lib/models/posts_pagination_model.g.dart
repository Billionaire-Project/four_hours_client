// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostsPaginationModel _$$_PostsPaginationModelFromJson(
        Map<String, dynamic> json) =>
    _$_PostsPaginationModel(
      start: json['start'] as String,
      offset: json['offset'] as String,
      next: json['next'] as String?,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostsPaginationModelToJson(
        _$_PostsPaginationModel instance) =>
    <String, dynamic>{
      'start': instance.start,
      'offset': instance.offset,
      'next': instance.next,
      'posts': instance.posts,
    };
