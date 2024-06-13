// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_profile_boost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchedProfileBoostModelImpl _$$MatchedProfileBoostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchedProfileBoostModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      fullName: json['fullName'] as String,
      profileUrlForAds: json['profileUrlForAds'] as String,
      userProfileUrl: json['userProfileUrl'] as String,
    );

Map<String, dynamic> _$$MatchedProfileBoostModelImplToJson(
        _$MatchedProfileBoostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'profileUrlForAds': instance.profileUrlForAds,
      'userProfileUrl': instance.userProfileUrl,
    };

_$MatchedProfileBoostListModelImpl _$$MatchedProfileBoostListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MatchedProfileBoostListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) =>
              MatchedProfileBoostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchedProfileBoostListModelImplToJson(
        _$MatchedProfileBoostListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
