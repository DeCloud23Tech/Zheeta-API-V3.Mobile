// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'send_gift_request_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SendGiftRequestModel _$SendGiftRequestModelFromJson(Map<String, dynamic> json) {
  return _SendGiftRequestModel.fromJson(json);
}

/// @nodoc
mixin _$SendGiftRequestModel {
  String get giftId => throw _privateConstructorUsedError;
  int get totalQuantity => throw _privateConstructorUsedError;
  String get receiverId => throw _privateConstructorUsedError;
  String get receiverUsername => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  /// Serializes this SendGiftRequestModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $SendGiftRequestModelCopyWith<SendGiftRequestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SendGiftRequestModelCopyWith<$Res> {
  factory $SendGiftRequestModelCopyWith(SendGiftRequestModel value,
          $Res Function(SendGiftRequestModel) then) =
      _$SendGiftRequestModelCopyWithImpl<$Res, SendGiftRequestModel>;
  @useResult
  $Res call(
      {String giftId,
      int totalQuantity,
      String receiverId,
      String receiverUsername,
      String? message});
}

/// @nodoc
class _$SendGiftRequestModelCopyWithImpl<$Res,
        $Val extends SendGiftRequestModel>
    implements $SendGiftRequestModelCopyWith<$Res> {
  _$SendGiftRequestModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      giftId: null == giftId
          ? _value.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUsername: null == receiverUsername
          ? _value.receiverUsername
          : receiverUsername // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SendGiftRequestModelImplCopyWith<$Res>
    implements $SendGiftRequestModelCopyWith<$Res> {
  factory _$$SendGiftRequestModelImplCopyWith(_$SendGiftRequestModelImpl value,
          $Res Function(_$SendGiftRequestModelImpl) then) =
      __$$SendGiftRequestModelImplCopyWithImpl<$Res>;
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
class __$$SendGiftRequestModelImplCopyWithImpl<$Res>
    extends _$SendGiftRequestModelCopyWithImpl<$Res, _$SendGiftRequestModelImpl>
    implements _$$SendGiftRequestModelImplCopyWith<$Res> {
  __$$SendGiftRequestModelImplCopyWithImpl(_$SendGiftRequestModelImpl _value,
      $Res Function(_$SendGiftRequestModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$SendGiftRequestModelImpl(
      giftId: null == giftId
          ? _value.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _value.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      receiverId: null == receiverId
          ? _value.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUsername: null == receiverUsername
          ? _value.receiverUsername
          : receiverUsername // ignore: cast_nullable_to_non_nullable
              as String,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SendGiftRequestModelImpl implements _SendGiftRequestModel {
  _$SendGiftRequestModelImpl(
      {required this.giftId,
      required this.totalQuantity,
      required this.receiverId,
      required this.receiverUsername,
      this.message});

  factory _$SendGiftRequestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SendGiftRequestModelImplFromJson(json);

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

  @override
  String toString() {
    return 'SendGiftRequestModel(giftId: $giftId, totalQuantity: $totalQuantity, receiverId: $receiverId, receiverUsername: $receiverUsername, message: $message)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SendGiftRequestModelImpl &&
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

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$SendGiftRequestModelImplCopyWith<_$SendGiftRequestModelImpl>
      get copyWith =>
          __$$SendGiftRequestModelImplCopyWithImpl<_$SendGiftRequestModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SendGiftRequestModelImplToJson(
      this,
    );
  }
}

abstract class _SendGiftRequestModel implements SendGiftRequestModel {
  factory _SendGiftRequestModel(
      {required final String giftId,
      required final int totalQuantity,
      required final String receiverId,
      required final String receiverUsername,
      final String? message}) = _$SendGiftRequestModelImpl;

  factory _SendGiftRequestModel.fromJson(Map<String, dynamic> json) =
      _$SendGiftRequestModelImpl.fromJson;

  @override
  String get giftId;
  @override
  int get totalQuantity;
  @override
  String get receiverId;
  @override
  String get receiverUsername;
  @override
  String? get message;

  /// Create a copy of SendGiftRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$SendGiftRequestModelImplCopyWith<_$SendGiftRequestModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
