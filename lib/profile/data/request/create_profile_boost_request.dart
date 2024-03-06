import 'package:json_annotation/json_annotation.dart';

part 'create_profile_boost_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateProfileBoostRequest {
  String userId;
  String targetCountry;
  String targetGender;
  String targetCity;
  int minAge;
  int maxAge;
  String maritalStatus;
  int targetNumber;
  int duration;
  double adsCost;
  List<String> profileUrlForAds;

  CreateProfileBoostRequest({
    required this.userId,
    required this.targetCountry,
    required this.targetGender,
    required this.targetCity,
    required this.minAge,
    required this.maxAge,
    required this.maritalStatus,
    required this.targetNumber,
    required this.duration,
    required this.adsCost,
    required this.profileUrlForAds,
  });

  factory CreateProfileBoostRequest.fromJson(Map<String, dynamic> json) => _$CreateProfileBoostRequestFromJson(json);
  Map<String, dynamic> toJson() => _$CreateProfileBoostRequestToJson(this);
}
