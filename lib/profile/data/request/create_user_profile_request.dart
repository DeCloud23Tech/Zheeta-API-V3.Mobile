import 'package:json_annotation/json_annotation.dart';

part 'create_user_profile_request.g.dart';

@JsonSerializable()
class CreateUserProfileRequest {
  String userId;
  String firstName;
  String lastName;
  String dateOfBirth;
  int gender;
  @JsonKey(toJson: languageCSVToJson)
  List<String> languageCSV;
  String aboutMe;
  String bodyType;
  String complexion;
  double height;
  String occupation;
  String religion;
  double weight;
  String tagline;
  String city;
  String state;
  String country;
  String zipCode;
  double latitude;
  double longitude;

  CreateUserProfileRequest({
    required this.userId,
    required this.firstName,
    required this.lastName,
    required this.dateOfBirth,
    required this.gender,
    required this.languageCSV,
    required this.aboutMe,
    required this.bodyType,
    required this.complexion,
    required this.height,
    required this.occupation,
    required this.religion,
    required this.weight,
    required this.tagline,
    required this.city,
    required this.state,
    required this.country,
    required this.zipCode,
    required this.latitude,
    required this.longitude,
  });

  factory CreateUserProfileRequest.fromJson(Map<String, dynamic> json) => _$CreateUserProfileRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateUserProfileRequestToJson(this);

  static String languageCSVToJson(List<String> languageCSV) => languageCSV.join(',');
}
