import 'package:json_annotation/json_annotation.dart';

part 'verify_phone_otp_request.g.dart';

@JsonSerializable()
class VerifyPhoneOtpRequest {
  String phoneNumber;
  String otp;

  VerifyPhoneOtpRequest(
    this.phoneNumber,
    this.otp,
  );

  factory VerifyPhoneOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyPhoneOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyPhoneOtpRequestToJson(this);
}
