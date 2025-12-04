import 'package:json_annotation/json_annotation.dart';

part 'login_oauth_request.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class LoginOAuthRequest {
  String googleAccessToken;
  String googleUseridToken;
  String userDeviceToken;
  String facebookUserAccessToken;
  String phoneNumber;
  String authType;

  LoginOAuthRequest({
    required this.googleAccessToken,
    required this.googleUseridToken,
    required this.userDeviceToken,
    required this.facebookUserAccessToken,
    required this.phoneNumber,
    required this.authType,
  });

  factory LoginOAuthRequest.fromJson(Map<String, dynamic> json) => _$LoginOAuthRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginOAuthRequestToJson(this);
}
