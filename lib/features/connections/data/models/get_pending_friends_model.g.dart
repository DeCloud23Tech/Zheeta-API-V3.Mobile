// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pending_friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendRequestModel _$FriendRequestModelFromJson(Map<String, dynamic> json) =>
    _FriendRequestModel(
      id: json['id'] as String,
      requesterId: json['requesterId'] as String,
      recieverId: json['recieverId'] as String,
      createDate: DateTime.parse(json['createDate'] as String),
      requestType: (json['requestType'] as num).toInt(),
      requesterName: json['requesterName'] as String,
      requesterUserName: json['requesterUserName'] as String,
      requesterProfilePicture: json['requesterProfilePicture'] as String,
      requesterAge: (json['requesterAge'] as num).toInt(),
      requesterGender: json['requesterGender'] as String,
    );

Map<String, dynamic> _$FriendRequestModelToJson(_FriendRequestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'requesterId': instance.requesterId,
      'recieverId': instance.recieverId,
      'createDate': instance.createDate.toIso8601String(),
      'requestType': instance.requestType,
      'requesterName': instance.requesterName,
      'requesterUserName': instance.requesterUserName,
      'requesterProfilePicture': instance.requesterProfilePicture,
      'requesterAge': instance.requesterAge,
      'requesterGender': instance.requesterGender,
    };

_GetPendingFriendsModel _$GetPendingFriendsModelFromJson(
        Map<String, dynamic> json) =>
    _GetPendingFriendsModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => FriendRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetPendingFriendsModelToJson(
        _GetPendingFriendsModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
