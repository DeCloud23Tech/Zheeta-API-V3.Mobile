import 'package:freezed_annotation/freezed_annotation.dart';

part 'boosted_profile_by_admin_model.freezed.dart';
part 'boosted_profile_by_admin_model.g.dart';

@freezed
class BoostedProfileByAdminModel with _$BoostedProfileByAdminModel {
  @JsonSerializable()
  factory BoostedProfileByAdminModel({
    dynamic userId,
    dynamic targetCountry,
    dynamic targetGender,
    dynamic targetCity,
    dynamic minAge,
    dynamic maxAge,
    dynamic targetUsersNumber,
    dynamic duration,
    dynamic adsCost,
    dynamic profileUrlForAds,
    dynamic startDate,
    dynamic endDate,
    dynamic userProfileUrl,
  }) = _BoostedProfileByAdminModel;

  factory BoostedProfileByAdminModel.fromJson(Map<String, dynamic> json) => _$BoostedProfileByAdminModelFromJson(json);
}

@freezed
class BoostedProfileByAdminListModel with _$BoostedProfileByAdminListModel {
  @JsonSerializable(explicitToJson: true)
  factory BoostedProfileByAdminListModel({
    List<BoostedProfileByAdminListModel>? data,
  }) = _BoostedProfileByAdminListModel;

  factory BoostedProfileByAdminListModel.fromJson(Map<String, dynamic> json) => _$BoostedProfileByAdminListModelFromJson(json);
}
