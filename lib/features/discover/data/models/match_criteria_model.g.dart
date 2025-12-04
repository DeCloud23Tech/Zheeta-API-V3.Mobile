// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_criteria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchCriteriaModel _$MatchCriteriaModelFromJson(Map<String, dynamic> json) =>
    _MatchCriteriaModel(
      userId: json['userId'] as String,
      gender: json['gender'] as String,
      minAge: (json['minAge'] as num).toInt(),
      maxAge: (json['maxAge'] as num).toInt(),
      distance: (json['distance'] as num).toInt(),
      country: json['country'] as String,
      city: json['city'] as String?,
    );

Map<String, dynamic> _$MatchCriteriaModelToJson(_MatchCriteriaModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'gender': instance.gender,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'distance': instance.distance,
      'country': instance.country,
      'city': instance.city,
    };
