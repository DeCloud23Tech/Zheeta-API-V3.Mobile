import 'package:json_annotation/json_annotation.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserRequest {
  final String userId;
  final String? firstName;
  final String? lastName;
  final String? dateOfBirth;
  final int? gender;
  final String? languageCSV;
  final String? aboutMe;
  final String? bodyType;
  final String? complexion;
  final double? height;
  final String? occupation;
  final String? religion;
  final double? weight;
  final String? tagline;
  final String? city;
  final String? state;
  final String? country;
  final String? zipCode;
  final double? latitude;
  final double? longitude;

  UserRequest(
      {required this.userId,
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
      this.longitude});

  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);

  Map<String, dynamic> toJson() => _$UserRequestToJson(this);
}
