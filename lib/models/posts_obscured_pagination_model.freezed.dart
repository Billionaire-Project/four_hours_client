// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'posts_obscured_pagination_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PostsObscuredPaginationModel _$PostsObscuredPaginationModelFromJson(
    Map<String, dynamic> json) {
  return _PostsObscuredPaginationModel.fromJson(json);
}

/// @nodoc
mixin _$PostsObscuredPaginationModel {
  String get start => throw _privateConstructorUsedError;
  String get offset => throw _privateConstructorUsedError;
  String? get next => throw _privateConstructorUsedError;
  List<PostModel> get posts => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PostsObscuredPaginationModelCopyWith<PostsObscuredPaginationModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostsObscuredPaginationModelCopyWith<$Res> {
  factory $PostsObscuredPaginationModelCopyWith(
          PostsObscuredPaginationModel value,
          $Res Function(PostsObscuredPaginationModel) then) =
      _$PostsObscuredPaginationModelCopyWithImpl<$Res,
          PostsObscuredPaginationModel>;
  @useResult
  $Res call({String start, String offset, String? next, List<PostModel> posts});
}

/// @nodoc
class _$PostsObscuredPaginationModelCopyWithImpl<$Res,
        $Val extends PostsObscuredPaginationModel>
    implements $PostsObscuredPaginationModelCopyWith<$Res> {
  _$PostsObscuredPaginationModelCopyWithImpl(this._value, this._then);

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
              as List<PostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_PostsObscuredPaginationModelCopyWith<$Res>
    implements $PostsObscuredPaginationModelCopyWith<$Res> {
  factory _$$_PostsObscuredPaginationModelCopyWith(
          _$_PostsObscuredPaginationModel value,
          $Res Function(_$_PostsObscuredPaginationModel) then) =
      __$$_PostsObscuredPaginationModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String start, String offset, String? next, List<PostModel> posts});
}

/// @nodoc
class __$$_PostsObscuredPaginationModelCopyWithImpl<$Res>
    extends _$PostsObscuredPaginationModelCopyWithImpl<$Res,
        _$_PostsObscuredPaginationModel>
    implements _$$_PostsObscuredPaginationModelCopyWith<$Res> {
  __$$_PostsObscuredPaginationModelCopyWithImpl(
      _$_PostsObscuredPaginationModel _value,
      $Res Function(_$_PostsObscuredPaginationModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? start = null,
    Object? offset = null,
    Object? next = freezed,
    Object? posts = null,
  }) {
    return _then(_$_PostsObscuredPaginationModel(
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
              as List<PostModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_PostsObscuredPaginationModel implements _PostsObscuredPaginationModel {
  _$_PostsObscuredPaginationModel(
      {required this.start,
      required this.offset,
      required this.next,
      required final List<PostModel> posts})
      : _posts = posts;

  factory _$_PostsObscuredPaginationModel.fromJson(Map<String, dynamic> json) =>
      _$$_PostsObscuredPaginationModelFromJson(json);

  @override
  final String start;
  @override
  final String offset;
  @override
  final String? next;
  final List<PostModel> _posts;
  @override
  List<PostModel> get posts {
    if (_posts is EqualUnmodifiableListView) return _posts;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_posts);
  }

  @override
  String toString() {
    return 'PostsObscuredPaginationModel(start: $start, offset: $offset, next: $next, posts: $posts)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_PostsObscuredPaginationModel &&
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
  _$$_PostsObscuredPaginationModelCopyWith<_$_PostsObscuredPaginationModel>
      get copyWith => __$$_PostsObscuredPaginationModelCopyWithImpl<
          _$_PostsObscuredPaginationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_PostsObscuredPaginationModelToJson(
      this,
    );
  }
}

abstract class _PostsObscuredPaginationModel
    implements PostsObscuredPaginationModel {
  factory _PostsObscuredPaginationModel(
      {required final String start,
      required final String offset,
      required final String? next,
      required final List<PostModel> posts}) = _$_PostsObscuredPaginationModel;

  factory _PostsObscuredPaginationModel.fromJson(Map<String, dynamic> json) =
      _$_PostsObscuredPaginationModel.fromJson;

  @override
  String get start;
  @override
  String get offset;
  @override
  String? get next;
  @override
  List<PostModel> get posts;
  @override
  @JsonKey(ignore: true)
  _$$_PostsObscuredPaginationModelCopyWith<_$_PostsObscuredPaginationModel>
      get copyWith => throw _privateConstructorUsedError;
}
