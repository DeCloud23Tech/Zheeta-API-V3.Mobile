import 'package:json_annotation/json_annotation.dart';

part 'register_model.g.dart';

@JsonSerializable()
class RegisterRequest {
  final String userName;
  final String email;
  final String password;
  final String phoneNumber;
  final String phoneCountryCode;
  final referralId;

  RegisterRequest(
      {required this.userName,
      required this.email,
      required this.password,
      required this.phoneNumber,
      required this.phoneCountryCode,
      this.referralId});

  factory RegisterRequest.fromJson(Map<String, dynamic> json) =>
      _$RegisterRequestFromJson(json);

  Map<String, dynamic> toJson() => _$RegisterRequestToJson(this);
}
