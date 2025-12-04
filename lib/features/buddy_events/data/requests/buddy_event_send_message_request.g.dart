// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_send_message_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuddyEventSendMessageRequest _$BuddyEventSendMessageRequestFromJson(
        Map<String, dynamic> json) =>
    BuddyEventSendMessageRequest(
      buddyEventId: json['buddyEventId'] as String,
      buddyEventCreatorId: json['buddyEventCreatorId'] as String,
      message: json['message'] as String,
      messageParentId: json['messageParentId'] as String?,
    );

Map<String, dynamic> _$BuddyEventSendMessageRequestToJson(
        BuddyEventSendMessageRequest instance) =>
    <String, dynamic>{
      'buddyEventId': instance.buddyEventId,
      'buddyEventCreatorId': instance.buddyEventCreatorId,
      'message': instance.message,
      'messageParentId': instance.messageParentId,
    };
