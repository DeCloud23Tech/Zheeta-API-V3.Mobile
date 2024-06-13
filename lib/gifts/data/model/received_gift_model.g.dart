// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'received_gift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ReceivedGiftModelImpl _$$ReceivedGiftModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceivedGiftModelImpl(
      id: json['id'] as String,
      giftId: json['giftId'] as String,
      title: json['title'] as String,
      imageFileURL: json['imageFileURL'] as String,
      totalQuantity: json['totalQuantity'] as int,
      totalAmount: (json['totalAmount'] as num).toDouble(),
      senderId: json['senderId'] as String,
      senderUserName: json['senderUserName'] as String,
      receiverId: json['receiverId'] as String,
      receiverUserName: json['receiverUserName'] as String,
      isRedeemed: json['isRedeemed'] as bool,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$ReceivedGiftModelImplToJson(
        _$ReceivedGiftModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'giftId': instance.giftId,
      'title': instance.title,
      'imageFileURL': instance.imageFileURL,
      'totalQuantity': instance.totalQuantity,
      'totalAmount': instance.totalAmount,
      'senderId': instance.senderId,
      'senderUserName': instance.senderUserName,
      'receiverId': instance.receiverId,
      'receiverUserName': instance.receiverUserName,
      'isRedeemed': instance.isRedeemed,
      'createdDate': instance.createdDate.toIso8601String(),
    };

_$ReceivedGiftListModelImpl _$$ReceivedGiftListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ReceivedGiftListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ReceivedGiftModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ReceivedGiftListModelImplToJson(
        _$ReceivedGiftListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
