import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/app/common/enums/subscription_type.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileModel with _$UserProfileModel {
  @JsonSerializable(explicitToJson: true)
  factory UserProfileModel({
    required UserProfileDataModel data,
  }) = _UserProfileModel;

  factory UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);
}

@freezed
class UserProfileDataModel with _$UserProfileDataModel {
  @JsonSerializable(explicitToJson: true)
  factory UserProfileDataModel({
    UserModel? user,
    ProfileModel? profile,
    ResidentialAddressModel? residentialAddress,
    OriginAddressModel? originAddress,
    LocationModel? location,
    ProfileCounterModel? profileCounters,
    SubscriptionModel? subscription,
    WalletModel? wallet,
    List<InterestModel>? interests,
    BankAccountDetailModel? bankAccountDetails,
    List<UserDownlines>? userDownlines,
    List<UserCarousels>? userCarousels,
  }) = _UserProfileDataModel;

  factory UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataModelFromJson(json);
}

@freezed
class UserModel with _$UserModel {
  @JsonSerializable()
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
class ProfileModel with _$ProfileModel {
  @JsonSerializable()
  factory ProfileModel({
    dynamic firstName,
    dynamic lastName,
    dynamic dateOfBirth,
    dynamic age,
    dynamic gender,
    dynamic languageCSV,
    dynamic aboutMe,
    dynamic height,
    dynamic weight,
    dynamic bodyType,
    dynamic complexion,
    dynamic religion,
    dynamic tagline,
    dynamic occupation,
    dynamic profilePhotoURL,
    dynamic profileStatus,
  }) = _ProfileModel;

  factory ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);
}

@freezed
class ResidentialAddressModel with _$ResidentialAddressModel {
  @JsonSerializable()
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
  @JsonSerializable()
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
  @JsonSerializable()
  factory LocationModel({
    dynamic latitude,
    dynamic longitude,
  }) = _LocationModel;

  factory LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);
}

@freezed
class ProfileCounterModel with _$ProfileCounterModel {
  @JsonSerializable()
  factory ProfileCounterModel({
    dynamic friendsCount,
    dynamic refereesCount,
    dynamic postCount,
  }) = _ProfileCounterModel;

  factory ProfileCounterModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCounterModelFromJson(json);
}

@freezed
class SubscriptionModel with _$SubscriptionModel {
  @JsonSerializable()
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
class WalletModel with _$WalletModel {
  @JsonSerializable()
  factory WalletModel({
    dynamic availableBalance,
    dynamic lastTransactionDate,
  }) = _WalletModel;

  factory WalletModel.fromJson(Map<String, dynamic> json) =>
      _$WalletModelFromJson(json);
}

@freezed
class InterestModel with _$InterestModel {
  @JsonSerializable()
  factory InterestModel({
    dynamic id,
    dynamic title,
  }) = _InterestModel;

  factory InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);
}

@freezed
class UserDownlines with _$UserDownlines {
  @JsonSerializable()
  factory UserDownlines(
    dynamic id,
    dynamic firstName,
    dynamic lastName,
    dynamic userName,
    dynamic profilePhotoURL,
  ) = _UserDownlines;

  factory UserDownlines.fromJson(Map<String, dynamic> json) =>
      _$UserDownlinesFromJson(json);
}

@freezed
class UserCarousels with _$UserCarousels {
  @JsonSerializable()
  factory UserCarousels(
    dynamic id,
    dynamic carouselPhotoUrl,
  ) = _UserCarousels;

  factory UserCarousels.fromJson(Map<String, dynamic> json) =>
      _$UserCarouselsFromJson(json);
}

@freezed
class BankAccountDetailModel with _$BankAccountDetailModel {
  @JsonSerializable()
  factory BankAccountDetailModel({
    dynamic userId,
    dynamic firstName,
    dynamic lastName,
    dynamic country,
    dynamic payOutType,
    dynamic bankId,
    dynamic bankName,
    dynamic bankCode,
    dynamic branchCode,
    dynamic accountNumber,
    dynamic accountCurrency,
    dynamic routingNumber,
    dynamic swiftCode,
  }) = _BankAccountDetailModel;

  factory BankAccountDetailModel.fromJson(Map<String, dynamic> json) =>
      _$BankAccountDetailModelFromJson(json);
}
