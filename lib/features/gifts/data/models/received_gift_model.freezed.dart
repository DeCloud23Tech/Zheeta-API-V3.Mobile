// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'received_gift_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ReceivedGiftModel {
  String get id;
  String get giftId;
  String get title;
  String get imageFileURL;
  int get totalQuantity;
  double get totalAmount;
  String get senderId;
  String? get senderUserName;
  String get receiverId;
  String? get receiverUserName;
  bool get isRedeemed;
  DateTime get createdDate;

  /// Create a copy of ReceivedGiftModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReceivedGiftModelCopyWith<ReceivedGiftModel> get copyWith =>
      _$ReceivedGiftModelCopyWithImpl<ReceivedGiftModel>(
          this as ReceivedGiftModel, _$identity);

  /// Serializes this ReceivedGiftModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReceivedGiftModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.giftId, giftId) || other.giftId == giftId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageFileURL, imageFileURL) ||
                other.imageFileURL == imageFileURL) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderUserName, senderUserName) ||
                other.senderUserName == senderUserName) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverUserName, receiverUserName) ||
                other.receiverUserName == receiverUserName) &&
            (identical(other.isRedeemed, isRedeemed) ||
                other.isRedeemed == isRedeemed) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      giftId,
      title,
      imageFileURL,
      totalQuantity,
      totalAmount,
      senderId,
      senderUserName,
      receiverId,
      receiverUserName,
      isRedeemed,
      createdDate);

  @override
  String toString() {
    return 'ReceivedGiftModel(id: $id, giftId: $giftId, title: $title, imageFileURL: $imageFileURL, totalQuantity: $totalQuantity, totalAmount: $totalAmount, senderId: $senderId, senderUserName: $senderUserName, receiverId: $receiverId, receiverUserName: $receiverUserName, isRedeemed: $isRedeemed, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $ReceivedGiftModelCopyWith<$Res> {
  factory $ReceivedGiftModelCopyWith(
          ReceivedGiftModel value, $Res Function(ReceivedGiftModel) _then) =
      _$ReceivedGiftModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String giftId,
      String title,
      String imageFileURL,
      int totalQuantity,
      double totalAmount,
      String senderId,
      String? senderUserName,
      String receiverId,
      String? receiverUserName,
      bool isRedeemed,
      DateTime createdDate});
}

/// @nodoc
class _$ReceivedGiftModelCopyWithImpl<$Res>
    implements $ReceivedGiftModelCopyWith<$Res> {
  _$ReceivedGiftModelCopyWithImpl(this._self, this._then);

  final ReceivedGiftModel _self;
  final $Res Function(ReceivedGiftModel) _then;

  /// Create a copy of ReceivedGiftModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? giftId = null,
    Object? title = null,
    Object? imageFileURL = null,
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? senderId = null,
    Object? senderUserName = freezed,
    Object? receiverId = null,
    Object? receiverUserName = freezed,
    Object? isRedeemed = null,
    Object? createdDate = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      giftId: null == giftId
          ? _self.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileURL: null == imageFileURL
          ? _self.imageFileURL
          : imageFileURL // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderUserName: freezed == senderUserName
          ? _self.senderUserName
          : senderUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUserName: freezed == receiverUserName
          ? _self.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      isRedeemed: null == isRedeemed
          ? _self.isRedeemed
          : isRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReceivedGiftModel implements ReceivedGiftModel {
  _ReceivedGiftModel(
      {required this.id,
      required this.giftId,
      required this.title,
      required this.imageFileURL,
      required this.totalQuantity,
      required this.totalAmount,
      required this.senderId,
      required this.senderUserName,
      required this.receiverId,
      required this.receiverUserName,
      required this.isRedeemed,
      required this.createdDate});
  factory _ReceivedGiftModel.fromJson(Map<String, dynamic> json) =>
      _$ReceivedGiftModelFromJson(json);

  @override
  final String id;
  @override
  final String giftId;
  @override
  final String title;
  @override
  final String imageFileURL;
  @override
  final int totalQuantity;
  @override
  final double totalAmount;
  @override
  final String senderId;
  @override
  final String? senderUserName;
  @override
  final String receiverId;
  @override
  final String? receiverUserName;
  @override
  final bool isRedeemed;
  @override
  final DateTime createdDate;

  /// Create a copy of ReceivedGiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReceivedGiftModelCopyWith<_ReceivedGiftModel> get copyWith =>
      __$ReceivedGiftModelCopyWithImpl<_ReceivedGiftModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReceivedGiftModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReceivedGiftModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.giftId, giftId) || other.giftId == giftId) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.imageFileURL, imageFileURL) ||
                other.imageFileURL == imageFileURL) &&
            (identical(other.totalQuantity, totalQuantity) ||
                other.totalQuantity == totalQuantity) &&
            (identical(other.totalAmount, totalAmount) ||
                other.totalAmount == totalAmount) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.senderUserName, senderUserName) ||
                other.senderUserName == senderUserName) &&
            (identical(other.receiverId, receiverId) ||
                other.receiverId == receiverId) &&
            (identical(other.receiverUserName, receiverUserName) ||
                other.receiverUserName == receiverUserName) &&
            (identical(other.isRedeemed, isRedeemed) ||
                other.isRedeemed == isRedeemed) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      giftId,
      title,
      imageFileURL,
      totalQuantity,
      totalAmount,
      senderId,
      senderUserName,
      receiverId,
      receiverUserName,
      isRedeemed,
      createdDate);

  @override
  String toString() {
    return 'ReceivedGiftModel(id: $id, giftId: $giftId, title: $title, imageFileURL: $imageFileURL, totalQuantity: $totalQuantity, totalAmount: $totalAmount, senderId: $senderId, senderUserName: $senderUserName, receiverId: $receiverId, receiverUserName: $receiverUserName, isRedeemed: $isRedeemed, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$ReceivedGiftModelCopyWith<$Res>
    implements $ReceivedGiftModelCopyWith<$Res> {
  factory _$ReceivedGiftModelCopyWith(
          _ReceivedGiftModel value, $Res Function(_ReceivedGiftModel) _then) =
      __$ReceivedGiftModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String giftId,
      String title,
      String imageFileURL,
      int totalQuantity,
      double totalAmount,
      String senderId,
      String? senderUserName,
      String receiverId,
      String? receiverUserName,
      bool isRedeemed,
      DateTime createdDate});
}

/// @nodoc
class __$ReceivedGiftModelCopyWithImpl<$Res>
    implements _$ReceivedGiftModelCopyWith<$Res> {
  __$ReceivedGiftModelCopyWithImpl(this._self, this._then);

  final _ReceivedGiftModel _self;
  final $Res Function(_ReceivedGiftModel) _then;

  /// Create a copy of ReceivedGiftModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? giftId = null,
    Object? title = null,
    Object? imageFileURL = null,
    Object? totalQuantity = null,
    Object? totalAmount = null,
    Object? senderId = null,
    Object? senderUserName = freezed,
    Object? receiverId = null,
    Object? receiverUserName = freezed,
    Object? isRedeemed = null,
    Object? createdDate = null,
  }) {
    return _then(_ReceivedGiftModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      giftId: null == giftId
          ? _self.giftId
          : giftId // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      imageFileURL: null == imageFileURL
          ? _self.imageFileURL
          : imageFileURL // ignore: cast_nullable_to_non_nullable
              as String,
      totalQuantity: null == totalQuantity
          ? _self.totalQuantity
          : totalQuantity // ignore: cast_nullable_to_non_nullable
              as int,
      totalAmount: null == totalAmount
          ? _self.totalAmount
          : totalAmount // ignore: cast_nullable_to_non_nullable
              as double,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      senderUserName: freezed == senderUserName
          ? _self.senderUserName
          : senderUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      receiverId: null == receiverId
          ? _self.receiverId
          : receiverId // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUserName: freezed == receiverUserName
          ? _self.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String?,
      isRedeemed: null == isRedeemed
          ? _self.isRedeemed
          : isRedeemed // ignore: cast_nullable_to_non_nullable
              as bool,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
