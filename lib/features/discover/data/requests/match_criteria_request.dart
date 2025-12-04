import 'package:json_annotation/json_annotation.dart';

part 'match_criteria_request.g.dart';

@JsonSerializable()
class MatchCriteriaRequest {
  String? id;
  String? userId;
  String? gender;
  int? minAge;
  int? maxAge;
  int? distance;
  String? country;
  String? city;
  MatchCriteriaRequest({
    required this.id,
    required this.userId,
    required this.gender,
    required this.minAge,
    required this.maxAge,
    required this.distance,
    required this.country,
    required this.city,
  });

  factory MatchCriteriaRequest.fromJson(Map<String, dynamic> json) => _$MatchCriteriaRequestFromJson(json);

  Map<String, dynamic> toJson() => _$MatchCriteriaRequestToJson(this);
}
