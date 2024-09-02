// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_pending_friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendRequestModelImpl _$$FriendRequestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendRequestModelImpl(
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

Map<String, dynamic> _$$FriendRequestModelImplToJson(
        _$FriendRequestModelImpl instance) =>
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

_$GetPendingFriendsModelImpl _$$GetPendingFriendsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$GetPendingFriendsModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => FriendRequestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GetPendingFriendsModelImplToJson(
        _$GetPendingFriendsModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
