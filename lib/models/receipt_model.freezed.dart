// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'receipt_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ReceiptModel _$ReceiptModelFromJson(Map<String, dynamic> json) {
  return _ReceiptModel.fromJson(json);
}

/// @nodoc
mixin _$ReceiptModel {
  @JsonKey(name: 'is_postable')
  bool get isPostable => throw _privateConstructorUsedError;
  @JsonKey(name: 'is_readable')
  bool get isReadable => throw _privateConstructorUsedError;
  @JsonKey(name: 'readable_ended_at')
  String? get readableEndedAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'postable_at')
  String? get postableAt => throw _privateConstructorUsedError;
  @JsonKey(name: 'post_delete_stack')
  int get postDeleteStack => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ReceiptModelCopyWith<ReceiptModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ReceiptModelCopyWith<$Res> {
  factory $ReceiptModelCopyWith(
          ReceiptModel value, $Res Function(ReceiptModel) then) =
      _$ReceiptModelCopyWithImpl<$Res, ReceiptModel>;
  @useResult
  $Res call(
      {@JsonKey(name: 'is_postable') bool isPostable,
      @JsonKey(name: 'is_readable') bool isReadable,
      @JsonKey(name: 'readable_ended_at') String? readableEndedAt,
      @JsonKey(name: 'postable_at') String? postableAt,
      @JsonKey(name: 'post_delete_stack') int postDeleteStack});
}

/// @nodoc
class _$ReceiptModelCopyWithImpl<$Res, $Val extends ReceiptModel>
    implements $ReceiptModelCopyWith<$Res> {
  _$ReceiptModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPostable = null,
    Object? isReadable = null,
    Object? readableEndedAt = freezed,
    Object? postableAt = freezed,
    Object? postDeleteStack = null,
  }) {
    return _then(_value.copyWith(
      isPostable: null == isPostable
          ? _value.isPostable
          : isPostable // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadable: null == isReadable
          ? _value.isReadable
          : isReadable // ignore: cast_nullable_to_non_nullable
              as bool,
      readableEndedAt: freezed == readableEndedAt
          ? _value.readableEndedAt
          : readableEndedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postableAt: freezed == postableAt
          ? _value.postableAt
          : postableAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postDeleteStack: null == postDeleteStack
          ? _value.postDeleteStack
          : postDeleteStack // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ReceiptModelCopyWith<$Res>
    implements $ReceiptModelCopyWith<$Res> {
  factory _$$_ReceiptModelCopyWith(
          _$_ReceiptModel value, $Res Function(_$_ReceiptModel) then) =
      __$$_ReceiptModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'is_postable') bool isPostable,
      @JsonKey(name: 'is_readable') bool isReadable,
      @JsonKey(name: 'readable_ended_at') String? readableEndedAt,
      @JsonKey(name: 'postable_at') String? postableAt,
      @JsonKey(name: 'post_delete_stack') int postDeleteStack});
}

/// @nodoc
class __$$_ReceiptModelCopyWithImpl<$Res>
    extends _$ReceiptModelCopyWithImpl<$Res, _$_ReceiptModel>
    implements _$$_ReceiptModelCopyWith<$Res> {
  __$$_ReceiptModelCopyWithImpl(
      _$_ReceiptModel _value, $Res Function(_$_ReceiptModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isPostable = null,
    Object? isReadable = null,
    Object? readableEndedAt = freezed,
    Object? postableAt = freezed,
    Object? postDeleteStack = null,
  }) {
    return _then(_$_ReceiptModel(
      isPostable: null == isPostable
          ? _value.isPostable
          : isPostable // ignore: cast_nullable_to_non_nullable
              as bool,
      isReadable: null == isReadable
          ? _value.isReadable
          : isReadable // ignore: cast_nullable_to_non_nullable
              as bool,
      readableEndedAt: freezed == readableEndedAt
          ? _value.readableEndedAt
          : readableEndedAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postableAt: freezed == postableAt
          ? _value.postableAt
          : postableAt // ignore: cast_nullable_to_non_nullable
              as String?,
      postDeleteStack: null == postDeleteStack
          ? _value.postDeleteStack
          : postDeleteStack // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_ReceiptModel implements _ReceiptModel {
  _$_ReceiptModel(
      {@JsonKey(name: 'is_postable') required this.isPostable,
      @JsonKey(name: 'is_readable') required this.isReadable,
      @JsonKey(name: 'readable_ended_at') required this.readableEndedAt,
      @JsonKey(name: 'postable_at') required this.postableAt,
      @JsonKey(name: 'post_delete_stack') required this.postDeleteStack});

  factory _$_ReceiptModel.fromJson(Map<String, dynamic> json) =>
      _$$_ReceiptModelFromJson(json);

  @override
  @JsonKey(name: 'is_postable')
  final bool isPostable;
  @override
  @JsonKey(name: 'is_readable')
  final bool isReadable;
  @override
  @JsonKey(name: 'readable_ended_at')
  final String? readableEndedAt;
  @override
  @JsonKey(name: 'postable_at')
  final String? postableAt;
  @override
  @JsonKey(name: 'post_delete_stack')
  final int postDeleteStack;

  @override
  String toString() {
    return 'ReceiptModel(isPostable: $isPostable, isReadable: $isReadable, readableEndedAt: $readableEndedAt, postableAt: $postableAt, postDeleteStack: $postDeleteStack)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ReceiptModel &&
            (identical(other.isPostable, isPostable) ||
                other.isPostable == isPostable) &&
            (identical(other.isReadable, isReadable) ||
                other.isReadable == isReadable) &&
            (identical(other.readableEndedAt, readableEndedAt) ||
                other.readableEndedAt == readableEndedAt) &&
            (identical(other.postableAt, postableAt) ||
                other.postableAt == postableAt) &&
            (identical(other.postDeleteStack, postDeleteStack) ||
                other.postDeleteStack == postDeleteStack));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, isPostable, isReadable,
      readableEndedAt, postableAt, postDeleteStack);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ReceiptModelCopyWith<_$_ReceiptModel> get copyWith =>
      __$$_ReceiptModelCopyWithImpl<_$_ReceiptModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_ReceiptModelToJson(
      this,
    );
  }
}

abstract class _ReceiptModel implements ReceiptModel {
  factory _ReceiptModel(
      {@JsonKey(name: 'is_postable')
          required final bool isPostable,
      @JsonKey(name: 'is_readable')
          required final bool isReadable,
      @JsonKey(name: 'readable_ended_at')
          required final String? readableEndedAt,
      @JsonKey(name: 'postable_at')
          required final String? postableAt,
      @JsonKey(name: 'post_delete_stack')
          required final int postDeleteStack}) = _$_ReceiptModel;

  factory _ReceiptModel.fromJson(Map<String, dynamic> json) =
      _$_ReceiptModel.fromJson;

  @override
  @JsonKey(name: 'is_postable')
  bool get isPostable;
  @override
  @JsonKey(name: 'is_readable')
  bool get isReadable;
  @override
  @JsonKey(name: 'readable_ended_at')
  String? get readableEndedAt;
  @override
  @JsonKey(name: 'postable_at')
  String? get postableAt;
  @override
  @JsonKey(name: 'post_delete_stack')
  int get postDeleteStack;
  @override
  @JsonKey(ignore: true)
  _$$_ReceiptModelCopyWith<_$_ReceiptModel> get copyWith =>
      throw _privateConstructorUsedError;
}
