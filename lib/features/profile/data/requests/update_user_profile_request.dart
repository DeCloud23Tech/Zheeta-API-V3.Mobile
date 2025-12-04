import 'package:json_annotation/json_annotation.dart';

part 'update_user_profile_request.g.dart';

@JsonSerializable()
class UpdateUserProfileRequest {
  String? userId;
  String? firstName;
  String? lastName;
  String? userName;
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
  String? originCity;
  String? originCountry;

  UpdateUserProfileRequest({
    this.userId,
    this.firstName,
    this.lastName,
    this.userName,
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
    this.originCity,
    this.originCountry,
  });

  factory UpdateUserProfileRequest.fromJson(Map<String, dynamic> json) =>
      _$UpdateUserProfileRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateUserProfileRequestToJson(this);

  // Add toString method to print all the values
  @override
  String toString() {
    return 'UpdateUserProfileRequest(userId: $userId, firstName: $firstName, lastName: $lastName, userName: $userName, dateOfBirth: $dateOfBirth, gender: $gender, languageCSV: $languageCSV, aboutMe: $aboutMe, bodyType: $bodyType, complexion: $complexion, height: $height, occupation: $occupation, religion: $religion, weight: $weight, tagline: $tagline, city: $city, state: $state, country: $country, originCity: $originCity, originCountry: $originCountry)';
  }
}
