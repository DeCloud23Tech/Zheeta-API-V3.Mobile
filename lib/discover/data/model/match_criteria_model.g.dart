// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_criteria_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchCriteriaModelImpl _$$MatchCriteriaModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchCriteriaModelImpl(
      userId: json['userId'],
      gender: json['gender'],
      minAge: json['minAge'],
      maxAge: json['maxAge'],
      distance: json['distance'],
      country: json['country'],
      city: json['city'],
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
