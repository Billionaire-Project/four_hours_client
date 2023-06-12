// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'delete_reason_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

DeleteReasonModel _$DeleteReasonModelFromJson(Map<String, dynamic> json) {
  return _DeleteReasonModel.fromJson(json);
}

/// @nodoc
mixin _$DeleteReasonModel {
  int get id => throw _privateConstructorUsedError;
  String get reason => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeleteReasonModelCopyWith<DeleteReasonModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeleteReasonModelCopyWith<$Res> {
  factory $DeleteReasonModelCopyWith(
          DeleteReasonModel value, $Res Function(DeleteReasonModel) then) =
      _$DeleteReasonModelCopyWithImpl<$Res, DeleteReasonModel>;
  @useResult
  $Res call({int id, String reason});
}

/// @nodoc
class _$DeleteReasonModelCopyWithImpl<$Res, $Val extends DeleteReasonModel>
    implements $DeleteReasonModelCopyWith<$Res> {
  _$DeleteReasonModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_DeleteReasonModelCopyWith<$Res>
    implements $DeleteReasonModelCopyWith<$Res> {
  factory _$$_DeleteReasonModelCopyWith(_$_DeleteReasonModel value,
          $Res Function(_$_DeleteReasonModel) then) =
      __$$_DeleteReasonModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String reason});
}

/// @nodoc
class __$$_DeleteReasonModelCopyWithImpl<$Res>
    extends _$DeleteReasonModelCopyWithImpl<$Res, _$_DeleteReasonModel>
    implements _$$_DeleteReasonModelCopyWith<$Res> {
  __$$_DeleteReasonModelCopyWithImpl(
      _$_DeleteReasonModel _value, $Res Function(_$_DeleteReasonModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? reason = null,
  }) {
    return _then(_$_DeleteReasonModel(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      reason: null == reason
          ? _value.reason
          : reason // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_DeleteReasonModel implements _DeleteReasonModel {
  _$_DeleteReasonModel({required this.id, required this.reason});

  factory _$_DeleteReasonModel.fromJson(Map<String, dynamic> json) =>
      _$$_DeleteReasonModelFromJson(json);

  @override
  final int id;
  @override
  final String reason;

  @override
  String toString() {
    return 'DeleteReasonModel(id: $id, reason: $reason)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_DeleteReasonModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.reason, reason) || other.reason == reason));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, reason);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_DeleteReasonModelCopyWith<_$_DeleteReasonModel> get copyWith =>
      __$$_DeleteReasonModelCopyWithImpl<_$_DeleteReasonModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_DeleteReasonModelToJson(
      this,
    );
  }
}

abstract class _DeleteReasonModel implements DeleteReasonModel {
  factory _DeleteReasonModel(
      {required final int id,
      required final String reason}) = _$_DeleteReasonModel;

  factory _DeleteReasonModel.fromJson(Map<String, dynamic> json) =
      _$_DeleteReasonModel.fromJson;

  @override
  int get id;
  @override
  String get reason;
  @override
  @JsonKey(ignore: true)
  _$$_DeleteReasonModelCopyWith<_$_DeleteReasonModel> get copyWith =>
      throw _privateConstructorUsedError;
}
