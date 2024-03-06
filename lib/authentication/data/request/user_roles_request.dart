import 'package:json_annotation/json_annotation.dart';

part 'user_roles_request.g.dart';

@JsonSerializable(explicitToJson: true)
class UserRoleRequest {
  String userId;
  List<String> roles;

  UserRoleRequest({required this.userId, required this.roles});

  factory UserRoleRequest.fromJson(Map<String, dynamic> json) => _$UserRoleRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UserRoleRequestToJson(this);
}
