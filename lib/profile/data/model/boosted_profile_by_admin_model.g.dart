// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'boosted_profile_by_admin_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BoostedProfileByAdminModelImpl _$$BoostedProfileByAdminModelImplFromJson(
        Map<String, dynamic> json) =>
    _$BoostedProfileByAdminModelImpl(
      userId: json['userId'],
      targetCountry: json['targetCountry'],
      targetGender: json['targetGender'],
      targetCity: json['targetCity'],
      minAge: json['minAge'],
      maxAge: json['maxAge'],
      targetNumber: json['targetNumber'],
      duration: json['duration'],
      adsCost: json['adsCost'],
      profileUrlForAds: json['profileUrlForAds'],
      startDate: json['startDate'],
      endDate: json['endDate'],
      userProfileUrl: json['userProfileUrl'],
    );

Map<String, dynamic> _$$BoostedProfileByAdminModelImplToJson(
        _$BoostedProfileByAdminModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'targetCountry': instance.targetCountry,
      'targetGender': instance.targetGender,
      'targetCity': instance.targetCity,
      'minAge': instance.minAge,
      'maxAge': instance.maxAge,
      'targetNumber': instance.targetNumber,
      'duration': instance.duration,
      'adsCost': instance.adsCost,
      'profileUrlForAds': instance.profileUrlForAds,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'userProfileUrl': instance.userProfileUrl,
    };

_$BoostedProfileByAdminListModelImpl
    _$$BoostedProfileByAdminListModelImplFromJson(Map<String, dynamic> json) =>
        _$BoostedProfileByAdminListModelImpl(
          data: (json['data'] as List<dynamic>?)
              ?.map((e) => BoostedProfileByAdminListModel.fromJson(
                  e as Map<String, dynamic>))
              .toList(),
        );

Map<String, dynamic> _$$BoostedProfileByAdminListModelImplToJson(
        _$BoostedProfileByAdminListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
