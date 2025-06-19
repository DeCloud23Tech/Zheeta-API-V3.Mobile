import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/common/enums/subscription_type.dart';

part 'user_profile_model.freezed.dart';

part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    required UserProfileDataModel? data,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
class UserProfileDataModel with _$UserProfileDataModel {
  factory UserProfileDataModel({
    UserModel? user,
    SubscriptionModel? userSubscription,
    ProfileModel? profile,
    ProfileCounterModel? profileCounters,
    ReferralInfoModel? referralInfo,
    List<InterestModel>? interests,
    List<UserDownlines>? userDownlines,
    List<UserCarousels>? userCarousels,
  }) = _UserProfileDataModel;

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataModelFromJson(json);
}


@freezed
class ProfileModel with _$ProfileModel {

  factory ProfileModel({
    dynamic id,
    dynamic firstName,
    dynamic lastName,
    dynamic dateOfBirth,
    dynamic age,
    dynamic gender,
    dynamic languageCSV,
    dynamic aboutMe,
    dynamic bodyType,
    dynamic complexion,
    dynamic height,
    dynamic weight,
    dynamic occupation,
    dynamic religion,
    dynamic tagline,
    dynamic maritalStatus,
    dynamic profilePhotoURL,
    dynamic profileStatus,
    dynamic lastSeenTime,
    dynamic isOnline,
    OriginAddressModel? originAddress,
    ResidentialAddressModel? residentialAddress,
    LocationModel? location,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}



// @freezed
// class MatchCriteriaModel with _$MatchCriteriaModel {
//   factory MatchCriteriaModel({
//     required String gender,
//     required int minAge,
//     required int maxAge,
//     required int distance,
//     required String country,
//     required String city,
//   }) = _MatchCriteriaModel;
//
//   factory MatchCriteriaModel.fromJson(Map<String, dynamic> json) => _$MatchCriteriaModelFromJson(json);
// }


@freezed
class UserModel with _$UserModel {

  factory UserModel({
    dynamic userId,
    dynamic isFullyVerified,
    dynamic userName,
    dynamic rolesCSV,
    dynamic createdDate,
    dynamic lastSeenDate,
    dynamic normalizedEmail,
    dynamic emailConfirmed,
    dynamic phoneCountryCode,
    dynamic phoneNumber,
    dynamic phoneNumberConfirmed,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
class ResidentialAddressModel with _$ResidentialAddressModel {

  factory ResidentialAddressModel({
    dynamic city,
    dynamic state,
    dynamic country,
    dynamic zipCode,
  }) = _ResidentialAddressModel;

  factory ResidentialAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentialAddressModelFromJson(json);
}

@freezed
class OriginAddressModel with _$OriginAddressModel {

  factory OriginAddressModel({
    dynamic city,
    dynamic state,
    dynamic country,
    dynamic zipCode,
  }) = _OriginAddressModel;

  factory OriginAddressModel.fromJson(Map<String, dynamic> json) =>
      _$OriginAddressModelFromJson(json);
}

@freezed
class LocationModel with _$LocationModel {

  factory LocationModel({
    dynamic latitude,
    dynamic longitude,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
class ProfileCounterModel with _$ProfileCounterModel {

  factory ProfileCounterModel({
    dynamic friendsCount,
    dynamic downlinesCount,
    dynamic successfulEventCount,
  }) = _ProfileCounterModel;

  factory ProfileCounterModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCounterModelFromJson(json);
}

@freezed
class SubscriptionModel with _$SubscriptionModel {

  factory SubscriptionModel({
    SubscriptionType? subscriptionId,
    dynamic name,
    dynamic amount,
    dynamic startdate,
    dynamic enddate,
    SubscriptionStatus? status,
    dynamic paymentmethod,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

@freezed
class InterestModel with _$InterestModel {

  factory InterestModel({
    dynamic id,
    dynamic title,
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);
}


@freezed
class ReferralInfoModel with _$ReferralInfoModel {

  factory ReferralInfoModel({
    required String referralCode,
    required String referralLink,
  }) = _ReferralInfoModel;

  factory ReferralInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoModelFromJson(json);
}

@freezed
class UserDownlines with _$UserDownlines {

  factory UserDownlines(
    dynamic id,
    dynamic firstName,
    dynamic lastName,
    dynamic userName,
    dynamic profilePhotoURL,
    dynamic createdDate,
  ) = _UserDownlines;

  factory UserDownlines.fromJson(Map<String, dynamic> json) =>
      _$UserDownlinesFromJson(json);
}

@freezed
class UserCarousels with _$UserCarousels {

  factory UserCarousels(
    dynamic id,
    dynamic carouselPhotoUrl,
  ) = _UserCarousels;

  factory UserCarousels.fromJson(Map<String, dynamic> json) =>
      _$UserCarouselsFromJson(json);
}
