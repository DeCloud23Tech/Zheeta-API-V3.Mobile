// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailOtpRequest _$VerifyEmailOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyEmailOtpRequest(
      json['phoneNumber'] as String,
      json['otp'] as String,
    );

Map<String, dynamic> _$VerifyEmailOtpRequestToJson(
        VerifyEmailOtpRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };
