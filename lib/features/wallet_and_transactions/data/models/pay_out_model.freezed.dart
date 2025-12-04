// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'pay_out_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PayoutData {
  bool get status;
  String get message;
  String get provider;
  String? get errors;

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PayoutDataCopyWith<PayoutData> get copyWith =>
      _$PayoutDataCopyWithImpl<PayoutData>(this as PayoutData, _$identity);

  /// Serializes this PayoutData to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PayoutData &&
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

  @override
  String toString() {
    return 'PayoutData(status: $status, message: $message, provider: $provider, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class $PayoutDataCopyWith<$Res> {
  factory $PayoutDataCopyWith(
          PayoutData value, $Res Function(PayoutData) _then) =
      _$PayoutDataCopyWithImpl;
  @useResult
  $Res call({bool status, String message, String provider, String? errors});
}

/// @nodoc
class _$PayoutDataCopyWithImpl<$Res> implements $PayoutDataCopyWith<$Res> {
  _$PayoutDataCopyWithImpl(this._self, this._then);

  final PayoutData _self;
  final $Res Function(PayoutData) _then;

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
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PayoutData implements PayoutData {
  _PayoutData(
      {required this.status,
      required this.message,
      required this.provider,
      this.errors});
  factory _PayoutData.fromJson(Map<String, dynamic> json) =>
      _$PayoutDataFromJson(json);

  @override
  final bool status;
  @override
  final String message;
  @override
  final String provider;
  @override
  final String? errors;

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PayoutDataCopyWith<_PayoutData> get copyWith =>
      __$PayoutDataCopyWithImpl<_PayoutData>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PayoutDataToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PayoutData &&
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

  @override
  String toString() {
    return 'PayoutData(status: $status, message: $message, provider: $provider, errors: $errors)';
  }
}

/// @nodoc
abstract mixin class _$PayoutDataCopyWith<$Res>
    implements $PayoutDataCopyWith<$Res> {
  factory _$PayoutDataCopyWith(
          _PayoutData value, $Res Function(_PayoutData) _then) =
      __$PayoutDataCopyWithImpl;
  @override
  @useResult
  $Res call({bool status, String message, String provider, String? errors});
}

/// @nodoc
class __$PayoutDataCopyWithImpl<$Res> implements _$PayoutDataCopyWith<$Res> {
  __$PayoutDataCopyWithImpl(this._self, this._then);

  final _PayoutData _self;
  final $Res Function(_PayoutData) _then;

  /// Create a copy of PayoutData
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? message = null,
    Object? provider = null,
    Object? errors = freezed,
  }) {
    return _then(_PayoutData(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as bool,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      provider: null == provider
          ? _self.provider
          : provider // ignore: cast_nullable_to_non_nullable
              as String,
      errors: freezed == errors
          ? _self.errors
          : errors // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
