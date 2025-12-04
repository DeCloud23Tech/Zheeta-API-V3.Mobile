// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_recipients_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChatRecipients _$ChatRecipientsFromJson(Map<String, dynamic> json) =>
    _ChatRecipients(
      data: (json['data'] as List<dynamic>)
          .map((e) => Recipient.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChatRecipientsToJson(_ChatRecipients instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_Recipient _$RecipientFromJson(Map<String, dynamic> json) => _Recipient(
      userProfile:
          UserProfile.fromJson(json['userProfile'] as Map<String, dynamic>),
      lastUnreadMessage: json['lastUnreadMessage'] as String,
      lastUnreadMessageTime:
          DateTime.parse(json['lastUnreadMessageTime'] as String),
      unreadMessageCount: (json['unreadMessageCount'] as num).toInt(),
    );

Map<String, dynamic> _$RecipientToJson(_Recipient instance) =>
    <String, dynamic>{
      'userProfile': instance.userProfile,
      'lastUnreadMessage': instance.lastUnreadMessage,
      'lastUnreadMessageTime': instance.lastUnreadMessageTime.toIso8601String(),
      'unreadMessageCount': instance.unreadMessageCount,
    };

_UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => _UserProfile(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String,
      profileStatus: (json['profileStatus'] as num).toInt(),
      lastSeenTime: json['lastSeenTime'] as String,
      isOnline: json['isOnline'] as bool,
    );

Map<String, dynamic> _$UserProfileToJson(_UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'profilePhotoURL': instance.profilePhotoURL,
      'profileStatus': instance.profileStatus,
      'lastSeenTime': instance.lastSeenTime,
      'isOnline': instance.isOnline,
    };
