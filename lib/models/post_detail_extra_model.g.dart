// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'post_detail_extra_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PostDetailExtraModel _$$_PostDetailExtraModelFromJson(
        Map<String, dynamic> json) =>
    _$_PostDetailExtraModel(
      post: PostModel.fromJson(json['post'] as Map<String, dynamic>),
      isFromMyPost: json['isFromMyPost'] as bool,
      time: json['time'] as String,
      postingDate: json['postingDate'] as String?,
    );

Map<String, dynamic> _$$_PostDetailExtraModelToJson(
        _$_PostDetailExtraModel instance) =>
    <String, dynamic>{
      'post': instance.post,
      'isFromMyPost': instance.isFromMyPost,
      'time': instance.time,
      'postingDate': instance.postingDate,
    };
