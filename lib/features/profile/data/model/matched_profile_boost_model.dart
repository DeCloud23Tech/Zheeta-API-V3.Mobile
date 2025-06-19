import 'package:freezed_annotation/freezed_annotation.dart';

part 'matched_profile_boost_model.freezed.dart';
part 'matched_profile_boost_model.g.dart';

@freezed
class ProfileBoostModel with _$ProfileBoostModel {
  factory ProfileBoostModel({
    required String id,
    required String userId,
    required String userName,
    required String fullName,
    required String profileUrlForAds,
    String? userProfileUrl,
    String? caption,
  }) = _ProfileBoostModel;

  factory ProfileBoostModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBoostModelFromJson(json);
}

@freezed
class ProfileBoostListModel with _$ProfileBoostListModel {
  factory ProfileBoostListModel({
    required List<ProfileBoostModel> data,
  }) = _ProfileBoostListModel;

  factory ProfileBoostListModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBoostListModelFromJson(json);
}
