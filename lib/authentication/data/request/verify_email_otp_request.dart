import 'package:json_annotation/json_annotation.dart';

part 'verify_email_otp_request.g.dart';

@JsonSerializable()
class VerifyEmailOtpRequest {
  String email;
  String otp;

  VerifyEmailOtpRequest({
    required this.email,
    required this.otp,
  });

  factory VerifyEmailOtpRequest.fromJson(Map<String, dynamic> json) => _$VerifyEmailOtpRequestFromJson(json);

  Map<String, dynamic> toJson() => _$VerifyEmailOtpRequestToJson(this);
}
