// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_report_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BuddyEventReportRequest _$BuddyEventReportRequestFromJson(
        Map<String, dynamic> json) =>
    BuddyEventReportRequest(
      buddyEventId: json['buddyEventId'] as String,
      buddyEventCreatorId: json['buddyEventCreatorId'] as String,
      userId: json['userId'] as String,
      username: json['username'] as String,
      reviewType: (json['reviewType'] as num).toInt(),
      reason: json['reason'] as String,
    );

Map<String, dynamic> _$BuddyEventReportRequestToJson(
        BuddyEventReportRequest instance) =>
    <String, dynamic>{
      'buddyEventId': instance.buddyEventId,
      'buddyEventCreatorId': instance.buddyEventCreatorId,
      'userId': instance.userId,
      'username': instance.username,
      'reviewType': instance.reviewType,
      'reason': instance.reason,
    };
