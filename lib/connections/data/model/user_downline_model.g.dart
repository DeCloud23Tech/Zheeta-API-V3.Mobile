// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_downline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserDownlineModelImpl _$$UserDownlineModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDownlineModelImpl(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userName: json['userName'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String,
    );

Map<String, dynamic> _$$UserDownlineModelImplToJson(
        _$UserDownlineModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'profilePhotoURL': instance.profilePhotoURL,
    };

_$UserDownlineListModelImpl _$$UserDownlineListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserDownlineListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserDownlineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserDownlineListModelImplToJson(
        _$UserDownlineListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
