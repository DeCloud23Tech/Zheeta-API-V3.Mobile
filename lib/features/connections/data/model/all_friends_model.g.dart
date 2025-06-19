// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$FriendModelImpl _$$FriendModelImplFromJson(Map<String, dynamic> json) =>
    _$FriendModelImpl(
      userAId: json['userAId'] as String,
      friendId: json['friendId'] as String,
      friendUsername: json['friendUsername'] as String,
      friendProfilePicture: json['friendProfilePicture'] as String,
      friendBlockStatus: json['friendBlockStatus'] as bool,
    );

Map<String, dynamic> _$$FriendModelImplToJson(_$FriendModelImpl instance) =>
    <String, dynamic>{
      'userAId': instance.userAId,
      'friendId': instance.friendId,
      'friendUsername': instance.friendUsername,
      'friendProfilePicture': instance.friendProfilePicture,
      'friendBlockStatus': instance.friendBlockStatus,
    };

_$FriendsListModelImpl _$$FriendsListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$FriendsListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => FriendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$FriendsListModelImplToJson(
        _$FriendsListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
