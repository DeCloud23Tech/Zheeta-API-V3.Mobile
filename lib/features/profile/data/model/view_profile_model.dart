import 'package:freezed_annotation/freezed_annotation.dart';

import 'user_profile_model.dart';

part 'view_profile_model.freezed.dart';
part 'view_profile_model.g.dart';
@freezed
class ViewProfileModel with _$ViewProfileModel {
  factory ViewProfileModel({
    required bool isFriend,
    required bool isBlocked,
    required bool canMessage,
    required bool canAddFriend,
    required double distance,
    required UserProfileDataModel profile,
  }) = _ViewProfileModel;

  factory ViewProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ViewProfileModelFromJson(json);
}
//
// @freezed
// class ViewProfileModelData with _$ViewProfileModelData {
//   factory ViewProfileModelData({
//     required bool canViewProfile,
//     required bool isFriend,
//     required bool canMessage,
//     required bool canAddFriend,
//     required UserProfileDataModel profile,
//   }) = _ViewProfileModelData;
//
//   factory ViewProfileModelData.fromJson(Map<String, dynamic> json) =>
//       _$ViewProfileModelDataFromJson(json);
// }
