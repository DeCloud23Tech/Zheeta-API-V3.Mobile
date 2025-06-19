// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'view_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ViewProfileModelImpl _$$ViewProfileModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ViewProfileModelImpl(
      isFriend: json['isFriend'] as bool,
      isBlocked: json['isBlocked'] as bool,
      canMessage: json['canMessage'] as bool,
      canAddFriend: json['canAddFriend'] as bool,
      distance: (json['distance'] as num).toDouble(),
      profile: UserProfileDataModel.fromJson(
          json['profile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$ViewProfileModelImplToJson(
        _$ViewProfileModelImpl instance) =>
    <String, dynamic>{
      'isFriend': instance.isFriend,
      'isBlocked': instance.isBlocked,
      'canMessage': instance.canMessage,
      'canAddFriend': instance.canAddFriend,
      'distance': instance.distance,
      'profile': instance.profile,
    };
