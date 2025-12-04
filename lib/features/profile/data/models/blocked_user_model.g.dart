// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'blocked_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BlockedUser _$BlockedUserFromJson(Map<String, dynamic> json) => _BlockedUser(
      userName: json['userName'] as String,
      fullName: json['fullName'] as String,
      age: (json['age'] as num).toInt(),
      city: json['city'] as String,
      country: json['country'] as String,
      gender: json['gender'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String,
      blockedUserId: json['blockedUserId'] as String,
    );

Map<String, dynamic> _$BlockedUserToJson(_BlockedUser instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'fullName': instance.fullName,
      'age': instance.age,
      'city': instance.city,
      'country': instance.country,
      'gender': instance.gender,
      'profilePhotoURL': instance.profilePhotoURL,
      'blockedUserId': instance.blockedUserId,
    };

_BlockedUsersResponse _$BlockedUsersResponseFromJson(
        Map<String, dynamic> json) =>
    _BlockedUsersResponse(
      data: (json['data'] as List<dynamic>)
          .map((e) => BlockedUser.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$BlockedUsersResponseToJson(
        _BlockedUsersResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
