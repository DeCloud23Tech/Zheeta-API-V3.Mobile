// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'matched_profile_boost_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProfileBoostModelImpl _$$ProfileBoostModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileBoostModelImpl(
      id: json['id'] as String,
      userId: json['userId'] as String,
      userName: json['userName'] as String,
      fullName: json['fullName'] as String,
      profileUrlForAds: json['profileUrlForAds'] as String,
      userProfileUrl: json['userProfileUrl'] as String?,
      caption: json['caption'] as String?,
    );

Map<String, dynamic> _$$ProfileBoostModelImplToJson(
        _$ProfileBoostModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'userName': instance.userName,
      'fullName': instance.fullName,
      'profileUrlForAds': instance.profileUrlForAds,
      'userProfileUrl': instance.userProfileUrl,
      'caption': instance.caption,
    };

_$ProfileBoostListModelImpl _$$ProfileBoostListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ProfileBoostListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => ProfileBoostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ProfileBoostListModelImplToJson(
        _$ProfileBoostListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
