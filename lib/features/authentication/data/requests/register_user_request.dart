import 'package:json_annotation/json_annotation.dart';

part 'register_user_request.g.dart';

@JsonSerializable()
class RegisterUserRequest {
  String userName;
  String password;
  String email;
  String phoneNumber;
  String phoneCountryCode;
  String? referralCode;

  RegisterUserRequest({
    required this.userName,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.phoneCountryCode,
    this.referralCode,
  });

  factory RegisterUserRequest.fromJson(Map<String, dynamic> json) => _$RegisterUserRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterUserRequestToJson(this);
}
