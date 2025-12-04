// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_buddy_event_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateBuddyEventRequest _$CreateBuddyEventRequestFromJson(
        Map<String, dynamic> json) =>
    CreateBuddyEventRequest(
      creatorId: json['creatorId'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      noOfBuddiesWanted: (json['noOfBuddiesWanted'] as num).toInt(),
      startDate: DateTime.parse(json['startDate'] as String),
      durationOrLengthInHrs: (json['durationOrLengthInHrs'] as num).toInt(),
      eventMainPhoto: json['eventMainPhoto'] as String,
      eventOtherPhotos: (json['eventOtherPhotos'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
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
      gender: json['gender'] as String,
      targetCountry: json['targetCountry'] as String,
      maritalStatus: json['maritalStatus'] as String,
      occupation: json['occupation'] as String,
    );

Map<String, dynamic> _$CreateBuddyEventRequestToJson(
        CreateBuddyEventRequest instance) =>
    <String, dynamic>{
      'creatorId': instance.creatorId,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'noOfBuddiesWanted': instance.noOfBuddiesWanted,
      'startDate': instance.startDate.toIso8601String(),
      'durationOrLengthInHrs': instance.durationOrLengthInHrs,
      'eventMainPhoto': instance.eventMainPhoto,
      'eventOtherPhotos': instance.eventOtherPhotos,
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
      'gender': instance.gender,
      'targetCountry': instance.targetCountry,
      'maritalStatus': instance.maritalStatus,
      'occupation': instance.occupation,
    };
