// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_email_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyEmailOtpRequest _$VerifyEmailOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyEmailOtpRequest(
      email: json['email'] as String,
      otp: json['otp'] as String,
    );

Map<String, dynamic> _$VerifyEmailOtpRequestToJson(
        VerifyEmailOtpRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'otp': instance.otp,
    };
