// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'my_posts_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MyPostsModel _$$_MyPostsModelFromJson(Map<String, dynamic> json) =>
    _$_MyPostsModel(
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

Map<String, dynamic> _$$_MyPostsModelToJson(_$_MyPostsModel instance) =>
    <String, dynamic>{
      'start': instance.start,
      'offset': instance.offset,
      'next': instance.next,
      'posts': instance.posts,
    };
