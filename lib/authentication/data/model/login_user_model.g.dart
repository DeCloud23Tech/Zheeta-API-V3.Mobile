// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LoginUserModelImpl _$$LoginUserModelImplFromJson(Map<String, dynamic> json) =>
    _$LoginUserModelImpl(
      token: json['token'],
      refreshToken: json['refreshToken'],
      username: json['username'],
    );

Map<String, dynamic> _$$LoginUserModelImplToJson(
        _$LoginUserModelImpl instance) =>
    <String, dynamic>{
      'token': instance.token,
      'refreshToken': instance.refreshToken,
      'username': instance.username,
    };
