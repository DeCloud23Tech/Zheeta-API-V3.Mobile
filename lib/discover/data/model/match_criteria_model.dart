import 'package:freezed_annotation/freezed_annotation.dart';

part 'match_criteria_model.freezed.dart';
part 'match_criteria_model.g.dart';

@freezed
class MatchCriteriaModel with _$MatchCriteriaModel {
  @JsonSerializable()
  const factory MatchCriteriaModel({
    dynamic userId,
    dynamic gender,
    dynamic minAge,
    dynamic maxAge,
    dynamic distance,
    dynamic country,
    dynamic city,
  }) = _MatchCriteriaModel;

  factory MatchCriteriaModel.fromJson(Map<String, dynamic> json) => _$MatchCriteriaModelFromJson(json);
}
