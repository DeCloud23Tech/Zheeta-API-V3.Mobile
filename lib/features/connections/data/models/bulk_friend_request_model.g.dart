// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bulk_friend_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BulkFriendRequestModel _$BulkFriendRequestModelFromJson(
        Map<String, dynamic> json) =>
    _BulkFriendRequestModel(
      recieverId: json['recieverId'] as String,
      typeOfRequest: (json['typeOfRequest'] as num).toInt(),
    );

Map<String, dynamic> _$BulkFriendRequestModelToJson(
        _BulkFriendRequestModel instance) =>
    <String, dynamic>{
      'recieverId': instance.recieverId,
      'typeOfRequest': instance.typeOfRequest,
    };
