// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

GiftResponseModel _$GiftResponseModelFromJson(Map<String, dynamic> json) {
  return _GiftResponseModel.fromJson(json);
}

/// @nodoc
mixin _$GiftResponseModel {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $GiftResponseModelCopyWith<GiftResponseModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GiftResponseModelCopyWith<$Res> {
  factory $GiftResponseModelCopyWith(
          GiftResponseModel value, $Res Function(GiftResponseModel) then) =
      _$GiftResponseModelCopyWithImpl<$Res, GiftResponseModel>;
  @useResult
  $Res call({int statusCode, String message, bool success});
}

/// @nodoc
class _$GiftResponseModelCopyWithImpl<$Res, $Val extends GiftResponseModel>
    implements $GiftResponseModelCopyWith<$Res> {
  _$GiftResponseModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_value.copyWith(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GiftResponseModelImplCopyWith<$Res>
    implements $GiftResponseModelCopyWith<$Res> {
  factory _$$GiftResponseModelImplCopyWith(_$GiftResponseModelImpl value,
          $Res Function(_$GiftResponseModelImpl) then) =
      __$$GiftResponseModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int statusCode, String message, bool success});
}

/// @nodoc
class __$$GiftResponseModelImplCopyWithImpl<$Res>
    extends _$GiftResponseModelCopyWithImpl<$Res, _$GiftResponseModelImpl>
    implements _$$GiftResponseModelImplCopyWith<$Res> {
  __$$GiftResponseModelImplCopyWithImpl(_$GiftResponseModelImpl _value,
      $Res Function(_$GiftResponseModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_$GiftResponseModelImpl(
      statusCode: null == statusCode
          ? _value.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _value.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GiftResponseModelImpl implements _GiftResponseModel {
  _$GiftResponseModelImpl(
      {required this.statusCode, required this.message, required this.success});

  factory _$GiftResponseModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$GiftResponseModelImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;

  @override
  String toString() {
    return 'GiftResponseModel(statusCode: $statusCode, message: $message, success: $success)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GiftResponseModelImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, success);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$GiftResponseModelImplCopyWith<_$GiftResponseModelImpl> get copyWith =>
      __$$GiftResponseModelImplCopyWithImpl<_$GiftResponseModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GiftResponseModelImplToJson(
      this,
    );
  }
}

abstract class _GiftResponseModel implements GiftResponseModel {
  factory _GiftResponseModel(
      {required final int statusCode,
      required final String message,
      required final bool success}) = _$GiftResponseModelImpl;

  factory _GiftResponseModel.fromJson(Map<String, dynamic> json) =
      _$GiftResponseModelImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  bool get success;
  @override
  @JsonKey(ignore: true)
  _$$GiftResponseModelImplCopyWith<_$GiftResponseModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
