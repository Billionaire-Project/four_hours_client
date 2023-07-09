// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'topic_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

TopicModel _$TopicModelFromJson(Map<String, dynamic> json) {
  return _TopicModel.fromJson(json);
}

/// @nodoc
mixin _$TopicModel {
  String get topic => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $TopicModelCopyWith<TopicModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $TopicModelCopyWith<$Res> {
  factory $TopicModelCopyWith(
          TopicModel value, $Res Function(TopicModel) then) =
      _$TopicModelCopyWithImpl<$Res, TopicModel>;
  @useResult
  $Res call({String topic, String content});
}

/// @nodoc
class _$TopicModelCopyWithImpl<$Res, $Val extends TopicModel>
    implements $TopicModelCopyWith<$Res> {
  _$TopicModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? content = null,
  }) {
    return _then(_value.copyWith(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_TopicModelCopyWith<$Res>
    implements $TopicModelCopyWith<$Res> {
  factory _$$_TopicModelCopyWith(
          _$_TopicModel value, $Res Function(_$_TopicModel) then) =
      __$$_TopicModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String topic, String content});
}

/// @nodoc
class __$$_TopicModelCopyWithImpl<$Res>
    extends _$TopicModelCopyWithImpl<$Res, _$_TopicModel>
    implements _$$_TopicModelCopyWith<$Res> {
  __$$_TopicModelCopyWithImpl(
      _$_TopicModel _value, $Res Function(_$_TopicModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? topic = null,
    Object? content = null,
  }) {
    return _then(_$_TopicModel(
      topic: null == topic
          ? _value.topic
          : topic // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_TopicModel implements _TopicModel {
  _$_TopicModel({required this.topic, required this.content});

  factory _$_TopicModel.fromJson(Map<String, dynamic> json) =>
      _$$_TopicModelFromJson(json);

  @override
  final String topic;
  @override
  final String content;

  @override
  String toString() {
    return 'TopicModel(topic: $topic, content: $content)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_TopicModel &&
            (identical(other.topic, topic) || other.topic == topic) &&
            (identical(other.content, content) || other.content == content));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, topic, content);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_TopicModelCopyWith<_$_TopicModel> get copyWith =>
      __$$_TopicModelCopyWithImpl<_$_TopicModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_TopicModelToJson(
      this,
    );
  }
}

abstract class _TopicModel implements TopicModel {
  factory _TopicModel(
      {required final String topic,
      required final String content}) = _$_TopicModel;

  factory _TopicModel.fromJson(Map<String, dynamic> json) =
      _$_TopicModel.fromJson;

  @override
  String get topic;
  @override
  String get content;
  @override
  @JsonKey(ignore: true)
  _$$_TopicModelCopyWith<_$_TopicModel> get copyWith =>
      throw _privateConstructorUsedError;
}
