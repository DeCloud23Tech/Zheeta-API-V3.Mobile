import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_criteria_model.freezed.dart';
part 'match_criteria_model.g.dart';

@freezed
class MatchCriteriaModel with _$MatchCriteriaModel {
  @JsonSerializable()
  factory MatchCriteriaModel({
    required String userId,
    required String gender,
    required int minAge,
    required int maxAge,
    required int distance,
    required String country,
    required String? city,
  }) = _MatchCriteriaModel;

  factory MatchCriteriaModel.fromJson(Map<String, dynamic> json) => _$MatchCriteriaModelFromJson(json);
}
