// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_user_profile_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUserProfileRequest _$CreateUserProfileRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUserProfileRequest(
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      dateOfBirth: json['dateOfBirth'] as String,
      gender: json['gender'] as int,
      languageCSV: json['languageCSV'] as String,
      aboutMe: json['aboutMe'] as String,
      bodyType: json['bodyType'] as String,
      complexion: json['complexion'] as String,
      height: (json['height'] as num).toDouble(),
      occupation: json['occupation'] as String,
      religion: json['religion'] as String,
      weight: (json['weight'] as num).toDouble(),
      tagline: json['tagline'] as String,
      city: json['city'] as String,
      state: json['state'] as String,
      country: json['country'] as String,
      zipCode: json['zipCode'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CreateUserProfileRequestToJson(
        CreateUserProfileRequest instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'dateOfBirth': instance.dateOfBirth,
      'gender': instance.gender,
      'languageCSV': instance.languageCSV,
      'aboutMe': instance.aboutMe,
      'bodyType': instance.bodyType,
      'complexion': instance.complexion,
      'height': instance.height,
      'occupation': instance.occupation,
      'religion': instance.religion,
      'weight': instance.weight,
      'tagline': instance.tagline,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'zipCode': instance.zipCode,
      'latitude': instance.latitude,
      'longitude': instance.longitude,
    };
