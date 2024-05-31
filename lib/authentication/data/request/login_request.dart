import 'package:json_annotation/json_annotation.dart';

part 'login_request.g.dart';

@JsonSerializable()
class LoginRequest {
  String email;
  String password;
  String userDeviceToken;
  String platform;

  LoginRequest({required this.email, required this.password, required this.userDeviceToken, required this.platform});

  factory LoginRequest.fromJson(Map<String, dynamic> json) => _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}
