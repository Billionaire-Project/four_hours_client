// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostsModel _$$_PostsModelFromJson(Map<String, dynamic> json) =>
    _$_PostsModel(
      start: json['start'] as int,
      offset: json['offset'] as int,
      next: json['next'] as int?,
      posts: (json['posts'] as List<dynamic>)
          .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_PostsModelToJson(_$_PostsModel instance) =>
    <String, dynamic>{
      'start': instance.start,
      'offset': instance.offset,
      'next': instance.next,
      'posts': instance.posts,
    };
