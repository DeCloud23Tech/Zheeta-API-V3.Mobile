// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_buddy_event.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CreateBuddyEventData _$CreateBuddyEventDataFromJson(
        Map<String, dynamic> json) =>
    _CreateBuddyEventData(
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
      startDate: DateTime.parse(json['startDate'] as String),
      durationOrLengthInHrs: (json['durationOrLengthInHrs'] as num).toInt(),
      endDate: DateTime.parse(json['endDate'] as String),
      eventLocationAddress: json['eventLocationAddress'] as String,
      eventCity: json['eventCity'] as String,
      eventState: json['eventState'] as String,
      eventCountry: json['eventCountry'] as String,
      eventMainPhotoUrl: json['eventMainPhotoUrl'] as String,
      eventOtherPhotosUrl: (json['eventOtherPhotosUrl'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateBuddyEventDataToJson(
        _CreateBuddyEventData instance) =>
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
      'startDate': instance.startDate.toIso8601String(),
      'durationOrLengthInHrs': instance.durationOrLengthInHrs,
      'endDate': instance.endDate.toIso8601String(),
      'eventLocationAddress': instance.eventLocationAddress,
      'eventCity': instance.eventCity,
      'eventState': instance.eventState,
      'eventCountry': instance.eventCountry,
      'eventMainPhotoUrl': instance.eventMainPhotoUrl,
      'eventOtherPhotosUrl': instance.eventOtherPhotosUrl,
    };
