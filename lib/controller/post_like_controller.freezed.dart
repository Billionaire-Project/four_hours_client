// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_like_controller.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$PostLikeControllerParameters {
  bool get isLiked => throw _privateConstructorUsedError;
  int get postId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PostLikeControllerParametersCopyWith<PostLikeControllerParameters>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostLikeControllerParametersCopyWith<$Res> {
  factory $PostLikeControllerParametersCopyWith(
          PostLikeControllerParameters value,
          $Res Function(PostLikeControllerParameters) then) =
      _$PostLikeControllerParametersCopyWithImpl<$Res,
          PostLikeControllerParameters>;
  @useResult
  $Res call({bool isLiked, int postId});
}

/// @nodoc
class _$PostLikeControllerParametersCopyWithImpl<$Res,
        $Val extends PostLikeControllerParameters>
    implements $PostLikeControllerParametersCopyWith<$Res> {
  _$PostLikeControllerParametersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? postId = null,
  }) {
    return _then(_value.copyWith(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostLikeControllerParametersCopyWith<$Res>
    implements $PostLikeControllerParametersCopyWith<$Res> {
  factory _$$_PostLikeControllerParametersCopyWith(
          _$_PostLikeControllerParameters value,
          $Res Function(_$_PostLikeControllerParameters) then) =
      __$$_PostLikeControllerParametersCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool isLiked, int postId});
}

/// @nodoc
class __$$_PostLikeControllerParametersCopyWithImpl<$Res>
    extends _$PostLikeControllerParametersCopyWithImpl<$Res,
        _$_PostLikeControllerParameters>
    implements _$$_PostLikeControllerParametersCopyWith<$Res> {
  __$$_PostLikeControllerParametersCopyWithImpl(
      _$_PostLikeControllerParameters _value,
      $Res Function(_$_PostLikeControllerParameters) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLiked = null,
    Object? postId = null,
  }) {
    return _then(_$_PostLikeControllerParameters(
      isLiked: null == isLiked
          ? _value.isLiked
          : isLiked // ignore: cast_nullable_to_non_nullable
              as bool,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_PostLikeControllerParameters implements _PostLikeControllerParameters {
  _$_PostLikeControllerParameters(
      {required this.isLiked, required this.postId});

  @override
  final bool isLiked;
  @override
  final int postId;

  @override
  String toString() {
    return 'PostLikeControllerParameters(isLiked: $isLiked, postId: $postId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostLikeControllerParameters &&
            (identical(other.isLiked, isLiked) || other.isLiked == isLiked) &&
            (identical(other.postId, postId) || other.postId == postId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLiked, postId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_PostLikeControllerParametersCopyWith<_$_PostLikeControllerParameters>
      get copyWith => __$$_PostLikeControllerParametersCopyWithImpl<
          _$_PostLikeControllerParameters>(this, _$identity);
}

abstract class _PostLikeControllerParameters
    implements PostLikeControllerParameters {
  factory _PostLikeControllerParameters(
      {required final bool isLiked,
      required final int postId}) = _$_PostLikeControllerParameters;

  @override
  bool get isLiked;
  @override
  int get postId;
  @override
  @JsonKey(ignore: true)
  _$$_PostLikeControllerParametersCopyWith<_$_PostLikeControllerParameters>
      get copyWith => throw _privateConstructorUsedError;
}
