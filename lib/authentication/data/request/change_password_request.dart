import 'package:json_annotation/json_annotation.dart';

part 'change_password_request.g.dart';

@JsonSerializable()
class ChangePasswordRequest {
  String newPassword;
  String oldPassword;

  ChangePasswordRequest({required this.newPassword, required this.oldPassword});

  factory ChangePasswordRequest.fromJson(Map<String, dynamic> json) => _$ChangePasswordRequestFromJson(json);
  Map<String, dynamic> toJson() => _$ChangePasswordRequestToJson(this);
}
