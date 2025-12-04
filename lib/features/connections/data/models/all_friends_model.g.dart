// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'all_friends_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_FriendModel _$FriendModelFromJson(Map<String, dynamic> json) => _FriendModel(
      userId: json['userId'] as String,
      friendId: json['friendId'] as String,
      friendUsername: json['friendUsername'] as String,
      friendProfilePicture: json['friendProfilePicture'] as String,
      friendBlockStatus: json['friendBlockStatus'] as bool,
    );

Map<String, dynamic> _$FriendModelToJson(_FriendModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'friendId': instance.friendId,
      'friendUsername': instance.friendUsername,
      'friendProfilePicture': instance.friendProfilePicture,
      'friendBlockStatus': instance.friendBlockStatus,
    };

_FriendsListModel _$FriendsListModelFromJson(Map<String, dynamic> json) =>
    _FriendsListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => FriendModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$FriendsListModelToJson(_FriendsListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
