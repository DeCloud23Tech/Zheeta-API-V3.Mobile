// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuddyEventMessage _$BuddyEventMessageFromJson(Map<String, dynamic> json) =>
    _BuddyEventMessage(
      buddyEventId: json['buddyEventId'] as String,
      buddyEventCreatorId: json['buddyEventCreatorId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      message: json['message'] as String,
      messageParentId: json['messageParentId'] as String?,
      id: json['id'] as String,
      partitionKey: json['partitionKey'] as String,
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$BuddyEventMessageToJson(_BuddyEventMessage instance) =>
    <String, dynamic>{
      'buddyEventId': instance.buddyEventId,
      'buddyEventCreatorId': instance.buddyEventCreatorId,
      'userId': instance.userId,
      'username': instance.username,
      'message': instance.message,
      'messageParentId': instance.messageParentId,
      'id': instance.id,
      'partitionKey': instance.partitionKey,
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
