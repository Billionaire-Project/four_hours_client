// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'receipt_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ReceiptModel _$$_ReceiptModelFromJson(Map<String, dynamic> json) =>
    _$_ReceiptModel(
      isPostable: json['is_postable'] as bool,
      isReadable: json['is_readable'] as bool,
      readableEndedAt: json['readable_ended_at'] as String?,
      postableAt: json['postable_at'] as String?,
      postDeleteStack: json['post_delete_stack'] as int,
    );

Map<String, dynamic> _$$_ReceiptModelToJson(_$_ReceiptModel instance) =>
    <String, dynamic>{
      'is_postable': instance.isPostable,
      'is_readable': instance.isReadable,
      'readable_ended_at': instance.readableEndedAt,
      'postable_at': instance.postableAt,
      'post_delete_stack': instance.postDeleteStack,
    };
