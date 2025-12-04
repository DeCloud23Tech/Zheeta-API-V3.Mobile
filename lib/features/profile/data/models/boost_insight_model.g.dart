// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boost_insight_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BoostInsightModel _$BoostInsightModelFromJson(Map<String, dynamic> json) =>
    _BoostInsightModel(
      userId: json['userId'] as String,
      photoUrlForAds: json['photoUrlForAds'] as String,
      caption: json['caption'] as String,
      targetCountry: json['targetCountry'] as String,
      targetGender: json['targetGender'] as String,
      targetCity: json['targetCity'] as String,
      minAge: (json['minAge'] as num).toInt(),
      maxAge: (json['maxAge'] as num).toInt(),
      maritalStatus: (json['maritalStatus'] as num).toInt(),
      targetUsersNumber: (json['targetUsersNumber'] as num).toInt(),
      targetUsersReached: (json['targetUsersReached'] as num).toInt(),
      duration: (json['duration'] as num).toInt(),
      adsCost: (json['adsCost'] as num).toDouble(),
    );

Map<String, dynamic> _$BoostInsightModelToJson(_BoostInsightModel instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'photoUrlForAds': instance.photoUrlForAds,
      'caption': instance.caption,
      'targetCountry': instance.targetCountry,
      'targetGender': instance.targetGender,
      'targetCity': instance.targetCity,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'maritalStatus': instance.maritalStatus,
      'targetUsersNumber': instance.targetUsersNumber,
      'targetUsersReached': instance.targetUsersReached,
      'duration': instance.duration,
      'adsCost': instance.adsCost,
    };
