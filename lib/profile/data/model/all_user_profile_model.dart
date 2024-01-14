import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';

part 'all_user_profile_model.freezed.dart';
part 'all_user_profile_model.g.dart';

@freezed
class AllUserProfileModel with _$AllUserProfileModel {
  @JsonSerializable()
  const factory AllUserProfileModel({
    dynamic userId,
    dynamic userName,
    dynamic isFullyVerified,
    dynamic firstName,
    dynamic lastName,
    dynamic rolesCSV,
    dynamic createdDate,
    ResidentialAddressModel? residentialAddress,
    dynamic phoneNumber,
    dynamic email,
    dynamic isBlocked,
    dynamic subscriptionPlan,
  }) = _AllUserProfileModel;

  factory AllUserProfileModel.fromJson(Map<String, dynamic> json) => _$AllUserProfileModelFromJson(json);
}

@freezed
class AllUserProfileListModel with _$AllUserProfileListModel {
  @JsonSerializable(explicitToJson: true)
  const factory AllUserProfileListModel({
    List<AllUserProfileModel>? data,
  }) = _AllUserProfileListModel;

  factory AllUserProfileListModel.fromJson(Map<String, dynamic> json) => _$AllUserProfileListModelFromJson(json);
}
