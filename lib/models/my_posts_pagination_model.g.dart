// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_posts_pagination_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyPostsPaginationModel _$$_MyPostsPaginationModelFromJson(
        Map<String, dynamic> json) =>
    _$_MyPostsPaginationModel(
      start: json['start'] as String,
      offset: json['offset'] as String,
      next: json['next'] as String?,
      posts: (json['posts'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PostModel.fromJson(e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$$_MyPostsPaginationModelToJson(
        _$_MyPostsPaginationModel instance) =>
    <String, dynamic>{
      'start': instance.start,
      'offset': instance.offset,
      'next': instance.next,
      'posts': instance.posts,
    };
