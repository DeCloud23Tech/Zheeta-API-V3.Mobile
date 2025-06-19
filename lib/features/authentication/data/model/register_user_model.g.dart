// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RegisterUserModelImpl _$$RegisterUserModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RegisterUserModelImpl(
      phoneCountryCode: json['phoneCountryCode'],
      rolesCSV: json['rolesCSV'],
      createdDate: json['createdDate'],
      lastSeenDate: json['lastSeenDate'],
      isFullyVerified: json['isFullyVerified'],
      isBlocked: json['isBlocked'],
      authType: json['authType'],
      id: json['id'],
      userName: json['userName'],
      normalizedUserName: json['normalizedUserName'],
      email: json['email'],
      normalizedEmail: json['normalizedEmail'],
      emailConfirmed: json['emailConfirmed'],
      passwordHash: json['passwordHash'],
      securityStamp: json['securityStamp'],
      concurrencyStamp: json['concurrencyStamp'],
      phoneNumber: json['phoneNumber'],
      phoneNumberConfirmed: json['phoneNumberConfirmed'],
      twoFactorEnabled: json['twoFactorEnabled'],
      lockoutEnd: json['lockoutEnd'],
      lockoutEnabled: json['lockoutEnabled'],
      accessFailedCount: json['accessFailedCount'],
    );

Map<String, dynamic> _$$RegisterUserModelImplToJson(
        _$RegisterUserModelImpl instance) =>
    <String, dynamic>{
      'phoneCountryCode': instance.phoneCountryCode,
      'rolesCSV': instance.rolesCSV,
      'createdDate': instance.createdDate,
      'lastSeenDate': instance.lastSeenDate,
      'isFullyVerified': instance.isFullyVerified,
      'isBlocked': instance.isBlocked,
      'authType': instance.authType,
      'id': instance.id,
      'userName': instance.userName,
      'normalizedUserName': instance.normalizedUserName,
      'email': instance.email,
      'normalizedEmail': instance.normalizedEmail,
      'emailConfirmed': instance.emailConfirmed,
      'passwordHash': instance.passwordHash,
      'securityStamp': instance.securityStamp,
      'concurrencyStamp': instance.concurrencyStamp,
      'phoneNumber': instance.phoneNumber,
      'phoneNumberConfirmed': instance.phoneNumberConfirmed,
      'twoFactorEnabled': instance.twoFactorEnabled,
      'lockoutEnd': instance.lockoutEnd,
      'lockoutEnabled': instance.lockoutEnabled,
      'accessFailedCount': instance.accessFailedCount,
    };
