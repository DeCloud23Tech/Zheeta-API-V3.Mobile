// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'send_gift_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SendGiftRequestModelImpl _$$SendGiftRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SendGiftRequestModelImpl(
      giftId: json['giftId'] as String,
      totalQuantity: (json['totalQuantity'] as num).toInt(),
      receiverId: json['receiverId'] as String,
      receiverUsername: json['receiverUsername'] as String,
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$SendGiftRequestModelImplToJson(
        _$SendGiftRequestModelImpl instance) =>
    <String, dynamic>{
      'giftId': instance.giftId,
      'totalQuantity': instance.totalQuantity,
      'receiverId': instance.receiverId,
      'receiverUsername': instance.receiverUsername,
      'message': instance.message,
    };
