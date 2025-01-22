import 'package:json_annotation/json_annotation.dart';

part 'register_staff_request.g.dart';

@JsonSerializable()
class RegisterStaffRequest {
  String userName;
  String password;
  String email;
  String phoneNumber;
  String phoneCountryCode;

  RegisterStaffRequest({
    required this.userName,
    required this.password,
    required this.email,
    required this.phoneNumber,
    required this.phoneCountryCode,
  });

  factory RegisterStaffRequest.fromJson(Map<String, dynamic> json) => _$RegisterStaffRequestFromJson(json);
  Map<String, dynamic> toJson() => _$RegisterStaffRequestToJson(this);
}
