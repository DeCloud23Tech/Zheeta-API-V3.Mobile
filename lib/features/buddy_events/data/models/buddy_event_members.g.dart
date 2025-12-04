// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_members.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuddyEventMember _$BuddyEventMemberFromJson(Map<String, dynamic> json) =>
    _BuddyEventMember(
      userId: json['userId'] as String,
      username: json['username'] as String,
      profilePicture: json['profilePicture'] as String,
    );

Map<String, dynamic> _$BuddyEventMemberToJson(_BuddyEventMember instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'username': instance.username,
      'profilePicture': instance.profilePicture,
    };
