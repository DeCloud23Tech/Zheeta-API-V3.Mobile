import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_profile_model.freezed.dart';
part 'user_profile_model.g.dart';

@freezed
class UserProfileData with _$UserProfileData {
  @JsonSerializable(explicitToJson: true)
  const factory UserProfileData({
    UserData? user,
    ProfileData? profile,
    ResidentialAddressData? residentialAddress,
    OriginAddressData? originAddress,
    LocationData? location,
    ProfileCounterData? profileCounters,
    SubscriptionData? subscription,
    WalletData? wallet,
    List<InterestData>? interests,
    BankAccountDetailData? bankAccountDetails,
  }) = _UserProfileData;

  factory UserProfileData.fromJson(Map<String, dynamic> json) => _$UserProfileDataFromJson(json);
}

@freezed
class UserData with _$UserData {
  @JsonSerializable()
  const factory UserData({
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
  }) = _UserData;

  factory UserData.fromJson(Map<String, dynamic> json) => _$UserDataFromJson(json);
}

@freezed
class ProfileData with _$ProfileData {
  @JsonSerializable()
  const factory ProfileData({
    dynamic firstName,
    dynamic lastName,
    dynamic dateOfBirth,
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
  }) = _ProfileData;

  factory ProfileData.fromJson(Map<String, dynamic> json) => _$ProfileDataFromJson(json);
}

@freezed
class ResidentialAddressData with _$ResidentialAddressData {
  @JsonSerializable()
  const factory ResidentialAddressData({
    dynamic city,
    dynamic state,
    dynamic country,
    dynamic zipCode,
  }) = _ResidentialAddressData;

  factory ResidentialAddressData.fromJson(Map<String, dynamic> json) => _$ResidentialAddressDataFromJson(json);
}

@freezed
class OriginAddressData with _$OriginAddressData {
  @JsonSerializable()
  const factory OriginAddressData({
    dynamic city,
    dynamic state,
    dynamic country,
    dynamic zipCode,
  }) = _OriginAddressData;

  factory OriginAddressData.fromJson(Map<String, dynamic> json) => _$OriginAddressDataFromJson(json);
}

@freezed
class LocationData with _$LocationData {
  @JsonSerializable()
  const factory LocationData({
    dynamic latitude,
    dynamic longitude,
  }) = _LocationData;

  factory LocationData.fromJson(Map<String, dynamic> json) => _$LocationDataFromJson(json);
}

@freezed
class ProfileCounterData with _$ProfileCounterData {
  @JsonSerializable()
  const factory ProfileCounterData({
    dynamic friendsCount,
    dynamic refereesCount,
    dynamic postCount,
  }) = _ProfileCounterData;

  factory ProfileCounterData.fromJson(Map<String, dynamic> json) => _$ProfileCounterDataFromJson(json);
}

@freezed
class SubscriptionData with _$SubscriptionData {
  @JsonSerializable()
  const factory SubscriptionData({
    dynamic subscriptionId,
    dynamic name,
    dynamic amount,
    dynamic startdate,
    dynamic enddate,
    dynamic status,
    dynamic paymentmethod,
  }) = _SubscriptionData;

  factory SubscriptionData.fromJson(Map<String, dynamic> json) => _$SubscriptionDataFromJson(json);
}

@freezed
class WalletData with _$WalletData {
  @JsonSerializable()
  const factory WalletData({
    dynamic availableBalance,
    dynamic lastTransactionDate,
  }) = _WalletData;

  factory WalletData.fromJson(Map<String, dynamic> json) => _$WalletDataFromJson(json);
}

@freezed
class InterestData with _$InterestData {
  @JsonSerializable()
  const factory InterestData({
    dynamic id,
    dynamic title,
  }) = _InterestData;

  factory InterestData.fromJson(Map<String, dynamic> json) => _$InterestDataFromJson(json);
}

@freezed
class BankAccountDetailData with _$BankAccountDetailData {
  @JsonSerializable()
  const factory BankAccountDetailData({
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
  }) = _BankAccountDetailData;

  factory BankAccountDetailData.fromJson(Map<String, dynamic> json) => _$BankAccountDetailDataFromJson(json);
}
