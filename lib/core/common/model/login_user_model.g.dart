// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginUserModel _$LoginUserModelFromJson(Map<String, dynamic> json) =>
    _LoginUserModel(
      token: json['token'],
      refreshToken: json['refreshToken'],
      username: json['username'],
    );

Map<String, dynamic> _$LoginUserModelToJson(_LoginUserModel instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'username': instance.username,
    };
