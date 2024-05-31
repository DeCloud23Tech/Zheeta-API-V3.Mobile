// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_profile_boost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchedProfileBoostModelImpl _$$MatchedProfileBoostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchedProfileBoostModelImpl(
      userId: json['userId'],
      userName: json['userName'],
      fullName: json['fullName'],
      profileUrlForAds: json['profileUrlForAds'],
    );

Map<String, dynamic> _$$MatchedProfileBoostModelImplToJson(
        _$MatchedProfileBoostModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'profileUrlForAds': instance.profileUrlForAds,
    };

_$MatchedProfileBoostListModelImpl _$$MatchedProfileBoostListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchedProfileBoostListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              MatchedProfileBoostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchedProfileBoostListModelImplToJson(
        _$MatchedProfileBoostListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
