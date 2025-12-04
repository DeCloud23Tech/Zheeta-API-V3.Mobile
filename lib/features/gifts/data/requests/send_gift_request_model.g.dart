// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_gift_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SendGiftRequestModel _$SendGiftRequestModelFromJson(
        Map<String, dynamic> json) =>
    _SendGiftRequestModel(
      giftId: json['giftId'] as String,
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      receiverId: json['receiverId'] as String,
      receiverUsername: json['receiverUsername'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SendGiftRequestModelToJson(
        _SendGiftRequestModel instance) =>
    <String, dynamic>{
      'giftId': instance.giftId,
      'totalQuantity': instance.totalQuantity,
      'receiverId': instance.receiverId,
      'receiverUsername': instance.receiverUsername,
      'message': instance.message,
    };
