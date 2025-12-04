// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'gift_response_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$GiftResponseModel {
  int get statusCode;
  String get message;
  bool get success;

  /// Create a copy of GiftResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GiftResponseModelCopyWith<GiftResponseModel> get copyWith =>
      _$GiftResponseModelCopyWithImpl<GiftResponseModel>(
          this as GiftResponseModel, _$identity);

  /// Serializes this GiftResponseModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GiftResponseModel &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, success);

  @override
  String toString() {
    return 'GiftResponseModel(statusCode: $statusCode, message: $message, success: $success)';
  }
}

/// @nodoc
abstract mixin class $GiftResponseModelCopyWith<$Res> {
  factory $GiftResponseModelCopyWith(
          GiftResponseModel value, $Res Function(GiftResponseModel) _then) =
      _$GiftResponseModelCopyWithImpl;
  @useResult
  $Res call({int statusCode, String message, bool success});
}

/// @nodoc
class _$GiftResponseModelCopyWithImpl<$Res>
    implements $GiftResponseModelCopyWith<$Res> {
  _$GiftResponseModelCopyWithImpl(this._self, this._then);

  final GiftResponseModel _self;
  final $Res Function(GiftResponseModel) _then;

  /// Create a copy of GiftResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_self.copyWith(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GiftResponseModel implements GiftResponseModel {
  _GiftResponseModel(
      {required this.statusCode, required this.message, required this.success});
  factory _GiftResponseModel.fromJson(Map<String, dynamic> json) =>
      _$GiftResponseModelFromJson(json);

  @override
  final int statusCode;
  @override
  final String message;
  @override
  final bool success;

  /// Create a copy of GiftResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GiftResponseModelCopyWith<_GiftResponseModel> get copyWith =>
      __$GiftResponseModelCopyWithImpl<_GiftResponseModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GiftResponseModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GiftResponseModel &&
            (identical(other.statusCode, statusCode) ||
                other.statusCode == statusCode) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.success, success) || other.success == success));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, statusCode, message, success);

  @override
  String toString() {
    return 'GiftResponseModel(statusCode: $statusCode, message: $message, success: $success)';
  }
}

/// @nodoc
abstract mixin class _$GiftResponseModelCopyWith<$Res>
    implements $GiftResponseModelCopyWith<$Res> {
  factory _$GiftResponseModelCopyWith(
          _GiftResponseModel value, $Res Function(_GiftResponseModel) _then) =
      __$GiftResponseModelCopyWithImpl;
  @override
  @useResult
  $Res call({int statusCode, String message, bool success});
}

/// @nodoc
class __$GiftResponseModelCopyWithImpl<$Res>
    implements _$GiftResponseModelCopyWith<$Res> {
  __$GiftResponseModelCopyWithImpl(this._self, this._then);

  final _GiftResponseModel _self;
  final $Res Function(_GiftResponseModel) _then;

  /// Create a copy of GiftResponseModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? statusCode = null,
    Object? message = null,
    Object? success = null,
  }) {
    return _then(_GiftResponseModel(
      statusCode: null == statusCode
          ? _self.statusCode
          : statusCode // ignore: cast_nullable_to_non_nullable
              as int,
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      success: null == success
          ? _self.success
          : success // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
