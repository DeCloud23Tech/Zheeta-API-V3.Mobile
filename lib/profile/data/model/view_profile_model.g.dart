// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewProfileModelImpl _$$ViewProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewProfileModelImpl(
      canViewProfile: json['canViewProfile'] as bool,
      isFriend: json['isFriend'] as bool,
      canMessage: json['canMessage'] as bool,
      canAddFriend: json['canAddFriend'] as bool,
      profile: UserProfileDataModel.fromJson(
          json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewProfileModelImplToJson(
        _$ViewProfileModelImpl instance) =>
    <String, dynamic>{
      'canViewProfile': instance.canViewProfile,
      'isFriend': instance.isFriend,
      'canMessage': instance.canMessage,
      'canAddFriend': instance.canAddFriend,
      'profile': instance.profile.toJson(),
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
