// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_event_id.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuddyEventId _$BuddyEventIdFromJson(Map<String, dynamic> json) =>
    _BuddyEventId(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
      creatorUsername: json['creatorUsername'] as String,
      creatorProfilePhotoUrl: json['creatorProfilePhotoUrl'] as String,
      category: json['category'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      noOfBuddiesWanted: (json['noOfBuddiesWanted'] as num).toInt(),
      noOfBuddiesJoined: (json['noOfBuddiesJoined'] as num).toInt(),
      shareLink: json['shareLink'] as String,
      startDate: json['startDate'] as String,
      durationOrLengthInHrs: (json['durationOrLengthInHrs'] as num).toInt(),
      endDate: json['endDate'] as String,
      eventLocationAddress: json['eventLocationAddress'] as String,
      eventCity: json['eventCity'] as String,
      eventState: json['eventState'] as String,
      eventCountry: json['eventCountry'] as String,
      eventMainPhotoUrl: json['eventMainPhotoUrl'] as String,
      eventOtherPhotosUrl: (json['eventOtherPhotosUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      buddyEventType: json['buddyEventType'] as String,
      tagList:
          (json['tagList'] as List<dynamic>).map((e) => e as String).toList(),
      isPromoted: json['isPromoted'] as bool,
      isOpen: json['isOpen'] as bool,
      isActive: json['isActive'] as bool,
      eventItems: (json['eventItems'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      eventGuidelines: (json['eventGuidelines'] as List<dynamic>?)
          ?.map((e) => e as String?)
          .toList(),
      gender: json['gender'] as String,
      targetCountry: json['targetCountry'] as String,
      maritalStatus: json['maritalStatus'] as String,
      occupation: json['occupation'] as String,
      eventFee: (json['eventFee'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$BuddyEventIdToJson(_BuddyEventId instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
      'creatorUsername': instance.creatorUsername,
      'creatorProfilePhotoUrl': instance.creatorProfilePhotoUrl,
      'category': instance.category,
      'title': instance.title,
      'description': instance.description,
      'noOfBuddiesWanted': instance.noOfBuddiesWanted,
      'noOfBuddiesJoined': instance.noOfBuddiesJoined,
      'shareLink': instance.shareLink,
      'startDate': instance.startDate,
      'durationOrLengthInHrs': instance.durationOrLengthInHrs,
      'endDate': instance.endDate,
      'eventLocationAddress': instance.eventLocationAddress,
      'eventCity': instance.eventCity,
      'eventState': instance.eventState,
      'eventCountry': instance.eventCountry,
      'eventMainPhotoUrl': instance.eventMainPhotoUrl,
      'eventOtherPhotosUrl': instance.eventOtherPhotosUrl,
      'buddyEventType': instance.buddyEventType,
      'tagList': instance.tagList,
      'isPromoted': instance.isPromoted,
      'isOpen': instance.isOpen,
      'isActive': instance.isActive,
      'eventItems': instance.eventItems,
      'eventGuidelines': instance.eventGuidelines,
      'gender': instance.gender,
      'targetCountry': instance.targetCountry,
      'maritalStatus': instance.maritalStatus,
      'occupation': instance.occupation,
      'eventFee': instance.eventFee,
    };
