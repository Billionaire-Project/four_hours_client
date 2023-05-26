// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'my_posts_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MyPostsModel _$MyPostsModelFromJson(Map<String, dynamic> json) {
  return _MyPostsModel.fromJson(json);
}

/// @nodoc
mixin _$MyPostsModel {
  String get start => throw _privateConstructorUsedError;
  String get offset => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  Map<String, List<PostModel>> get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MyPostsModelCopyWith<MyPostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MyPostsModelCopyWith<$Res> {
  factory $MyPostsModelCopyWith(
          MyPostsModel value, $Res Function(MyPostsModel) then) =
      _$MyPostsModelCopyWithImpl<$Res, MyPostsModel>;
  @useResult
  $Res call(
      {String start,
      String offset,
      String? next,
      Map<String, List<PostModel>> posts});
}

/// @nodoc
class _$MyPostsModelCopyWithImpl<$Res, $Val extends MyPostsModel>
    implements $MyPostsModelCopyWith<$Res> {
  _$MyPostsModelCopyWithImpl(this._value, this._then);

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
abstract class _$$_MyPostsModelCopyWith<$Res>
    implements $MyPostsModelCopyWith<$Res> {
  factory _$$_MyPostsModelCopyWith(
          _$_MyPostsModel value, $Res Function(_$_MyPostsModel) then) =
      __$$_MyPostsModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String start,
      String offset,
      String? next,
      Map<String, List<PostModel>> posts});
}

/// @nodoc
class __$$_MyPostsModelCopyWithImpl<$Res>
    extends _$MyPostsModelCopyWithImpl<$Res, _$_MyPostsModel>
    implements _$$_MyPostsModelCopyWith<$Res> {
  __$$_MyPostsModelCopyWithImpl(
      _$_MyPostsModel _value, $Res Function(_$_MyPostsModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? offset = null,
    Object? next = freezed,
    Object? posts = null,
  }) {
    return _then(_$_MyPostsModel(
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
class _$_MyPostsModel implements _MyPostsModel {
  _$_MyPostsModel(
      {required this.start,
      required this.offset,
      required this.next,
      required final Map<String, List<PostModel>> posts})
      : _posts = posts;

  factory _$_MyPostsModel.fromJson(Map<String, dynamic> json) =>
      _$$_MyPostsModelFromJson(json);

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
    return 'MyPostsModel(start: $start, offset: $offset, next: $next, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MyPostsModel &&
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
  _$$_MyPostsModelCopyWith<_$_MyPostsModel> get copyWith =>
      __$$_MyPostsModelCopyWithImpl<_$_MyPostsModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MyPostsModelToJson(
      this,
    );
  }
}

abstract class _MyPostsModel implements MyPostsModel {
  factory _MyPostsModel(
      {required final String start,
      required final String offset,
      required final String? next,
      required final Map<String, List<PostModel>> posts}) = _$_MyPostsModel;

  factory _MyPostsModel.fromJson(Map<String, dynamic> json) =
      _$_MyPostsModel.fromJson;

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
  _$$_MyPostsModelCopyWith<_$_MyPostsModel> get copyWith =>
      throw _privateConstructorUsedError;
}
