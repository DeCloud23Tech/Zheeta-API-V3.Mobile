// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_downline_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserDownlineModel _$UserDownlineModelFromJson(Map<String, dynamic> json) =>
    _UserDownlineModel(
      id: json['id'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      userName: json['userName'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String,
    );

Map<String, dynamic> _$UserDownlineModelToJson(_UserDownlineModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'profilePhotoURL': instance.profilePhotoURL,
    };

_UserDownlineListModel _$UserDownlineListModelFromJson(
        Map<String, dynamic> json) =>
    _UserDownlineListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserDownlineModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserDownlineListModelToJson(
        _UserDownlineListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
