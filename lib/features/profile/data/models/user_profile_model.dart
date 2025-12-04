import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

DateTime? parseCustomDate(String? date) =>
    date == null ? null : DateTime.tryParse(date);

enum SubscriptionStatus { inactive, active }

@freezed
abstract class UserProfileModel with _$UserProfileModel {
  factory UserProfileModel({
    UserProfileDataModel? data,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
abstract class UserProfileDataModel with _$UserProfileDataModel {
  factory UserProfileDataModel({
    UserModel? user,
    SubscriptionModel? userSubscription,
    ProfileModel? profile,
    ProfileCounterModel? profileCounters,
    ReferralInfoModel? referralInfo,
    List<InterestModel>? interests,
    List<UserDownlines>? userDownlines,
    List<UserCarousels>? userCarousels,
    MatchCriteriaModel? matchCriteria,
  }) = _UserProfileDataModel;

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataModelFromJson(json);
}

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel({
    String? userId,
    bool? isFullyVerified,
    String? userName,
    String? rolesCSV,
    @JsonKey(fromJson: parseCustomDate) DateTime? createdDate,
    @JsonKey(fromJson: parseCustomDate) DateTime? lastSeenDate,
    String? normalizedEmail,
    bool? emailConfirmed,
    String? phoneCountryCode,
    String? phoneNumber,
    bool? phoneNumberConfirmed,
    bool? isPromoter,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class SubscriptionModel with _$SubscriptionModel {
  factory SubscriptionModel({
    int? subscriptionId,
    String? name,
    double? amount,
    @JsonKey(name: 'startdate', fromJson: parseCustomDate) DateTime? startDate,
    @JsonKey(name: 'enddate', fromJson: parseCustomDate) DateTime? endDate,
    @JsonKey(name: 'status') int? status,
    @JsonKey(name: 'paymentmethod') String? paymentMethod,
    SubscriptionDetail? subscription,
  }) = _SubscriptionModel;

  factory SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);
}

@freezed
abstract class SubscriptionDetail with _$SubscriptionDetail {
  factory SubscriptionDetail({
    int? id,
    String? name,
    String? description,
    double? fee,
    bool? allowMessaging,
    bool? allowWithdrawal,
    bool? accessPeopleNearby,
    int? noMatchesPerDay,
    int? noOfBuddyEventPerWeek,
    int? noNearbyPerWeek,
    int? noOfChatMessagePerWeek,
    List<String>? features,
  }) = _SubscriptionDetail;

  factory SubscriptionDetail.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDetailFromJson(json);
}

@freezed
abstract class ProfileModel with _$ProfileModel {
  factory ProfileModel({
    String? id,
    String? firstName,
    String? lastName,
    String? dateOfBirth,
    int? age,
    int? gender,
    String? languageCSV,
    String? aboutMe,
    String? bodyType,
    String? complexion,
    double? height,
    double? weight,
    String? occupation,
    String? religion,
    String? tagline,
    int? maritalStatus,
    String? profilePhotoURL,
    int? profileStatus,
    @JsonKey(fromJson: parseCustomDate) DateTime? lastSeenTime,
    bool? isOnline,
    @JsonKey(fromJson: parseCustomDate) DateTime? lastModifiedDate,
    @JsonKey(fromJson: parseCustomDate) DateTime? createdDate,
    ResidentialAddressModel? residentialAddress,
    OriginAddressModel? originAddress,
    LocationModel? location,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
abstract class ResidentialAddressModel with _$ResidentialAddressModel {
  factory ResidentialAddressModel({
    String? city,
    String? state,
    String? country,
    String? zipCode,
  }) = _ResidentialAddressModel;

  factory ResidentialAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentialAddressModelFromJson(json);
}

@freezed
abstract class OriginAddressModel with _$OriginAddressModel {
  factory OriginAddressModel({
    String? city,
    String? state,
    String? country,
    String? zipCode,
  }) = _OriginAddressModel;

  factory OriginAddressModel.fromJson(Map<String, dynamic> json) =>
      _$OriginAddressModelFromJson(json);
}

@freezed
abstract class LocationModel with _$LocationModel {
  factory LocationModel({
    double? latitude,
    double? longitude,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
abstract class ProfileCounterModel with _$ProfileCounterModel {
  factory ProfileCounterModel({
    int? friendsCount,
    int? downlinesCount,
    int? successfulEventCount,
    int? totalDownlinesCount,
    int? indirectDownlinesCount,
  }) = _ProfileCounterModel;

  factory ProfileCounterModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCounterModelFromJson(json);
}

@freezed
abstract class ReferralInfoModel with _$ReferralInfoModel {
  factory ReferralInfoModel({
    String? referralCode,
    String? referralLink,
  }) = _ReferralInfoModel;

  factory ReferralInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoModelFromJson(json);
}

@freezed
abstract class InterestModel with _$InterestModel {
  factory InterestModel({
    int? id,
    String? title,
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);
}

@freezed
abstract class UserDownlines with _$UserDownlines {
  factory UserDownlines({
    String? id,
    String? firstName,
    String? lastName,
    String? userName,
    String? profilePhotoURL,
    @JsonKey(fromJson: parseCustomDate) DateTime? createdDate,
  }) = _UserDownlines;

  factory UserDownlines.fromJson(Map<String, dynamic> json) =>
      _$UserDownlinesFromJson(json);
}

@freezed
abstract class UserCarousels with _$UserCarousels {
  factory UserCarousels({
    String? id,
    String? carouselPhotoUrl,
  }) = _UserCarousels;

  factory UserCarousels.fromJson(Map<String, dynamic> json) =>
      _$UserCarouselsFromJson(json);
}

@freezed
abstract class MatchCriteriaModel with _$MatchCriteriaModel {
  factory MatchCriteriaModel({
    String? gender,
    int? minAge,
    int? maxAge,
    double? distance,
    String? country,
    String? city,
  }) = _MatchCriteriaModel;

  factory MatchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$MatchCriteriaModelFromJson(json);
}
