// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_recipients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatRecipientsImpl _$$ChatRecipientsImplFromJson(Map<String, dynamic> json) =>
    _$ChatRecipientsImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatRecipientsImplToJson(
        _$ChatRecipientsImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$RecipientImpl _$$RecipientImplFromJson(Map<String, dynamic> json) =>
    _$RecipientImpl(
      userProfile:
          UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      lastUnreadMessage: json['lastUnreadMessage'] as String,
      lastUnreadMessageTime: json['lastUnreadMessageTime'] as String,
      unreadMessageCount: (json['unreadMessageCount'] as num).toInt(),
    );

Map<String, dynamic> _$$RecipientImplToJson(_$RecipientImpl instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'lastUnreadMessage': instance.lastUnreadMessage,
      'lastUnreadMessageTime': instance.lastUnreadMessageTime,
      'unreadMessageCount': instance.unreadMessageCount,
    };

_$UserProfileImpl _$$UserProfileImplFromJson(Map<String, dynamic> json) =>
    _$UserProfileImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String,
      profileStatus: (json['profileStatus'] as num).toInt(),
      lastSeenTime: json['lastSeenTime'] as String,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$$UserProfileImplToJson(_$UserProfileImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePhotoURL': instance.profilePhotoURL,
      'profileStatus': instance.profileStatus,
      'lastSeenTime': instance.lastSeenTime,
      'isOnline': instance.isOnline,
    };
