import 'package:freezed_annotation/freezed_annotation.dart';

part 'matched_profile_boost_model.freezed.dart';
part 'matched_profile_boost_model.g.dart';

@freezed
class MatchedProfileBoostModel with _$MatchedProfileBoostModel {
  @JsonSerializable()
  const factory MatchedProfileBoostModel({
    dynamic userId,
    dynamic userName,
    dynamic fullName,
    dynamic profileUrlForAds,
  }) = _MatchedProfileBoostModel;

  factory MatchedProfileBoostModel.fromJson(Map<String, dynamic> json) => _$MatchedProfileBoostModelFromJson(json);
}

@freezed
class MatchedProfileBoostListModel with _$MatchedProfileBoostListModel {
  @JsonSerializable(explicitToJson: true)
  const factory MatchedProfileBoostListModel({
    List<MatchedProfileBoostModel>? data,
  }) = _MatchedProfileBoostListModel;

  factory MatchedProfileBoostListModel.fromJson(Map<String, dynamic> json) => _$MatchedProfileBoostListModelFromJson(json);
}
