// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_posts_pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyPostsPaginationModel _$MyPostsPaginationModelFromJson(
    Map<String, dynamic> json) {
  return _MyPostsPaginationModel.fromJson(json);
}

/// @nodoc
mixin _$MyPostsPaginationModel {
  String get start => throw _privateConstructorUsedError;
  String get offset => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  Map<String, List<PostModel>> get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPostsPaginationModelCopyWith<MyPostsPaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostsPaginationModelCopyWith<$Res> {
  factory $MyPostsPaginationModelCopyWith(MyPostsPaginationModel value,
          $Res Function(MyPostsPaginationModel) then) =
      _$MyPostsPaginationModelCopyWithImpl<$Res, MyPostsPaginationModel>;
  @useResult
  $Res call(
      {String start,
      String offset,
      String? next,
      Map<String, List<PostModel>> posts});
}

/// @nodoc
class _$MyPostsPaginationModelCopyWithImpl<$Res,
        $Val extends MyPostsPaginationModel>
    implements $MyPostsPaginationModelCopyWith<$Res> {
  _$MyPostsPaginationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? offset = null,
    Object? next = freezed,
    Object? posts = null,
  }) {
    return _then(_value.copyWith(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      posts: null == posts
          ? _value.posts
          : posts // ignore: cast_nullable_to_non_nullable
              as Map<String, List<PostModel>>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_MyPostsPaginationModelCopyWith<$Res>
    implements $MyPostsPaginationModelCopyWith<$Res> {
  factory _$$_MyPostsPaginationModelCopyWith(_$_MyPostsPaginationModel value,
          $Res Function(_$_MyPostsPaginationModel) then) =
      __$$_MyPostsPaginationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String start,
      String offset,
      String? next,
      Map<String, List<PostModel>> posts});
}

/// @nodoc
class __$$_MyPostsPaginationModelCopyWithImpl<$Res>
    extends _$MyPostsPaginationModelCopyWithImpl<$Res,
        _$_MyPostsPaginationModel>
    implements _$$_MyPostsPaginationModelCopyWith<$Res> {
  __$$_MyPostsPaginationModelCopyWithImpl(_$_MyPostsPaginationModel _value,
      $Res Function(_$_MyPostsPaginationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? offset = null,
    Object? next = freezed,
    Object? posts = null,
  }) {
    return _then(_$_MyPostsPaginationModel(
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as String,
      offset: null == offset
          ? _value.offset
          : offset // ignore: cast_nullable_to_non_nullable
              as String,
      next: freezed == next
          ? _value.next
          : next // ignore: cast_nullable_to_non_nullable
              as String?,
      posts: null == posts
          ? _value._posts
          : posts // ignore: cast_nullable_to_non_nullable
              as Map<String, List<PostModel>>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MyPostsPaginationModel implements _MyPostsPaginationModel {
  _$_MyPostsPaginationModel(
      {required this.start,
      required this.offset,
      required this.next,
      required final Map<String, List<PostModel>> posts})
      : _posts = posts;

  factory _$_MyPostsPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyPostsPaginationModelFromJson(json);

  @override
  final String start;
  @override
  final String offset;
  @override
  final String? next;
  final Map<String, List<PostModel>> _posts;
  @override
  Map<String, List<PostModel>> get posts {
    if (_posts is EqualUnmodifiableMapView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(_posts);
  }

  @override
  String toString() {
    return 'MyPostsPaginationModel(start: $start, offset: $offset, next: $next, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPostsPaginationModel &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.offset, offset) || other.offset == offset) &&
            (identical(other.next, next) || other.next == next) &&
            const DeepCollectionEquality().equals(other._posts, _posts));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, start, offset, next,
      const DeepCollectionEquality().hash(_posts));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MyPostsPaginationModelCopyWith<_$_MyPostsPaginationModel> get copyWith =>
      __$$_MyPostsPaginationModelCopyWithImpl<_$_MyPostsPaginationModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyPostsPaginationModelToJson(
      this,
    );
  }
}

abstract class _MyPostsPaginationModel implements MyPostsPaginationModel {
  factory _MyPostsPaginationModel(
          {required final String start,
          required final String offset,
          required final String? next,
          required final Map<String, List<PostModel>> posts}) =
      _$_MyPostsPaginationModel;

  factory _MyPostsPaginationModel.fromJson(Map<String, dynamic> json) =
      _$_MyPostsPaginationModel.fromJson;

  @override
  String get start;
  @override
  String get offset;
  @override
  String? get next;
  @override
  Map<String, List<PostModel>> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_MyPostsPaginationModelCopyWith<_$_MyPostsPaginationModel> get copyWith =>
      throw _privateConstructorUsedError;
}
