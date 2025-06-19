// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'process_join_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProcessJoinRequest _$ProcessJoinRequestFromJson(Map<String, dynamic> json) =>
    ProcessJoinRequest(
      eventId: json['eventId'] as String,
      requestId: json['requestId'] as String,
      requesterId: json['requesterId'] as String,
      isAccepted: json['isAccepted'] as bool,
    );

Map<String, dynamic> _$ProcessJoinRequestToJson(ProcessJoinRequest instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'requestId': instance.requestId,
      'requesterId': instance.requesterId,
      'isAccepted': instance.isAccepted,
    };
