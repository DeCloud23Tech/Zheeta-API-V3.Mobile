// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_friend_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BulkFriendRequestModelImpl _$$BulkFriendRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BulkFriendRequestModelImpl(
      receiverId: json['receiverId'] as String,
      typeOfRequest: (json['typeOfRequest'] as num).toInt(),
    );

Map<String, dynamic> _$$BulkFriendRequestModelImplToJson(
        _$BulkFriendRequestModelImpl instance) =>
    <String, dynamic>{
      'receiverId': instance.receiverId,
      'typeOfRequest': instance.typeOfRequest,
    };
