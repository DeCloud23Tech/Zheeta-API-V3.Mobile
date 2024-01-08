import 'package:json_annotation/json_annotation.dart';

part 'update_user_profile_request.g.dart';

@JsonSerializable()
class UpdateUserProfileRequest {
  String? userId;
  String? firstName;
  String? lastName;
  String? dateOfBirth;
  int? gender;
  String? languageCSV;
  String? aboutMe;
  String? bodyType;
  String? complexion;
  double? height;
  String? occupation;
  String? religion;
  double? weight;
  String? tagline;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  double? latitude;
  double? longitude;

  UpdateUserProfileRequest({
    this.userId,
    this.firstName,
    this.lastName,
    this.dateOfBirth,
    this.gender,
    this.languageCSV,
    this.aboutMe,
    this.bodyType,
    this.complexion,
    this.height,
    this.occupation,
    this.religion,
    this.weight,
    this.tagline,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.latitude,
    this.longitude,
  });

  factory UpdateUserProfileRequest.fromJson(Map<String, dynamic> json) => _$UpdateUserProfileRequestFromJson(json);
  Map<String, dynamic> toJson() => _$UpdateUserProfileRequestToJson(this);
}
