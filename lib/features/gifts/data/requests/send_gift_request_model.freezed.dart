// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_gift_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SendGiftRequestModel {
  String get giftId;
  int get totalQuantity;
  String get receiverId;
  String get receiverUsername;
  String? get message;

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SendGiftRequestModelCopyWith<SendGiftRequestModel> get copyWith =>
      _$SendGiftRequestModelCopyWithImpl<SendGiftRequestModel>(
          this as SendGiftRequestModel, _$identity);

  /// Serializes this SendGiftRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SendGiftRequestModel &&
            (identical(other.giftId, giftId) || other.giftId == giftId) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverUsername, receiverUsername) ||
                other.receiverUsername == receiverUsername) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, giftId, totalQuantity,
      receiverId, receiverUsername, message);

  @override
  String toString() {
    return 'SendGiftRequestModel(giftId: $giftId, totalQuantity: $totalQuantity, receiverId: $receiverId, receiverUsername: $receiverUsername, message: $message)';
  }
}

/// @nodoc
abstract mixin class $SendGiftRequestModelCopyWith<$Res> {
  factory $SendGiftRequestModelCopyWith(SendGiftRequestModel value,
          $Res Function(SendGiftRequestModel) _then) =
      _$SendGiftRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {String giftId,
      int totalQuantity,
      String receiverId,
      String receiverUsername,
      String? message});
}

/// @nodoc
class _$SendGiftRequestModelCopyWithImpl<$Res>
    implements $SendGiftRequestModelCopyWith<$Res> {
  _$SendGiftRequestModelCopyWithImpl(this._self, this._then);

  final SendGiftRequestModel _self;
  final $Res Function(SendGiftRequestModel) _then;

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? giftId = null,
    Object? totalQuantity = null,
    Object? receiverId = null,
    Object? receiverUsername = null,
    Object? message = freezed,
  }) {
    return _then(_self.copyWith(
      giftId: null == giftId
          ? _self.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUsername: null == receiverUsername
          ? _self.receiverUsername
          : receiverUsername // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SendGiftRequestModel implements SendGiftRequestModel {
  _SendGiftRequestModel(
      {required this.giftId,
      required this.totalQuantity,
      required this.receiverId,
      required this.receiverUsername,
      this.message});
  factory _SendGiftRequestModel.fromJson(Map<String, dynamic> json) =>
      _$SendGiftRequestModelFromJson(json);

  @override
  final String giftId;
  @override
  final int totalQuantity;
  @override
  final String receiverId;
  @override
  final String receiverUsername;
  @override
  final String? message;

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SendGiftRequestModelCopyWith<_SendGiftRequestModel> get copyWith =>
      __$SendGiftRequestModelCopyWithImpl<_SendGiftRequestModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SendGiftRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SendGiftRequestModel &&
            (identical(other.giftId, giftId) || other.giftId == giftId) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverUsername, receiverUsername) ||
                other.receiverUsername == receiverUsername) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, giftId, totalQuantity,
      receiverId, receiverUsername, message);

  @override
  String toString() {
    return 'SendGiftRequestModel(giftId: $giftId, totalQuantity: $totalQuantity, receiverId: $receiverId, receiverUsername: $receiverUsername, message: $message)';
  }
}

/// @nodoc
abstract mixin class _$SendGiftRequestModelCopyWith<$Res>
    implements $SendGiftRequestModelCopyWith<$Res> {
  factory _$SendGiftRequestModelCopyWith(_SendGiftRequestModel value,
          $Res Function(_SendGiftRequestModel) _then) =
      __$SendGiftRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String giftId,
      int totalQuantity,
      String receiverId,
      String receiverUsername,
      String? message});
}

/// @nodoc
class __$SendGiftRequestModelCopyWithImpl<$Res>
    implements _$SendGiftRequestModelCopyWith<$Res> {
  __$SendGiftRequestModelCopyWithImpl(this._self, this._then);

  final _SendGiftRequestModel _self;
  final $Res Function(_SendGiftRequestModel) _then;

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? giftId = null,
    Object? totalQuantity = null,
    Object? receiverId = null,
    Object? receiverUsername = null,
    Object? message = freezed,
  }) {
    return _then(_SendGiftRequestModel(
      giftId: null == giftId
          ? _self.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUsername: null == receiverUsername
          ? _self.receiverUsername
          : receiverUsername // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
