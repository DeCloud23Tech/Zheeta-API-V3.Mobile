// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_criteria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchCriteriaModelImpl _$$MatchCriteriaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchCriteriaModelImpl(
      userId: json['userId'] as String,
      gender: json['gender'] as String,
      minAge: (json['minAge'] as num).toInt(),
      maxAge: (json['maxAge'] as num).toInt(),
      distance: (json['distance'] as num).toInt(),
      country: json['country'] as String,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$$MatchCriteriaModelImplToJson(
        _$MatchCriteriaModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'gender': instance.gender,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'distance': instance.distance,
      'country': instance.country,
      'city': instance.city,
    };
