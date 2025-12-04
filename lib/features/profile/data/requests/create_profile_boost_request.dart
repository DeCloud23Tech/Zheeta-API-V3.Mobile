import 'package:json_annotation/json_annotation.dart';

part 'create_profile_boost_request.g.dart';

@JsonSerializable(explicitToJson: true, fieldRename: FieldRename.pascal)
class CreateProfileBoostRequest {
  String userId;
  String? caption;
  String? targetCountry;
  String? targetGender;
  String? targetCity;
  int? minAge;
  int? maxAge;
  int? maritalStatus;
  int targetUsersNumber;
  int duration;
  double adsCost;
  String photoUrlForAds;

  CreateProfileBoostRequest({
    required this.userId,
    this.caption,
    this.targetCountry,
    this.targetGender,
    this.targetCity,
    this.minAge,
    this.maxAge,
    this.maritalStatus,
    required this.targetUsersNumber,
    required this.duration,
    required this.adsCost,
    required this.photoUrlForAds,
  });

  factory CreateProfileBoostRequest.fromJson(Map<String, dynamic> json) =>
      _$CreateProfileBoostRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateProfileBoostRequestToJson(this);
}
