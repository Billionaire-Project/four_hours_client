// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_detail_extra_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostDetailExtraModel _$PostDetailExtraModelFromJson(Map<String, dynamic> json) {
  return _PostDetailExtraModel.fromJson(json);
}

/// @nodoc
mixin _$PostDetailExtraModel {
  PostModel get post => throw _privateConstructorUsedError;
  String get time => throw _privateConstructorUsedError;
  String? get postingDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostDetailExtraModelCopyWith<PostDetailExtraModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostDetailExtraModelCopyWith<$Res> {
  factory $PostDetailExtraModelCopyWith(PostDetailExtraModel value,
          $Res Function(PostDetailExtraModel) then) =
      _$PostDetailExtraModelCopyWithImpl<$Res, PostDetailExtraModel>;
  @useResult
  $Res call({PostModel post, String time, String? postingDate});

  $PostModelCopyWith<$Res> get post;
}

/// @nodoc
class _$PostDetailExtraModelCopyWithImpl<$Res,
        $Val extends PostDetailExtraModel>
    implements $PostDetailExtraModelCopyWith<$Res> {
  _$PostDetailExtraModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? time = null,
    Object? postingDate = freezed,
  }) {
    return _then(_value.copyWith(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: freezed == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PostModelCopyWith<$Res> get post {
    return $PostModelCopyWith<$Res>(_value.post, (value) {
      return _then(_value.copyWith(post: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_PostDetailExtraModelCopyWith<$Res>
    implements $PostDetailExtraModelCopyWith<$Res> {
  factory _$$_PostDetailExtraModelCopyWith(_$_PostDetailExtraModel value,
          $Res Function(_$_PostDetailExtraModel) then) =
      __$$_PostDetailExtraModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({PostModel post, String time, String? postingDate});

  @override
  $PostModelCopyWith<$Res> get post;
}

/// @nodoc
class __$$_PostDetailExtraModelCopyWithImpl<$Res>
    extends _$PostDetailExtraModelCopyWithImpl<$Res, _$_PostDetailExtraModel>
    implements _$$_PostDetailExtraModelCopyWith<$Res> {
  __$$_PostDetailExtraModelCopyWithImpl(_$_PostDetailExtraModel _value,
      $Res Function(_$_PostDetailExtraModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? post = null,
    Object? time = null,
    Object? postingDate = freezed,
  }) {
    return _then(_$_PostDetailExtraModel(
      post: null == post
          ? _value.post
          : post // ignore: cast_nullable_to_non_nullable
              as PostModel,
      time: null == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as String,
      postingDate: freezed == postingDate
          ? _value.postingDate
          : postingDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostDetailExtraModel implements _PostDetailExtraModel {
  _$_PostDetailExtraModel(
      {required this.post, required this.time, this.postingDate});

  factory _$_PostDetailExtraModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostDetailExtraModelFromJson(json);

  @override
  final PostModel post;
  @override
  final String time;
  @override
  final String? postingDate;

  @override
  String toString() {
    return 'PostDetailExtraModel(post: $post, time: $time, postingDate: $postingDate)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostDetailExtraModel &&
            (identical(other.post, post) || other.post == post) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.postingDate, postingDate) ||
                other.postingDate == postingDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, post, time, postingDate);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostDetailExtraModelCopyWith<_$_PostDetailExtraModel> get copyWith =>
      __$$_PostDetailExtraModelCopyWithImpl<_$_PostDetailExtraModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostDetailExtraModelToJson(
      this,
    );
  }
}

abstract class _PostDetailExtraModel implements PostDetailExtraModel {
  factory _PostDetailExtraModel(
      {required final PostModel post,
      required final String time,
      final String? postingDate}) = _$_PostDetailExtraModel;

  factory _PostDetailExtraModel.fromJson(Map<String, dynamic> json) =
      _$_PostDetailExtraModel.fromJson;

  @override
  PostModel get post;
  @override
  String get time;
  @override
  String? get postingDate;
  @override
  @JsonKey(ignore: true)
  _$$_PostDetailExtraModelCopyWith<_$_PostDetailExtraModel> get copyWith =>
      throw _privateConstructorUsedError;
}
