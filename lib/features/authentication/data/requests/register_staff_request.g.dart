// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_staff_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterStaffRequest _$RegisterStaffRequestFromJson(
        Map<String, dynamic> json) =>
    RegisterStaffRequest(
      userName: json['userName'] as String,
      password: json['password'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      phoneCountryCode: json['phoneCountryCode'] as String,
    );

Map<String, dynamic> _$RegisterStaffRequestToJson(
        RegisterStaffRequest instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'password': instance.password,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'phoneCountryCode': instance.phoneCountryCode,
    };
