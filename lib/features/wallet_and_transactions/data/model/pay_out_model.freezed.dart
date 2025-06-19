// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_out_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PayoutData _$PayoutDataFromJson(Map<String, dynamic> json) {
  return _PayoutData.fromJson(json);
}

/// @nodoc
mixin _$PayoutData {
  bool get status => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  String get provider => throw _privateConstructorUsedError;
  String? get errors => throw _privateConstructorUsedError;

  /// Serializes this PayoutData to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PayoutDataCopyWith<PayoutData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PayoutDataCopyWith<$Res> {
  factory $PayoutDataCopyWith(
          PayoutData value, $Res Function(PayoutData) then) =
      _$PayoutDataCopyWithImpl<$Res, PayoutData>;
  @useResult
  $Res call({bool status, String message, String provider, String? errors});
}

/// @nodoc
class _$PayoutDataCopyWithImpl<$Res, $Val extends PayoutData>
    implements $PayoutDataCopyWith<$Res> {
  _$PayoutDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? provider = null,
    Object? errors = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PayoutDataImplCopyWith<$Res>
    implements $PayoutDataCopyWith<$Res> {
  factory _$$PayoutDataImplCopyWith(
          _$PayoutDataImpl value, $Res Function(_$PayoutDataImpl) then) =
      __$$PayoutDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({bool status, String message, String provider, String? errors});
}

/// @nodoc
class __$$PayoutDataImplCopyWithImpl<$Res>
    extends _$PayoutDataCopyWithImpl<$Res, _$PayoutDataImpl>
    implements _$$PayoutDataImplCopyWith<$Res> {
  __$$PayoutDataImplCopyWithImpl(
      _$PayoutDataImpl _value, $Res Function(_$PayoutDataImpl) _then)
      : super(_value, _then);

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? provider = null,
    Object? errors = freezed,
  }) {
    return _then(_$PayoutDataImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _value.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _value.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PayoutDataImpl implements _PayoutData {
  _$PayoutDataImpl(
      {required this.status,
      required this.message,
      required this.provider,
      this.errors});

  factory _$PayoutDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$PayoutDataImplFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final String provider;
  @override
  final String? errors;

  @override
  String toString() {
    return 'PayoutData(status: $status, message: $message, provider: $provider, errors: $errors)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PayoutDataImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.provider, provider) ||
                other.provider == provider) &&
            (identical(other.errors, errors) || other.errors == errors));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, status, message, provider, errors);

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PayoutDataImplCopyWith<_$PayoutDataImpl> get copyWith =>
      __$$PayoutDataImplCopyWithImpl<_$PayoutDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PayoutDataImplToJson(
      this,
    );
  }
}

abstract class _PayoutData implements PayoutData {
  factory _PayoutData(
      {required final bool status,
      required final String message,
      required final String provider,
      final String? errors}) = _$PayoutDataImpl;

  factory _PayoutData.fromJson(Map<String, dynamic> json) =
      _$PayoutDataImpl.fromJson;

  @override
  bool get status;
  @override
  String get message;
  @override
  String get provider;
  @override
  String? get errors;

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PayoutDataImplCopyWith<_$PayoutDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
