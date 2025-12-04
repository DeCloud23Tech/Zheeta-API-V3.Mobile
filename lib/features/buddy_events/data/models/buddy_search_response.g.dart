// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'buddy_search_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BuddySearchResponse _$BuddySearchResponseFromJson(Map<String, dynamic> json) =>
    _BuddySearchResponse(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      success: json['success'] as bool,
      totalCount: (json['totalCount'] as num).toInt(),
      data: (json['data'] as List<dynamic>)
          .map((e) => BuddyEventSearch.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BuddySearchResponseToJson(
        _BuddySearchResponse instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

_BuddyEventSearch _$BuddyEventSearchFromJson(Map<String, dynamic> json) =>
    _BuddyEventSearch(
      id: json['id'] as String,
      creatorId: json['creatorId'] as String,
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

Map<String, dynamic> _$BuddyEventSearchToJson(_BuddyEventSearch instance) =>
    <String, dynamic>{
      'id': instance.id,
      'creatorId': instance.creatorId,
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
