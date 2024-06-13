// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewProfileModelImpl _$$ViewProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewProfileModelImpl(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      totalCount: json['totalCount'] as int,
      data: ViewProfileModelData.fromJson(json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewProfileModelImplToJson(
        _$ViewProfileModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data.toJson(),
    };

_$ViewProfileModelDataImpl _$$ViewProfileModelDataImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewProfileModelDataImpl(
      canViewProfile: json['canViewProfile'] as bool,
      isFriend: json['isFriend'] as bool,
      canMessage: json['canMessage'] as bool,
      canAddFriend: json['canAddFriend'] as bool,
      profile: UserProfileDataModel.fromJson(
          json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewProfileModelDataImplToJson(
        _$ViewProfileModelDataImpl instance) =>
    <String, dynamic>{
      'canViewProfile': instance.canViewProfile,
      'isFriend': instance.isFriend,
      'canMessage': instance.canMessage,
      'canAddFriend': instance.canAddFriend,
      'profile': instance.profile.toJson(),
    };
