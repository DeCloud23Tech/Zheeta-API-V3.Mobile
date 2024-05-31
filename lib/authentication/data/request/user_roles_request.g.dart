// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_roles_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserRoleRequest _$UserRoleRequestFromJson(Map<String, dynamic> json) =>
    UserRoleRequest(
      userId: json['userId'] as String,
      roles: (json['roles'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$UserRoleRequestToJson(UserRoleRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'roles': instance.roles,
    };
