// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_join_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuddyEventJoinRequestImpl _$$BuddyEventJoinRequestImplFromJson(
        Map<String, dynamic> json) =>
    _$BuddyEventJoinRequestImpl(
      buddyEventId: json['buddyEventId'] as String,
      buddyEventCreatorId: json['buddyEventCreatorId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      id: json['id'] as String,
      partitionKey: json['partitionKey'] as String,
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$BuddyEventJoinRequestImplToJson(
        _$BuddyEventJoinRequestImpl instance) =>
    <String, dynamic>{
      'buddyEventId': instance.buddyEventId,
      'buddyEventCreatorId': instance.buddyEventCreatorId,
      'userId': instance.userId,
      'username': instance.username,
      'id': instance.id,
      'partitionKey': instance.partitionKey,
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
