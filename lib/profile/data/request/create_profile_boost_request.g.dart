// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_profile_boost_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateProfileBoostRequest _$CreateProfileBoostRequestFromJson(
        Map<String, dynamic> json) =>
    CreateProfileBoostRequest(
      userId: json['UserId'] as String,
      caption: json['Caption'] as String?,
      targetCountry: json['TargetCountry'] as String,
      targetGender: json['TargetGender'] as String,
      targetCity: json['TargetCity'] as String,
      minAge: (json['MinAge'] as num).toInt(),
      maxAge: (json['MaxAge'] as num).toInt(),
      maritalStatus: json['MaritalStatus'] as String,
      targetUsersNumber: (json['TargetUsersNumber'] as num).toInt(),
      duration: (json['Duration'] as num).toInt(),
      adsCost: (json['AdsCost'] as num).toDouble(),
      photoUrlForAds: (json['PhotoUrlForAds'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$CreateProfileBoostRequestToJson(
        CreateProfileBoostRequest instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'Caption': instance.caption,
      'TargetCountry': instance.targetCountry,
      'TargetGender': instance.targetGender,
      'TargetCity': instance.targetCity,
      'MinAge': instance.minAge,
      'MaxAge': instance.maxAge,
      'MaritalStatus': instance.maritalStatus,
      'TargetUsersNumber': instance.targetUsersNumber,
      'Duration': instance.duration,
      'AdsCost': instance.adsCost,
      'PhotoUrlForAds': instance.photoUrlForAds,
    };
