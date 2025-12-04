// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_buddy_event_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateBuddyEventRequest _$UpdateBuddyEventRequestFromJson(
        Map<String, dynamic> json) =>
    UpdateBuddyEventRequest(
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      noOfBuddiesWanted: (json['noOfBuddiesWanted'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      durationOrLengthInHrs: (json['durationOrLengthInHrs'] as num).toInt(),
      eventLocationAddress: json['eventLocationAddress'] as String,
      eventCity: json['eventCity'] as String,
      eventState: json['eventState'] as String,
      eventCountry: json['eventCountry'] as String,
      buddyEventType: (json['buddyEventType'] as num).toInt(),
      tagList:
          (json['tagList'] as List<dynamic>?)?.map((e) => e as String).toList(),
      eventFee: (json['eventFee'] as num).toDouble(),
      isPromoted: json['isPromoted'] as bool,
      eventItems: (json['eventItems'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      eventGuidelines: (json['eventGuidelines'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      targetCountry: json['targetCountry'] as String,
    );

Map<String, dynamic> _$UpdateBuddyEventRequestToJson(
        UpdateBuddyEventRequest instance) =>
    <String, dynamic>{
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'noOfBuddiesWanted': instance.noOfBuddiesWanted,
      'startDate': instance.startDate.toIso8601String(),
      'durationOrLengthInHrs': instance.durationOrLengthInHrs,
      'eventLocationAddress': instance.eventLocationAddress,
      'eventCity': instance.eventCity,
      'eventState': instance.eventState,
      'eventCountry': instance.eventCountry,
      'buddyEventType': instance.buddyEventType,
      'tagList': instance.tagList,
      'eventFee': instance.eventFee,
      'isPromoted': instance.isPromoted,
      'eventItems': instance.eventItems,
      'eventGuidelines': instance.eventGuidelines,
      'targetCountry': instance.targetCountry,
    };
