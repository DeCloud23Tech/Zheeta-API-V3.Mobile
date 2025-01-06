// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_events_feed.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BuddyEventImpl _$$BuddyEventImplFromJson(Map<String, dynamic> json) =>
    _$BuddyEventImpl(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      eventMainPhotoUrl: json['eventMainPhotoUrl'] as String,
      startDate: DateTime.parse(json['startDate'] as String),
      category: json['category'] as String,
      eventLocationAddress: json['eventLocationAddress'] as String,
      eventCity: json['eventCity'] as String,
      eventState: json['eventState'] as String,
      eventCountry: json['eventCountry'] as String,
      noOfBuddiesWanted: (json['noOfBuddiesWanted'] as num).toInt(),
      noOfBuddiesJoined: (json['noOfBuddiesJoined'] as num).toInt(),
      buddyEventType: (json['buddyEventType'] as num).toInt(),
      isPromoted: json['isPromoted'] as bool,
      eventParticipationCost:
          (json['eventParticipationCost'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$$BuddyEventImplToJson(_$BuddyEventImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'eventMainPhotoUrl': instance.eventMainPhotoUrl,
      'startDate': instance.startDate.toIso8601String(),
      'category': instance.category,
      'eventLocationAddress': instance.eventLocationAddress,
      'eventCity': instance.eventCity,
      'eventState': instance.eventState,
      'eventCountry': instance.eventCountry,
      'noOfBuddiesWanted': instance.noOfBuddiesWanted,
      'noOfBuddiesJoined': instance.noOfBuddiesJoined,
      'buddyEventType': instance.buddyEventType,
      'isPromoted': instance.isPromoted,
      'eventParticipationCost': instance.eventParticipationCost,
    };
