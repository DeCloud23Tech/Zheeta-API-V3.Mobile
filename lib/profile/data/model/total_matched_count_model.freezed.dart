// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'total_matched_count_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

GetTotalMatchedCountResponse _$GetTotalMatchedCountResponseFromJson(
    Map<String, dynamic> json) {
  return _GetTotalMatchedCountResponse.fromJson(json);
}

/// @nodoc
mixin _$GetTotalMatchedCountResponse {
  int get statusCode => throw _privateConstructorUsedError;
  String get message => throw _privateConstructorUsedError;
  bool get success => throw _privateConstructorUsedError;
  int get totalCount => throw _privateConstructorUsedError;
  int get data => throw _privateConstructorUsedError;

  /// Serializes this GetTotalMatchedCountResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of GetTotalMatchedCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GetTotalMatchedCountResponseCopyWith<GetTotalMatchedCountResponse>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GetTotalMatchedCountResponseCopyWith<$Res> {
  factory $GetTotalMatchedCountResponseCopyWith(
          GetTotalMatchedCountResponse value,
          $Res Function(GetTotalMatchedCountResponse) then) =
      _$GetTotalMatchedCountResponseCopyWithImpl<$Res,
          GetTotalMatchedCountResponse>;
  @useResult
  $Res call(
      {int statusCode, String message, bool success, int totalCount, int data});
}

/// @nodoc
class _$GetTotalMatchedCountResponseCopyWithImpl<$Res,
        $Val extends GetTotalMatchedCountResponse>
    implements $GetTotalMatchedCountResponseCopyWith<$Res> {
  _$GetTotalMatchedCountResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of GetTotalMatchedCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? totalCount = null,
    Object? data = null,
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
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GetTotalMatchedCountResponseImplCopyWith<$Res>
    implements $GetTotalMatchedCountResponseCopyWith<$Res> {
  factory _$$GetTotalMatchedCountResponseImplCopyWith(
          _$GetTotalMatchedCountResponseImpl value,
          $Res Function(_$GetTotalMatchedCountResponseImpl) then) =
      __$$GetTotalMatchedCountResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int statusCode, String message, bool success, int totalCount, int data});
}

/// @nodoc
class __$$GetTotalMatchedCountResponseImplCopyWithImpl<$Res>
    extends _$GetTotalMatchedCountResponseCopyWithImpl<$Res,
        _$GetTotalMatchedCountResponseImpl>
    implements _$$GetTotalMatchedCountResponseImplCopyWith<$Res> {
  __$$GetTotalMatchedCountResponseImplCopyWithImpl(
      _$GetTotalMatchedCountResponseImpl _value,
      $Res Function(_$GetTotalMatchedCountResponseImpl) _then)
      : super(_value, _then);

  /// Create a copy of GetTotalMatchedCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
    Object? totalCount = null,
    Object? data = null,
  }) {
    return _then(_$GetTotalMatchedCountResponseImpl(
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
      totalCount: null == totalCount
          ? _value.totalCount
          : totalCount // ignore: cast_nullable_to_non_nullable
              as int,
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GetTotalMatchedCountResponseImpl
    implements _GetTotalMatchedCountResponse {
  const _$GetTotalMatchedCountResponseImpl(
      {required this.statusCode,
      required this.message,
      required this.success,
      required this.totalCount,
      required this.data});

  factory _$GetTotalMatchedCountResponseImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$GetTotalMatchedCountResponseImplFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;
  @override
  final int totalCount;
  @override
  final int data;

  @override
  String toString() {
    return 'GetTotalMatchedCountResponse(statusCode: $statusCode, message: $message, success: $success, totalCount: $totalCount, data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GetTotalMatchedCountResponseImpl &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success) &&
            (identical(other.totalCount, totalCount) ||
                other.totalCount == totalCount) &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, statusCode, message, success, totalCount, data);

  /// Create a copy of GetTotalMatchedCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GetTotalMatchedCountResponseImplCopyWith<
          _$GetTotalMatchedCountResponseImpl>
      get copyWith => __$$GetTotalMatchedCountResponseImplCopyWithImpl<
          _$GetTotalMatchedCountResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$GetTotalMatchedCountResponseImplToJson(
      this,
    );
  }
}

abstract class _GetTotalMatchedCountResponse
    implements GetTotalMatchedCountResponse {
  const factory _GetTotalMatchedCountResponse(
      {required final int statusCode,
      required final String message,
      required final bool success,
      required final int totalCount,
      required final int data}) = _$GetTotalMatchedCountResponseImpl;

  factory _GetTotalMatchedCountResponse.fromJson(Map<String, dynamic> json) =
      _$GetTotalMatchedCountResponseImpl.fromJson;

  @override
  int get statusCode;
  @override
  String get message;
  @override
  bool get success;
  @override
  int get totalCount;
  @override
  int get data;

  /// Create a copy of GetTotalMatchedCountResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GetTotalMatchedCountResponseImplCopyWith<
          _$GetTotalMatchedCountResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
