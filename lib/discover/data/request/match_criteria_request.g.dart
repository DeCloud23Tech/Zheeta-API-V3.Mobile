// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_criteria_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchCriteriaRequest _$MatchCriteriaRequestFromJson(
        Map<String, dynamic> json) =>
    MatchCriteriaRequest(
      id: json['id'] as String?,
      userId: json['userId'] as String?,
      gender: json['gender'] as String?,
      minAge: json['minAge'] as int?,
      maxAge: json['maxAge'] as int?,
      distance: json['distance'] as int?,
      country: json['country'] as String?,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$MatchCriteriaRequestToJson(
        MatchCriteriaRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'gender': instance.gender,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'distance': instance.distance,
      'country': instance.country,
      'city': instance.city,
    };
