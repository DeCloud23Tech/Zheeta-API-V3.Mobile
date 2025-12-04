// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_oauth_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginOAuthRequest _$LoginOAuthRequestFromJson(Map<String, dynamic> json) =>
    LoginOAuthRequest(
      googleAccessToken: json['google_access_token'] as String,
      googleUseridToken: json['google_userid_token'] as String,
      userDeviceToken: json['user_device_token'] as String,
      facebookUserAccessToken: json['facebook_user_access_token'] as String,
      phoneNumber: json['phone_number'] as String,
      authType: json['auth_type'] as String,
    );

Map<String, dynamic> _$LoginOAuthRequestToJson(LoginOAuthRequest instance) =>
    <String, dynamic>{
      'google_access_token': instance.googleAccessToken,
      'google_userid_token': instance.googleUseridToken,
      'user_device_token': instance.userDeviceToken,
      'facebook_user_access_token': instance.facebookUserAccessToken,
      'phone_number': instance.phoneNumber,
      'auth_type': instance.authType,
    };
