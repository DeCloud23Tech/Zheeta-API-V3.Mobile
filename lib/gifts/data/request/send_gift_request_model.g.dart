// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_gift_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendGiftRequestModelImpl _$$SendGiftRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendGiftRequestModelImpl(
      giftId: json['GiftId'] as String,
      totalQuantity: json['TotalQuantity'] as int,
      receiverUsername: json['ReceiverUsername'] as String,
      message: json['Message'] as String?,
    );

Map<String, dynamic> _$$SendGiftRequestModelImplToJson(
        _$SendGiftRequestModelImpl instance) =>
    <String, dynamic>{
      'GiftId': instance.giftId,
      'TotalQuantity': instance.totalQuantity,
      'ReceiverUsername': instance.receiverUsername,
      'Message': instance.message,
    };
