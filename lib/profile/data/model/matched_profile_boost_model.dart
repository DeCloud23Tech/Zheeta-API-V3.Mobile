import 'package:freezed_annotation/freezed_annotation.dart';

part 'matched_profile_boost_model.freezed.dart';

part 'matched_profile_boost_model.g.dart';

@freezed
class MatchedProfileBoostModel with _$MatchedProfileBoostModel {
  @JsonSerializable()
  factory MatchedProfileBoostModel({
    required String id,
    required String userId,
    required String userName,
    required String fullName,
    required String profileUrlForAds,
    required String userProfileUrl,
  }) = _MatchedProfileBoostModel;

  factory MatchedProfileBoostModel.fromJson(Map<String, dynamic> json) =>
      _$MatchedProfileBoostModelFromJson(json);
}


@freezed
class MatchedProfileBoostListModel with _$MatchedProfileBoostListModel {
  factory MatchedProfileBoostListModel({
    required List<MatchedProfileBoostModel> data,
  }) = _MatchedProfileBoostListModel;

  factory MatchedProfileBoostListModel.fromJson(Map<String, dynamic> json) => _$MatchedProfileBoostListModelFromJson(json);
}

