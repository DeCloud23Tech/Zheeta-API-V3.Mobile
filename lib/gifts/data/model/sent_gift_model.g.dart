// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sent_gift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SentGiftModelImpl _$$SentGiftModelImplFromJson(Map<String, dynamic> json) =>
    _$SentGiftModelImpl(
      id: json['id'] as String,
      giftId: json['giftId'] as String,
      title: json['title'] as String,
      imageFileURL: json['imageFileURL'] as String,
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      totalAmount: (json['totalAmount'] as num).toDouble(),
      senderId: json['senderId'] as String,
      senderUserName: json['senderUserName'] as String?,
      receiverId: json['receiverId'] as String,
      receiverUserName: json['receiverUserName'] as String?,
      isRedeemed: json['isRedeemed'] as bool,
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$SentGiftModelImplToJson(_$SentGiftModelImpl instance) =>
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
