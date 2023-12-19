// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'verify_phone_otp_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VerifyPhoneOtpRequest _$VerifyPhoneOtpRequestFromJson(
        Map<String, dynamic> json) =>
    VerifyPhoneOtpRequest(
      json['phoneNumber'] as String,
      json['otp'] as String,
    );

Map<String, dynamic> _$VerifyPhoneOtpRequestToJson(
        VerifyPhoneOtpRequest instance) =>
    <String, dynamic>{
      'phoneNumber': instance.phoneNumber,
      'otp': instance.otp,
    };
