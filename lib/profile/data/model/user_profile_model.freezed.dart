// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

UserProfileData _$UserProfileDataFromJson(Map<String, dynamic> json) {
  return _UserProfileData.fromJson(json);
}

/// @nodoc
mixin _$UserProfileData {
  UserData? get user => throw _privateConstructorUsedError;
  ProfileData? get profile => throw _privateConstructorUsedError;
  ResidentialAddressData? get residentialAddress =>
      throw _privateConstructorUsedError;
  OriginAddressData? get originAddress => throw _privateConstructorUsedError;
  LocationData? get location => throw _privateConstructorUsedError;
  ProfileCounterData? get profileCounters => throw _privateConstructorUsedError;
  SubscriptionData? get subscription => throw _privateConstructorUsedError;
  WalletData? get wallet => throw _privateConstructorUsedError;
  List<InterestData>? get interests => throw _privateConstructorUsedError;
  BankAccountDetailData? get bankAccountDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileDataCopyWith<UserProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDataCopyWith<$Res> {
  factory $UserProfileDataCopyWith(
          UserProfileData value, $Res Function(UserProfileData) then) =
      _$UserProfileDataCopyWithImpl<$Res, UserProfileData>;
  @useResult
  $Res call(
      {UserData? user,
      ProfileData? profile,
      ResidentialAddressData? residentialAddress,
      OriginAddressData? originAddress,
      LocationData? location,
      ProfileCounterData? profileCounters,
      SubscriptionData? subscription,
      WalletData? wallet,
      List<InterestData>? interests,
      BankAccountDetailData? bankAccountDetails});

  $UserDataCopyWith<$Res>? get user;
  $ProfileDataCopyWith<$Res>? get profile;
  $ResidentialAddressDataCopyWith<$Res>? get residentialAddress;
  $OriginAddressDataCopyWith<$Res>? get originAddress;
  $LocationDataCopyWith<$Res>? get location;
  $ProfileCounterDataCopyWith<$Res>? get profileCounters;
  $SubscriptionDataCopyWith<$Res>? get subscription;
  $WalletDataCopyWith<$Res>? get wallet;
  $BankAccountDetailDataCopyWith<$Res>? get bankAccountDetails;
}

/// @nodoc
class _$UserProfileDataCopyWithImpl<$Res, $Val extends UserProfileData>
    implements $UserProfileDataCopyWith<$Res> {
  _$UserProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? profile = freezed,
    Object? residentialAddress = freezed,
    Object? originAddress = freezed,
    Object? location = freezed,
    Object? profileCounters = freezed,
    Object? subscription = freezed,
    Object? wallet = freezed,
    Object? interests = freezed,
    Object? bankAccountDetails = freezed,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
      residentialAddress: freezed == residentialAddress
          ? _value.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressData?,
      originAddress: freezed == originAddress
          ? _value.originAddress
          : originAddress // ignore: cast_nullable_to_non_nullable
              as OriginAddressData?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      profileCounters: freezed == profileCounters
          ? _value.profileCounters
          : profileCounters // ignore: cast_nullable_to_non_nullable
              as ProfileCounterData?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionData?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletData?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestData>?,
      bankAccountDetails: freezed == bankAccountDetails
          ? _value.bankAccountDetails
          : bankAccountDetails // ignore: cast_nullable_to_non_nullable
              as BankAccountDetailData?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserDataCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserDataCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileDataCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileDataCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResidentialAddressDataCopyWith<$Res>? get residentialAddress {
    if (_value.residentialAddress == null) {
      return null;
    }

    return $ResidentialAddressDataCopyWith<$Res>(_value.residentialAddress!,
        (value) {
      return _then(_value.copyWith(residentialAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginAddressDataCopyWith<$Res>? get originAddress {
    if (_value.originAddress == null) {
      return null;
    }

    return $OriginAddressDataCopyWith<$Res>(_value.originAddress!, (value) {
      return _then(_value.copyWith(originAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationDataCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationDataCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCounterDataCopyWith<$Res>? get profileCounters {
    if (_value.profileCounters == null) {
      return null;
    }

    return $ProfileCounterDataCopyWith<$Res>(_value.profileCounters!, (value) {
      return _then(_value.copyWith(profileCounters: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionDataCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $SubscriptionDataCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletDataCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletDataCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountDetailDataCopyWith<$Res>? get bankAccountDetails {
    if (_value.bankAccountDetails == null) {
      return null;
    }

    return $BankAccountDetailDataCopyWith<$Res>(_value.bankAccountDetails!,
        (value) {
      return _then(_value.copyWith(bankAccountDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileDataImplCopyWith<$Res>
    implements $UserProfileDataCopyWith<$Res> {
  factory _$$UserProfileDataImplCopyWith(_$UserProfileDataImpl value,
          $Res Function(_$UserProfileDataImpl) then) =
      __$$UserProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserData? user,
      ProfileData? profile,
      ResidentialAddressData? residentialAddress,
      OriginAddressData? originAddress,
      LocationData? location,
      ProfileCounterData? profileCounters,
      SubscriptionData? subscription,
      WalletData? wallet,
      List<InterestData>? interests,
      BankAccountDetailData? bankAccountDetails});

  @override
  $UserDataCopyWith<$Res>? get user;
  @override
  $ProfileDataCopyWith<$Res>? get profile;
  @override
  $ResidentialAddressDataCopyWith<$Res>? get residentialAddress;
  @override
  $OriginAddressDataCopyWith<$Res>? get originAddress;
  @override
  $LocationDataCopyWith<$Res>? get location;
  @override
  $ProfileCounterDataCopyWith<$Res>? get profileCounters;
  @override
  $SubscriptionDataCopyWith<$Res>? get subscription;
  @override
  $WalletDataCopyWith<$Res>? get wallet;
  @override
  $BankAccountDetailDataCopyWith<$Res>? get bankAccountDetails;
}

/// @nodoc
class __$$UserProfileDataImplCopyWithImpl<$Res>
    extends _$UserProfileDataCopyWithImpl<$Res, _$UserProfileDataImpl>
    implements _$$UserProfileDataImplCopyWith<$Res> {
  __$$UserProfileDataImplCopyWithImpl(
      _$UserProfileDataImpl _value, $Res Function(_$UserProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? profile = freezed,
    Object? residentialAddress = freezed,
    Object? originAddress = freezed,
    Object? location = freezed,
    Object? profileCounters = freezed,
    Object? subscription = freezed,
    Object? wallet = freezed,
    Object? interests = freezed,
    Object? bankAccountDetails = freezed,
  }) {
    return _then(_$UserProfileDataImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserData?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileData?,
      residentialAddress: freezed == residentialAddress
          ? _value.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressData?,
      originAddress: freezed == originAddress
          ? _value.originAddress
          : originAddress // ignore: cast_nullable_to_non_nullable
              as OriginAddressData?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationData?,
      profileCounters: freezed == profileCounters
          ? _value.profileCounters
          : profileCounters // ignore: cast_nullable_to_non_nullable
              as ProfileCounterData?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionData?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletData?,
      interests: freezed == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestData>?,
      bankAccountDetails: freezed == bankAccountDetails
          ? _value.bankAccountDetails
          : bankAccountDetails // ignore: cast_nullable_to_non_nullable
              as BankAccountDetailData?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserProfileDataImpl implements _UserProfileData {
  const _$UserProfileDataImpl(
      {this.user,
      this.profile,
      this.residentialAddress,
      this.originAddress,
      this.location,
      this.profileCounters,
      this.subscription,
      this.wallet,
      final List<InterestData>? interests,
      this.bankAccountDetails})
      : _interests = interests;

  factory _$UserProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDataImplFromJson(json);

  @override
  final UserData? user;
  @override
  final ProfileData? profile;
  @override
  final ResidentialAddressData? residentialAddress;
  @override
  final OriginAddressData? originAddress;
  @override
  final LocationData? location;
  @override
  final ProfileCounterData? profileCounters;
  @override
  final SubscriptionData? subscription;
  @override
  final WalletData? wallet;
  final List<InterestData>? _interests;
  @override
  List<InterestData>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final BankAccountDetailData? bankAccountDetails;

  @override
  String toString() {
    return 'UserProfileData(user: $user, profile: $profile, residentialAddress: $residentialAddress, originAddress: $originAddress, location: $location, profileCounters: $profileCounters, subscription: $subscription, wallet: $wallet, interests: $interests, bankAccountDetails: $bankAccountDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDataImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.residentialAddress, residentialAddress) ||
                other.residentialAddress == residentialAddress) &&
            (identical(other.originAddress, originAddress) ||
                other.originAddress == originAddress) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.profileCounters, profileCounters) ||
                other.profileCounters == profileCounters) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription) &&
            (identical(other.wallet, wallet) || other.wallet == wallet) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            (identical(other.bankAccountDetails, bankAccountDetails) ||
                other.bankAccountDetails == bankAccountDetails));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      profile,
      residentialAddress,
      originAddress,
      location,
      profileCounters,
      subscription,
      wallet,
      const DeepCollectionEquality().hash(_interests),
      bankAccountDetails);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileDataImplCopyWith<_$UserProfileDataImpl> get copyWith =>
      __$$UserProfileDataImplCopyWithImpl<_$UserProfileDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDataImplToJson(
      this,
    );
  }
}

abstract class _UserProfileData implements UserProfileData {
  const factory _UserProfileData(
      {final UserData? user,
      final ProfileData? profile,
      final ResidentialAddressData? residentialAddress,
      final OriginAddressData? originAddress,
      final LocationData? location,
      final ProfileCounterData? profileCounters,
      final SubscriptionData? subscription,
      final WalletData? wallet,
      final List<InterestData>? interests,
      final BankAccountDetailData? bankAccountDetails}) = _$UserProfileDataImpl;

  factory _UserProfileData.fromJson(Map<String, dynamic> json) =
      _$UserProfileDataImpl.fromJson;

  @override
  UserData? get user;
  @override
  ProfileData? get profile;
  @override
  ResidentialAddressData? get residentialAddress;
  @override
  OriginAddressData? get originAddress;
  @override
  LocationData? get location;
  @override
  ProfileCounterData? get profileCounters;
  @override
  SubscriptionData? get subscription;
  @override
  WalletData? get wallet;
  @override
  List<InterestData>? get interests;
  @override
  BankAccountDetailData? get bankAccountDetails;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileDataImplCopyWith<_$UserProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserData _$UserDataFromJson(Map<String, dynamic> json) {
  return _UserData.fromJson(json);
}

/// @nodoc
mixin _$UserData {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get isFullyVerified => throw _privateConstructorUsedError;
  dynamic get userName => throw _privateConstructorUsedError;
  dynamic get rolesCSV => throw _privateConstructorUsedError;
  dynamic get createdDate => throw _privateConstructorUsedError;
  dynamic get lastSeenDate => throw _privateConstructorUsedError;
  dynamic get normalizedEmail => throw _privateConstructorUsedError;
  dynamic get emailConfirmed => throw _privateConstructorUsedError;
  dynamic get phoneCountryCode => throw _privateConstructorUsedError;
  dynamic get phoneNumber => throw _privateConstructorUsedError;
  dynamic get phoneNumberConfirmed => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserDataCopyWith<UserData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserDataCopyWith<$Res> {
  factory $UserDataCopyWith(UserData value, $Res Function(UserData) then) =
      _$UserDataCopyWithImpl<$Res, UserData>;
  @useResult
  $Res call(
      {dynamic userId,
      dynamic isFullyVerified,
      dynamic userName,
      dynamic rolesCSV,
      dynamic createdDate,
      dynamic lastSeenDate,
      dynamic normalizedEmail,
      dynamic emailConfirmed,
      dynamic phoneCountryCode,
      dynamic phoneNumber,
      dynamic phoneNumberConfirmed});
}

/// @nodoc
class _$UserDataCopyWithImpl<$Res, $Val extends UserData>
    implements $UserDataCopyWith<$Res> {
  _$UserDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? isFullyVerified = freezed,
    Object? userName = freezed,
    Object? rolesCSV = freezed,
    Object? createdDate = freezed,
    Object? lastSeenDate = freezed,
    Object? normalizedEmail = freezed,
    Object? emailConfirmed = freezed,
    Object? phoneCountryCode = freezed,
    Object? phoneNumber = freezed,
    Object? phoneNumberConfirmed = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesCSV: freezed == rolesCSV
          ? _value.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastSeenDate: freezed == lastSeenDate
          ? _value.lastSeenDate
          : lastSeenDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalizedEmail: freezed == normalizedEmail
          ? _value.normalizedEmail
          : normalizedEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailConfirmed: freezed == emailConfirmed
          ? _value.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneCountryCode: freezed == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumberConfirmed: freezed == phoneNumberConfirmed
          ? _value.phoneNumberConfirmed
          : phoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserDataImplCopyWith<$Res>
    implements $UserDataCopyWith<$Res> {
  factory _$$UserDataImplCopyWith(
          _$UserDataImpl value, $Res Function(_$UserDataImpl) then) =
      __$$UserDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
      dynamic isFullyVerified,
      dynamic userName,
      dynamic rolesCSV,
      dynamic createdDate,
      dynamic lastSeenDate,
      dynamic normalizedEmail,
      dynamic emailConfirmed,
      dynamic phoneCountryCode,
      dynamic phoneNumber,
      dynamic phoneNumberConfirmed});
}

/// @nodoc
class __$$UserDataImplCopyWithImpl<$Res>
    extends _$UserDataCopyWithImpl<$Res, _$UserDataImpl>
    implements _$$UserDataImplCopyWith<$Res> {
  __$$UserDataImplCopyWithImpl(
      _$UserDataImpl _value, $Res Function(_$UserDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? isFullyVerified = freezed,
    Object? userName = freezed,
    Object? rolesCSV = freezed,
    Object? createdDate = freezed,
    Object? lastSeenDate = freezed,
    Object? normalizedEmail = freezed,
    Object? emailConfirmed = freezed,
    Object? phoneCountryCode = freezed,
    Object? phoneNumber = freezed,
    Object? phoneNumberConfirmed = freezed,
  }) {
    return _then(_$UserDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      isFullyVerified: freezed == isFullyVerified
          ? _value.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as dynamic,
      userName: freezed == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      rolesCSV: freezed == rolesCSV
          ? _value.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastSeenDate: freezed == lastSeenDate
          ? _value.lastSeenDate
          : lastSeenDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      normalizedEmail: freezed == normalizedEmail
          ? _value.normalizedEmail
          : normalizedEmail // ignore: cast_nullable_to_non_nullable
              as dynamic,
      emailConfirmed: freezed == emailConfirmed
          ? _value.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneCountryCode: freezed == phoneCountryCode
          ? _value.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumber: freezed == phoneNumber
          ? _value.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      phoneNumberConfirmed: freezed == phoneNumberConfirmed
          ? _value.phoneNumberConfirmed
          : phoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$UserDataImpl implements _UserData {
  const _$UserDataImpl(
      {this.userId,
      this.isFullyVerified,
      this.userName,
      this.rolesCSV,
      this.createdDate,
      this.lastSeenDate,
      this.normalizedEmail,
      this.emailConfirmed,
      this.phoneCountryCode,
      this.phoneNumber,
      this.phoneNumberConfirmed});

  factory _$UserDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserDataImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic isFullyVerified;
  @override
  final dynamic userName;
  @override
  final dynamic rolesCSV;
  @override
  final dynamic createdDate;
  @override
  final dynamic lastSeenDate;
  @override
  final dynamic normalizedEmail;
  @override
  final dynamic emailConfirmed;
  @override
  final dynamic phoneCountryCode;
  @override
  final dynamic phoneNumber;
  @override
  final dynamic phoneNumberConfirmed;

  @override
  String toString() {
    return 'UserData(userId: $userId, isFullyVerified: $isFullyVerified, userName: $userName, rolesCSV: $rolesCSV, createdDate: $createdDate, lastSeenDate: $lastSeenDate, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, phoneCountryCode: $phoneCountryCode, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserDataImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality()
                .equals(other.isFullyVerified, isFullyVerified) &&
            const DeepCollectionEquality().equals(other.userName, userName) &&
            const DeepCollectionEquality().equals(other.rolesCSV, rolesCSV) &&
            const DeepCollectionEquality()
                .equals(other.createdDate, createdDate) &&
            const DeepCollectionEquality()
                .equals(other.lastSeenDate, lastSeenDate) &&
            const DeepCollectionEquality()
                .equals(other.normalizedEmail, normalizedEmail) &&
            const DeepCollectionEquality()
                .equals(other.emailConfirmed, emailConfirmed) &&
            const DeepCollectionEquality()
                .equals(other.phoneCountryCode, phoneCountryCode) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumber, phoneNumber) &&
            const DeepCollectionEquality()
                .equals(other.phoneNumberConfirmed, phoneNumberConfirmed));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(isFullyVerified),
      const DeepCollectionEquality().hash(userName),
      const DeepCollectionEquality().hash(rolesCSV),
      const DeepCollectionEquality().hash(createdDate),
      const DeepCollectionEquality().hash(lastSeenDate),
      const DeepCollectionEquality().hash(normalizedEmail),
      const DeepCollectionEquality().hash(emailConfirmed),
      const DeepCollectionEquality().hash(phoneCountryCode),
      const DeepCollectionEquality().hash(phoneNumber),
      const DeepCollectionEquality().hash(phoneNumberConfirmed));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      __$$UserDataImplCopyWithImpl<_$UserDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserDataImplToJson(
      this,
    );
  }
}

abstract class _UserData implements UserData {
  const factory _UserData(
      {final dynamic userId,
      final dynamic isFullyVerified,
      final dynamic userName,
      final dynamic rolesCSV,
      final dynamic createdDate,
      final dynamic lastSeenDate,
      final dynamic normalizedEmail,
      final dynamic emailConfirmed,
      final dynamic phoneCountryCode,
      final dynamic phoneNumber,
      final dynamic phoneNumberConfirmed}) = _$UserDataImpl;

  factory _UserData.fromJson(Map<String, dynamic> json) =
      _$UserDataImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get isFullyVerified;
  @override
  dynamic get userName;
  @override
  dynamic get rolesCSV;
  @override
  dynamic get createdDate;
  @override
  dynamic get lastSeenDate;
  @override
  dynamic get normalizedEmail;
  @override
  dynamic get emailConfirmed;
  @override
  dynamic get phoneCountryCode;
  @override
  dynamic get phoneNumber;
  @override
  dynamic get phoneNumberConfirmed;
  @override
  @JsonKey(ignore: true)
  _$$UserDataImplCopyWith<_$UserDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileData _$ProfileDataFromJson(Map<String, dynamic> json) {
  return _ProfileData.fromJson(json);
}

/// @nodoc
mixin _$ProfileData {
  dynamic get firstName => throw _privateConstructorUsedError;
  dynamic get lastName => throw _privateConstructorUsedError;
  dynamic get dateOfBirth => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  dynamic get languageCSV => throw _privateConstructorUsedError;
  dynamic get aboutMe => throw _privateConstructorUsedError;
  dynamic get height => throw _privateConstructorUsedError;
  dynamic get weight => throw _privateConstructorUsedError;
  dynamic get bodyType => throw _privateConstructorUsedError;
  dynamic get complexion => throw _privateConstructorUsedError;
  dynamic get religion => throw _privateConstructorUsedError;
  dynamic get tagline => throw _privateConstructorUsedError;
  dynamic get occupation => throw _privateConstructorUsedError;
  dynamic get profilePhotoURL => throw _privateConstructorUsedError;
  dynamic get profileStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileDataCopyWith<ProfileData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileDataCopyWith<$Res> {
  factory $ProfileDataCopyWith(
          ProfileData value, $Res Function(ProfileData) then) =
      _$ProfileDataCopyWithImpl<$Res, ProfileData>;
  @useResult
  $Res call(
      {dynamic firstName,
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
      dynamic profileStatus});
}

/// @nodoc
class _$ProfileDataCopyWithImpl<$Res, $Val extends ProfileData>
    implements $ProfileDataCopyWith<$Res> {
  _$ProfileDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? languageCSV = freezed,
    Object? aboutMe = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? bodyType = freezed,
    Object? complexion = freezed,
    Object? religion = freezed,
    Object? tagline = freezed,
    Object? occupation = freezed,
    Object? profilePhotoURL = freezed,
    Object? profileStatus = freezed,
  }) {
    return _then(_value.copyWith(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      languageCSV: freezed == languageCSV
          ? _value.languageCSV
          : languageCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      complexion: freezed == complexion
          ? _value.complexion
          : complexion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as dynamic,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePhotoURL: freezed == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileStatus: freezed == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileDataImplCopyWith<$Res>
    implements $ProfileDataCopyWith<$Res> {
  factory _$$ProfileDataImplCopyWith(
          _$ProfileDataImpl value, $Res Function(_$ProfileDataImpl) then) =
      __$$ProfileDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic firstName,
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
      dynamic profileStatus});
}

/// @nodoc
class __$$ProfileDataImplCopyWithImpl<$Res>
    extends _$ProfileDataCopyWithImpl<$Res, _$ProfileDataImpl>
    implements _$$ProfileDataImplCopyWith<$Res> {
  __$$ProfileDataImplCopyWithImpl(
      _$ProfileDataImpl _value, $Res Function(_$ProfileDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? gender = freezed,
    Object? languageCSV = freezed,
    Object? aboutMe = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? bodyType = freezed,
    Object? complexion = freezed,
    Object? religion = freezed,
    Object? tagline = freezed,
    Object? occupation = freezed,
    Object? profilePhotoURL = freezed,
    Object? profileStatus = freezed,
  }) {
    return _then(_$ProfileDataImpl(
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      dateOfBirth: freezed == dateOfBirth
          ? _value.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      languageCSV: freezed == languageCSV
          ? _value.languageCSV
          : languageCSV // ignore: cast_nullable_to_non_nullable
              as dynamic,
      aboutMe: freezed == aboutMe
          ? _value.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as dynamic,
      height: freezed == height
          ? _value.height
          : height // ignore: cast_nullable_to_non_nullable
              as dynamic,
      weight: freezed == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bodyType: freezed == bodyType
          ? _value.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      complexion: freezed == complexion
          ? _value.complexion
          : complexion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      religion: freezed == religion
          ? _value.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as dynamic,
      tagline: freezed == tagline
          ? _value.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as dynamic,
      occupation: freezed == occupation
          ? _value.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePhotoURL: freezed == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profileStatus: freezed == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ProfileDataImpl implements _ProfileData {
  const _$ProfileDataImpl(
      {this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.gender,
      this.languageCSV,
      this.aboutMe,
      this.height,
      this.weight,
      this.bodyType,
      this.complexion,
      this.religion,
      this.tagline,
      this.occupation,
      this.profilePhotoURL,
      this.profileStatus});

  factory _$ProfileDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileDataImplFromJson(json);

  @override
  final dynamic firstName;
  @override
  final dynamic lastName;
  @override
  final dynamic dateOfBirth;
  @override
  final dynamic gender;
  @override
  final dynamic languageCSV;
  @override
  final dynamic aboutMe;
  @override
  final dynamic height;
  @override
  final dynamic weight;
  @override
  final dynamic bodyType;
  @override
  final dynamic complexion;
  @override
  final dynamic religion;
  @override
  final dynamic tagline;
  @override
  final dynamic occupation;
  @override
  final dynamic profilePhotoURL;
  @override
  final dynamic profileStatus;

  @override
  String toString() {
    return 'ProfileData(firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, languageCSV: $languageCSV, aboutMe: $aboutMe, height: $height, weight: $weight, bodyType: $bodyType, complexion: $complexion, religion: $religion, tagline: $tagline, occupation: $occupation, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileDataImpl &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality()
                .equals(other.dateOfBirth, dateOfBirth) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.languageCSV, languageCSV) &&
            const DeepCollectionEquality().equals(other.aboutMe, aboutMe) &&
            const DeepCollectionEquality().equals(other.height, height) &&
            const DeepCollectionEquality().equals(other.weight, weight) &&
            const DeepCollectionEquality().equals(other.bodyType, bodyType) &&
            const DeepCollectionEquality()
                .equals(other.complexion, complexion) &&
            const DeepCollectionEquality().equals(other.religion, religion) &&
            const DeepCollectionEquality().equals(other.tagline, tagline) &&
            const DeepCollectionEquality()
                .equals(other.occupation, occupation) &&
            const DeepCollectionEquality()
                .equals(other.profilePhotoURL, profilePhotoURL) &&
            const DeepCollectionEquality()
                .equals(other.profileStatus, profileStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(dateOfBirth),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(languageCSV),
      const DeepCollectionEquality().hash(aboutMe),
      const DeepCollectionEquality().hash(height),
      const DeepCollectionEquality().hash(weight),
      const DeepCollectionEquality().hash(bodyType),
      const DeepCollectionEquality().hash(complexion),
      const DeepCollectionEquality().hash(religion),
      const DeepCollectionEquality().hash(tagline),
      const DeepCollectionEquality().hash(occupation),
      const DeepCollectionEquality().hash(profilePhotoURL),
      const DeepCollectionEquality().hash(profileStatus));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      __$$ProfileDataImplCopyWithImpl<_$ProfileDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileData implements ProfileData {
  const factory _ProfileData(
      {final dynamic firstName,
      final dynamic lastName,
      final dynamic dateOfBirth,
      final dynamic gender,
      final dynamic languageCSV,
      final dynamic aboutMe,
      final dynamic height,
      final dynamic weight,
      final dynamic bodyType,
      final dynamic complexion,
      final dynamic religion,
      final dynamic tagline,
      final dynamic occupation,
      final dynamic profilePhotoURL,
      final dynamic profileStatus}) = _$ProfileDataImpl;

  factory _ProfileData.fromJson(Map<String, dynamic> json) =
      _$ProfileDataImpl.fromJson;

  @override
  dynamic get firstName;
  @override
  dynamic get lastName;
  @override
  dynamic get dateOfBirth;
  @override
  dynamic get gender;
  @override
  dynamic get languageCSV;
  @override
  dynamic get aboutMe;
  @override
  dynamic get height;
  @override
  dynamic get weight;
  @override
  dynamic get bodyType;
  @override
  dynamic get complexion;
  @override
  dynamic get religion;
  @override
  dynamic get tagline;
  @override
  dynamic get occupation;
  @override
  dynamic get profilePhotoURL;
  @override
  dynamic get profileStatus;
  @override
  @JsonKey(ignore: true)
  _$$ProfileDataImplCopyWith<_$ProfileDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResidentialAddressData _$ResidentialAddressDataFromJson(
    Map<String, dynamic> json) {
  return _ResidentialAddressData.fromJson(json);
}

/// @nodoc
mixin _$ResidentialAddressData {
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get state => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get zipCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResidentialAddressDataCopyWith<ResidentialAddressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentialAddressDataCopyWith<$Res> {
  factory $ResidentialAddressDataCopyWith(ResidentialAddressData value,
          $Res Function(ResidentialAddressData) then) =
      _$ResidentialAddressDataCopyWithImpl<$Res, ResidentialAddressData>;
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class _$ResidentialAddressDataCopyWithImpl<$Res,
        $Val extends ResidentialAddressData>
    implements $ResidentialAddressDataCopyWith<$Res> {
  _$ResidentialAddressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_value.copyWith(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ResidentialAddressDataImplCopyWith<$Res>
    implements $ResidentialAddressDataCopyWith<$Res> {
  factory _$$ResidentialAddressDataImplCopyWith(
          _$ResidentialAddressDataImpl value,
          $Res Function(_$ResidentialAddressDataImpl) then) =
      __$$ResidentialAddressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class __$$ResidentialAddressDataImplCopyWithImpl<$Res>
    extends _$ResidentialAddressDataCopyWithImpl<$Res,
        _$ResidentialAddressDataImpl>
    implements _$$ResidentialAddressDataImplCopyWith<$Res> {
  __$$ResidentialAddressDataImplCopyWithImpl(
      _$ResidentialAddressDataImpl _value,
      $Res Function(_$ResidentialAddressDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_$ResidentialAddressDataImpl(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ResidentialAddressDataImpl implements _ResidentialAddressData {
  const _$ResidentialAddressDataImpl(
      {this.city, this.state, this.country, this.zipCode});

  factory _$ResidentialAddressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentialAddressDataImplFromJson(json);

  @override
  final dynamic city;
  @override
  final dynamic state;
  @override
  final dynamic country;
  @override
  final dynamic zipCode;

  @override
  String toString() {
    return 'ResidentialAddressData(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentialAddressDataImpl &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.zipCode, zipCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(zipCode));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ResidentialAddressDataImplCopyWith<_$ResidentialAddressDataImpl>
      get copyWith => __$$ResidentialAddressDataImplCopyWithImpl<
          _$ResidentialAddressDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentialAddressDataImplToJson(
      this,
    );
  }
}

abstract class _ResidentialAddressData implements ResidentialAddressData {
  const factory _ResidentialAddressData(
      {final dynamic city,
      final dynamic state,
      final dynamic country,
      final dynamic zipCode}) = _$ResidentialAddressDataImpl;

  factory _ResidentialAddressData.fromJson(Map<String, dynamic> json) =
      _$ResidentialAddressDataImpl.fromJson;

  @override
  dynamic get city;
  @override
  dynamic get state;
  @override
  dynamic get country;
  @override
  dynamic get zipCode;
  @override
  @JsonKey(ignore: true)
  _$$ResidentialAddressDataImplCopyWith<_$ResidentialAddressDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OriginAddressData _$OriginAddressDataFromJson(Map<String, dynamic> json) {
  return _OriginAddressData.fromJson(json);
}

/// @nodoc
mixin _$OriginAddressData {
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get state => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get zipCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OriginAddressDataCopyWith<OriginAddressData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OriginAddressDataCopyWith<$Res> {
  factory $OriginAddressDataCopyWith(
          OriginAddressData value, $Res Function(OriginAddressData) then) =
      _$OriginAddressDataCopyWithImpl<$Res, OriginAddressData>;
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class _$OriginAddressDataCopyWithImpl<$Res, $Val extends OriginAddressData>
    implements $OriginAddressDataCopyWith<$Res> {
  _$OriginAddressDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_value.copyWith(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$OriginAddressDataImplCopyWith<$Res>
    implements $OriginAddressDataCopyWith<$Res> {
  factory _$$OriginAddressDataImplCopyWith(_$OriginAddressDataImpl value,
          $Res Function(_$OriginAddressDataImpl) then) =
      __$$OriginAddressDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class __$$OriginAddressDataImplCopyWithImpl<$Res>
    extends _$OriginAddressDataCopyWithImpl<$Res, _$OriginAddressDataImpl>
    implements _$$OriginAddressDataImplCopyWith<$Res> {
  __$$OriginAddressDataImplCopyWithImpl(_$OriginAddressDataImpl _value,
      $Res Function(_$OriginAddressDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_$OriginAddressDataImpl(
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
      state: freezed == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      zipCode: freezed == zipCode
          ? _value.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$OriginAddressDataImpl implements _OriginAddressData {
  const _$OriginAddressDataImpl(
      {this.city, this.state, this.country, this.zipCode});

  factory _$OriginAddressDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$OriginAddressDataImplFromJson(json);

  @override
  final dynamic city;
  @override
  final dynamic state;
  @override
  final dynamic country;
  @override
  final dynamic zipCode;

  @override
  String toString() {
    return 'OriginAddressData(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OriginAddressDataImpl &&
            const DeepCollectionEquality().equals(other.city, city) &&
            const DeepCollectionEquality().equals(other.state, state) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.zipCode, zipCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(city),
      const DeepCollectionEquality().hash(state),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(zipCode));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$OriginAddressDataImplCopyWith<_$OriginAddressDataImpl> get copyWith =>
      __$$OriginAddressDataImplCopyWithImpl<_$OriginAddressDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OriginAddressDataImplToJson(
      this,
    );
  }
}

abstract class _OriginAddressData implements OriginAddressData {
  const factory _OriginAddressData(
      {final dynamic city,
      final dynamic state,
      final dynamic country,
      final dynamic zipCode}) = _$OriginAddressDataImpl;

  factory _OriginAddressData.fromJson(Map<String, dynamic> json) =
      _$OriginAddressDataImpl.fromJson;

  @override
  dynamic get city;
  @override
  dynamic get state;
  @override
  dynamic get country;
  @override
  dynamic get zipCode;
  @override
  @JsonKey(ignore: true)
  _$$OriginAddressDataImplCopyWith<_$OriginAddressDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationData _$LocationDataFromJson(Map<String, dynamic> json) {
  return _LocationData.fromJson(json);
}

/// @nodoc
mixin _$LocationData {
  dynamic get latitude => throw _privateConstructorUsedError;
  dynamic get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationDataCopyWith<LocationData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationDataCopyWith<$Res> {
  factory $LocationDataCopyWith(
          LocationData value, $Res Function(LocationData) then) =
      _$LocationDataCopyWithImpl<$Res, LocationData>;
  @useResult
  $Res call({dynamic latitude, dynamic longitude});
}

/// @nodoc
class _$LocationDataCopyWithImpl<$Res, $Val extends LocationData>
    implements $LocationDataCopyWith<$Res> {
  _$LocationDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_value.copyWith(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LocationDataImplCopyWith<$Res>
    implements $LocationDataCopyWith<$Res> {
  factory _$$LocationDataImplCopyWith(
          _$LocationDataImpl value, $Res Function(_$LocationDataImpl) then) =
      __$$LocationDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic latitude, dynamic longitude});
}

/// @nodoc
class __$$LocationDataImplCopyWithImpl<$Res>
    extends _$LocationDataCopyWithImpl<$Res, _$LocationDataImpl>
    implements _$$LocationDataImplCopyWith<$Res> {
  __$$LocationDataImplCopyWithImpl(
      _$LocationDataImpl _value, $Res Function(_$LocationDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$LocationDataImpl(
      latitude: freezed == latitude
          ? _value.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
      longitude: freezed == longitude
          ? _value.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$LocationDataImpl implements _LocationData {
  const _$LocationDataImpl({this.latitude, this.longitude});

  factory _$LocationDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationDataImplFromJson(json);

  @override
  final dynamic latitude;
  @override
  final dynamic longitude;

  @override
  String toString() {
    return 'LocationData(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationDataImpl &&
            const DeepCollectionEquality().equals(other.latitude, latitude) &&
            const DeepCollectionEquality().equals(other.longitude, longitude));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(latitude),
      const DeepCollectionEquality().hash(longitude));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      __$$LocationDataImplCopyWithImpl<_$LocationDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationDataImplToJson(
      this,
    );
  }
}

abstract class _LocationData implements LocationData {
  const factory _LocationData(
      {final dynamic latitude, final dynamic longitude}) = _$LocationDataImpl;

  factory _LocationData.fromJson(Map<String, dynamic> json) =
      _$LocationDataImpl.fromJson;

  @override
  dynamic get latitude;
  @override
  dynamic get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LocationDataImplCopyWith<_$LocationDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileCounterData _$ProfileCounterDataFromJson(Map<String, dynamic> json) {
  return _ProfileCounterData.fromJson(json);
}

/// @nodoc
mixin _$ProfileCounterData {
  dynamic get friendsCount => throw _privateConstructorUsedError;
  dynamic get refereesCount => throw _privateConstructorUsedError;
  dynamic get postCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCounterDataCopyWith<ProfileCounterData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCounterDataCopyWith<$Res> {
  factory $ProfileCounterDataCopyWith(
          ProfileCounterData value, $Res Function(ProfileCounterData) then) =
      _$ProfileCounterDataCopyWithImpl<$Res, ProfileCounterData>;
  @useResult
  $Res call({dynamic friendsCount, dynamic refereesCount, dynamic postCount});
}

/// @nodoc
class _$ProfileCounterDataCopyWithImpl<$Res, $Val extends ProfileCounterData>
    implements $ProfileCounterDataCopyWith<$Res> {
  _$ProfileCounterDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsCount = freezed,
    Object? refereesCount = freezed,
    Object? postCount = freezed,
  }) {
    return _then(_value.copyWith(
      friendsCount: freezed == friendsCount
          ? _value.friendsCount
          : friendsCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refereesCount: freezed == refereesCount
          ? _value.refereesCount
          : refereesCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCount: freezed == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileCounterDataImplCopyWith<$Res>
    implements $ProfileCounterDataCopyWith<$Res> {
  factory _$$ProfileCounterDataImplCopyWith(_$ProfileCounterDataImpl value,
          $Res Function(_$ProfileCounterDataImpl) then) =
      __$$ProfileCounterDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic friendsCount, dynamic refereesCount, dynamic postCount});
}

/// @nodoc
class __$$ProfileCounterDataImplCopyWithImpl<$Res>
    extends _$ProfileCounterDataCopyWithImpl<$Res, _$ProfileCounterDataImpl>
    implements _$$ProfileCounterDataImplCopyWith<$Res> {
  __$$ProfileCounterDataImplCopyWithImpl(_$ProfileCounterDataImpl _value,
      $Res Function(_$ProfileCounterDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsCount = freezed,
    Object? refereesCount = freezed,
    Object? postCount = freezed,
  }) {
    return _then(_$ProfileCounterDataImpl(
      friendsCount: freezed == friendsCount
          ? _value.friendsCount
          : friendsCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      refereesCount: freezed == refereesCount
          ? _value.refereesCount
          : refereesCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      postCount: freezed == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$ProfileCounterDataImpl implements _ProfileCounterData {
  const _$ProfileCounterDataImpl(
      {this.friendsCount, this.refereesCount, this.postCount});

  factory _$ProfileCounterDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileCounterDataImplFromJson(json);

  @override
  final dynamic friendsCount;
  @override
  final dynamic refereesCount;
  @override
  final dynamic postCount;

  @override
  String toString() {
    return 'ProfileCounterData(friendsCount: $friendsCount, refereesCount: $refereesCount, postCount: $postCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileCounterDataImpl &&
            const DeepCollectionEquality()
                .equals(other.friendsCount, friendsCount) &&
            const DeepCollectionEquality()
                .equals(other.refereesCount, refereesCount) &&
            const DeepCollectionEquality().equals(other.postCount, postCount));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(friendsCount),
      const DeepCollectionEquality().hash(refereesCount),
      const DeepCollectionEquality().hash(postCount));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileCounterDataImplCopyWith<_$ProfileCounterDataImpl> get copyWith =>
      __$$ProfileCounterDataImplCopyWithImpl<_$ProfileCounterDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileCounterDataImplToJson(
      this,
    );
  }
}

abstract class _ProfileCounterData implements ProfileCounterData {
  const factory _ProfileCounterData(
      {final dynamic friendsCount,
      final dynamic refereesCount,
      final dynamic postCount}) = _$ProfileCounterDataImpl;

  factory _ProfileCounterData.fromJson(Map<String, dynamic> json) =
      _$ProfileCounterDataImpl.fromJson;

  @override
  dynamic get friendsCount;
  @override
  dynamic get refereesCount;
  @override
  dynamic get postCount;
  @override
  @JsonKey(ignore: true)
  _$$ProfileCounterDataImplCopyWith<_$ProfileCounterDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionData _$SubscriptionDataFromJson(Map<String, dynamic> json) {
  return _SubscriptionData.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionData {
  dynamic get subscriptionId => throw _privateConstructorUsedError;
  dynamic get name => throw _privateConstructorUsedError;
  dynamic get amount => throw _privateConstructorUsedError;
  dynamic get startdate => throw _privateConstructorUsedError;
  dynamic get enddate => throw _privateConstructorUsedError;
  dynamic get status => throw _privateConstructorUsedError;
  dynamic get paymentmethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionDataCopyWith<SubscriptionData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionDataCopyWith<$Res> {
  factory $SubscriptionDataCopyWith(
          SubscriptionData value, $Res Function(SubscriptionData) then) =
      _$SubscriptionDataCopyWithImpl<$Res, SubscriptionData>;
  @useResult
  $Res call(
      {dynamic subscriptionId,
      dynamic name,
      dynamic amount,
      dynamic startdate,
      dynamic enddate,
      dynamic status,
      dynamic paymentmethod});
}

/// @nodoc
class _$SubscriptionDataCopyWithImpl<$Res, $Val extends SubscriptionData>
    implements $SubscriptionDataCopyWith<$Res> {
  _$SubscriptionDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionId = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? startdate = freezed,
    Object? enddate = freezed,
    Object? status = freezed,
    Object? paymentmethod = freezed,
  }) {
    return _then(_value.copyWith(
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startdate: freezed == startdate
          ? _value.startdate
          : startdate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      enddate: freezed == enddate
          ? _value.enddate
          : enddate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentmethod: freezed == paymentmethod
          ? _value.paymentmethod
          : paymentmethod // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionDataImplCopyWith<$Res>
    implements $SubscriptionDataCopyWith<$Res> {
  factory _$$SubscriptionDataImplCopyWith(_$SubscriptionDataImpl value,
          $Res Function(_$SubscriptionDataImpl) then) =
      __$$SubscriptionDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic subscriptionId,
      dynamic name,
      dynamic amount,
      dynamic startdate,
      dynamic enddate,
      dynamic status,
      dynamic paymentmethod});
}

/// @nodoc
class __$$SubscriptionDataImplCopyWithImpl<$Res>
    extends _$SubscriptionDataCopyWithImpl<$Res, _$SubscriptionDataImpl>
    implements _$$SubscriptionDataImplCopyWith<$Res> {
  __$$SubscriptionDataImplCopyWithImpl(_$SubscriptionDataImpl _value,
      $Res Function(_$SubscriptionDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionId = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? startdate = freezed,
    Object? enddate = freezed,
    Object? status = freezed,
    Object? paymentmethod = freezed,
  }) {
    return _then(_$SubscriptionDataImpl(
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      name: freezed == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as dynamic,
      amount: freezed == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as dynamic,
      startdate: freezed == startdate
          ? _value.startdate
          : startdate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      enddate: freezed == enddate
          ? _value.enddate
          : enddate // ignore: cast_nullable_to_non_nullable
              as dynamic,
      status: freezed == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as dynamic,
      paymentmethod: freezed == paymentmethod
          ? _value.paymentmethod
          : paymentmethod // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$SubscriptionDataImpl implements _SubscriptionData {
  const _$SubscriptionDataImpl(
      {this.subscriptionId,
      this.name,
      this.amount,
      this.startdate,
      this.enddate,
      this.status,
      this.paymentmethod});

  factory _$SubscriptionDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionDataImplFromJson(json);

  @override
  final dynamic subscriptionId;
  @override
  final dynamic name;
  @override
  final dynamic amount;
  @override
  final dynamic startdate;
  @override
  final dynamic enddate;
  @override
  final dynamic status;
  @override
  final dynamic paymentmethod;

  @override
  String toString() {
    return 'SubscriptionData(subscriptionId: $subscriptionId, name: $name, amount: $amount, startdate: $startdate, enddate: $enddate, status: $status, paymentmethod: $paymentmethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionDataImpl &&
            const DeepCollectionEquality()
                .equals(other.subscriptionId, subscriptionId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.startdate, startdate) &&
            const DeepCollectionEquality().equals(other.enddate, enddate) &&
            const DeepCollectionEquality().equals(other.status, status) &&
            const DeepCollectionEquality()
                .equals(other.paymentmethod, paymentmethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(subscriptionId),
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(startdate),
      const DeepCollectionEquality().hash(enddate),
      const DeepCollectionEquality().hash(status),
      const DeepCollectionEquality().hash(paymentmethod));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionDataImplCopyWith<_$SubscriptionDataImpl> get copyWith =>
      __$$SubscriptionDataImplCopyWithImpl<_$SubscriptionDataImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionDataImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionData implements SubscriptionData {
  const factory _SubscriptionData(
      {final dynamic subscriptionId,
      final dynamic name,
      final dynamic amount,
      final dynamic startdate,
      final dynamic enddate,
      final dynamic status,
      final dynamic paymentmethod}) = _$SubscriptionDataImpl;

  factory _SubscriptionData.fromJson(Map<String, dynamic> json) =
      _$SubscriptionDataImpl.fromJson;

  @override
  dynamic get subscriptionId;
  @override
  dynamic get name;
  @override
  dynamic get amount;
  @override
  dynamic get startdate;
  @override
  dynamic get enddate;
  @override
  dynamic get status;
  @override
  dynamic get paymentmethod;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionDataImplCopyWith<_$SubscriptionDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletData _$WalletDataFromJson(Map<String, dynamic> json) {
  return _WalletData.fromJson(json);
}

/// @nodoc
mixin _$WalletData {
  dynamic get availableBalance => throw _privateConstructorUsedError;
  dynamic get lastTransactionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletDataCopyWith<WalletData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletDataCopyWith<$Res> {
  factory $WalletDataCopyWith(
          WalletData value, $Res Function(WalletData) then) =
      _$WalletDataCopyWithImpl<$Res, WalletData>;
  @useResult
  $Res call({dynamic availableBalance, dynamic lastTransactionDate});
}

/// @nodoc
class _$WalletDataCopyWithImpl<$Res, $Val extends WalletData>
    implements $WalletDataCopyWith<$Res> {
  _$WalletDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_value.copyWith(
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletDataImplCopyWith<$Res>
    implements $WalletDataCopyWith<$Res> {
  factory _$$WalletDataImplCopyWith(
          _$WalletDataImpl value, $Res Function(_$WalletDataImpl) then) =
      __$$WalletDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic availableBalance, dynamic lastTransactionDate});
}

/// @nodoc
class __$$WalletDataImplCopyWithImpl<$Res>
    extends _$WalletDataCopyWithImpl<$Res, _$WalletDataImpl>
    implements _$$WalletDataImplCopyWith<$Res> {
  __$$WalletDataImplCopyWithImpl(
      _$WalletDataImpl _value, $Res Function(_$WalletDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_$WalletDataImpl(
      availableBalance: freezed == availableBalance
          ? _value.availableBalance
          : availableBalance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastTransactionDate: freezed == lastTransactionDate
          ? _value.lastTransactionDate
          : lastTransactionDate // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$WalletDataImpl implements _WalletData {
  const _$WalletDataImpl({this.availableBalance, this.lastTransactionDate});

  factory _$WalletDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletDataImplFromJson(json);

  @override
  final dynamic availableBalance;
  @override
  final dynamic lastTransactionDate;

  @override
  String toString() {
    return 'WalletData(availableBalance: $availableBalance, lastTransactionDate: $lastTransactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletDataImpl &&
            const DeepCollectionEquality()
                .equals(other.availableBalance, availableBalance) &&
            const DeepCollectionEquality()
                .equals(other.lastTransactionDate, lastTransactionDate));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(availableBalance),
      const DeepCollectionEquality().hash(lastTransactionDate));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletDataImplCopyWith<_$WalletDataImpl> get copyWith =>
      __$$WalletDataImplCopyWithImpl<_$WalletDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletDataImplToJson(
      this,
    );
  }
}

abstract class _WalletData implements WalletData {
  const factory _WalletData(
      {final dynamic availableBalance,
      final dynamic lastTransactionDate}) = _$WalletDataImpl;

  factory _WalletData.fromJson(Map<String, dynamic> json) =
      _$WalletDataImpl.fromJson;

  @override
  dynamic get availableBalance;
  @override
  dynamic get lastTransactionDate;
  @override
  @JsonKey(ignore: true)
  _$$WalletDataImplCopyWith<_$WalletDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterestData _$InterestDataFromJson(Map<String, dynamic> json) {
  return _InterestData.fromJson(json);
}

/// @nodoc
mixin _$InterestData {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterestDataCopyWith<InterestData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestDataCopyWith<$Res> {
  factory $InterestDataCopyWith(
          InterestData value, $Res Function(InterestData) then) =
      _$InterestDataCopyWithImpl<$Res, InterestData>;
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class _$InterestDataCopyWithImpl<$Res, $Val extends InterestData>
    implements $InterestDataCopyWith<$Res> {
  _$InterestDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$InterestDataImplCopyWith<$Res>
    implements $InterestDataCopyWith<$Res> {
  factory _$$InterestDataImplCopyWith(
          _$InterestDataImpl value, $Res Function(_$InterestDataImpl) then) =
      __$$InterestDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class __$$InterestDataImplCopyWithImpl<$Res>
    extends _$InterestDataCopyWithImpl<$Res, _$InterestDataImpl>
    implements _$$InterestDataImplCopyWith<$Res> {
  __$$InterestDataImplCopyWithImpl(
      _$InterestDataImpl _value, $Res Function(_$InterestDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$InterestDataImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      title: freezed == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$InterestDataImpl implements _InterestData {
  const _$InterestDataImpl({this.id, this.title});

  factory _$InterestDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterestDataImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic title;

  @override
  String toString() {
    return 'InterestData(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestDataImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.title, title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(title));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$InterestDataImplCopyWith<_$InterestDataImpl> get copyWith =>
      __$$InterestDataImplCopyWithImpl<_$InterestDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterestDataImplToJson(
      this,
    );
  }
}

abstract class _InterestData implements InterestData {
  const factory _InterestData({final dynamic id, final dynamic title}) =
      _$InterestDataImpl;

  factory _InterestData.fromJson(Map<String, dynamic> json) =
      _$InterestDataImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get title;
  @override
  @JsonKey(ignore: true)
  _$$InterestDataImplCopyWith<_$InterestDataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankAccountDetailData _$BankAccountDetailDataFromJson(
    Map<String, dynamic> json) {
  return _BankAccountDetailData.fromJson(json);
}

/// @nodoc
mixin _$BankAccountDetailData {
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get firstName => throw _privateConstructorUsedError;
  dynamic get lastName => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get payOutType => throw _privateConstructorUsedError;
  dynamic get bankId => throw _privateConstructorUsedError;
  dynamic get bankName => throw _privateConstructorUsedError;
  dynamic get bankCode => throw _privateConstructorUsedError;
  dynamic get branchCode => throw _privateConstructorUsedError;
  dynamic get accountNumber => throw _privateConstructorUsedError;
  dynamic get accountCurrency => throw _privateConstructorUsedError;
  dynamic get routingNumber => throw _privateConstructorUsedError;
  dynamic get swiftCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BankAccountDetailDataCopyWith<BankAccountDetailData> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountDetailDataCopyWith<$Res> {
  factory $BankAccountDetailDataCopyWith(BankAccountDetailData value,
          $Res Function(BankAccountDetailData) then) =
      _$BankAccountDetailDataCopyWithImpl<$Res, BankAccountDetailData>;
  @useResult
  $Res call(
      {dynamic userId,
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
      dynamic swiftCode});
}

/// @nodoc
class _$BankAccountDetailDataCopyWithImpl<$Res,
        $Val extends BankAccountDetailData>
    implements $BankAccountDetailDataCopyWith<$Res> {
  _$BankAccountDetailDataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? country = freezed,
    Object? payOutType = freezed,
    Object? bankId = freezed,
    Object? bankName = freezed,
    Object? bankCode = freezed,
    Object? branchCode = freezed,
    Object? accountNumber = freezed,
    Object? accountCurrency = freezed,
    Object? routingNumber = freezed,
    Object? swiftCode = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      payOutType: freezed == payOutType
          ? _value.payOutType
          : payOutType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      branchCode: freezed == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountCurrency: freezed == accountCurrency
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as dynamic,
      routingNumber: freezed == routingNumber
          ? _value.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      swiftCode: freezed == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BankAccountDetailDataImplCopyWith<$Res>
    implements $BankAccountDetailDataCopyWith<$Res> {
  factory _$$BankAccountDetailDataImplCopyWith(
          _$BankAccountDetailDataImpl value,
          $Res Function(_$BankAccountDetailDataImpl) then) =
      __$$BankAccountDetailDataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic userId,
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
      dynamic swiftCode});
}

/// @nodoc
class __$$BankAccountDetailDataImplCopyWithImpl<$Res>
    extends _$BankAccountDetailDataCopyWithImpl<$Res,
        _$BankAccountDetailDataImpl>
    implements _$$BankAccountDetailDataImplCopyWith<$Res> {
  __$$BankAccountDetailDataImplCopyWithImpl(_$BankAccountDetailDataImpl _value,
      $Res Function(_$BankAccountDetailDataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? country = freezed,
    Object? payOutType = freezed,
    Object? bankId = freezed,
    Object? bankName = freezed,
    Object? bankCode = freezed,
    Object? branchCode = freezed,
    Object? accountNumber = freezed,
    Object? accountCurrency = freezed,
    Object? routingNumber = freezed,
    Object? swiftCode = freezed,
  }) {
    return _then(_$BankAccountDetailDataImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      firstName: freezed == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      lastName: freezed == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      payOutType: freezed == payOutType
          ? _value.payOutType
          : payOutType // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bankName: freezed == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as dynamic,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      branchCode: freezed == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      accountCurrency: freezed == accountCurrency
          ? _value.accountCurrency
          : accountCurrency // ignore: cast_nullable_to_non_nullable
              as dynamic,
      routingNumber: freezed == routingNumber
          ? _value.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as dynamic,
      swiftCode: freezed == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$BankAccountDetailDataImpl implements _BankAccountDetailData {
  const _$BankAccountDetailDataImpl(
      {this.userId,
      this.firstName,
      this.lastName,
      this.country,
      this.payOutType,
      this.bankId,
      this.bankName,
      this.bankCode,
      this.branchCode,
      this.accountNumber,
      this.accountCurrency,
      this.routingNumber,
      this.swiftCode});

  factory _$BankAccountDetailDataImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountDetailDataImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic firstName;
  @override
  final dynamic lastName;
  @override
  final dynamic country;
  @override
  final dynamic payOutType;
  @override
  final dynamic bankId;
  @override
  final dynamic bankName;
  @override
  final dynamic bankCode;
  @override
  final dynamic branchCode;
  @override
  final dynamic accountNumber;
  @override
  final dynamic accountCurrency;
  @override
  final dynamic routingNumber;
  @override
  final dynamic swiftCode;

  @override
  String toString() {
    return 'BankAccountDetailData(userId: $userId, firstName: $firstName, lastName: $lastName, country: $country, payOutType: $payOutType, bankId: $bankId, bankName: $bankName, bankCode: $bankCode, branchCode: $branchCode, accountNumber: $accountNumber, accountCurrency: $accountCurrency, routingNumber: $routingNumber, swiftCode: $swiftCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountDetailDataImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.firstName, firstName) &&
            const DeepCollectionEquality().equals(other.lastName, lastName) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality()
                .equals(other.payOutType, payOutType) &&
            const DeepCollectionEquality().equals(other.bankId, bankId) &&
            const DeepCollectionEquality().equals(other.bankName, bankName) &&
            const DeepCollectionEquality().equals(other.bankCode, bankCode) &&
            const DeepCollectionEquality()
                .equals(other.branchCode, branchCode) &&
            const DeepCollectionEquality()
                .equals(other.accountNumber, accountNumber) &&
            const DeepCollectionEquality()
                .equals(other.accountCurrency, accountCurrency) &&
            const DeepCollectionEquality()
                .equals(other.routingNumber, routingNumber) &&
            const DeepCollectionEquality().equals(other.swiftCode, swiftCode));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(firstName),
      const DeepCollectionEquality().hash(lastName),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(payOutType),
      const DeepCollectionEquality().hash(bankId),
      const DeepCollectionEquality().hash(bankName),
      const DeepCollectionEquality().hash(bankCode),
      const DeepCollectionEquality().hash(branchCode),
      const DeepCollectionEquality().hash(accountNumber),
      const DeepCollectionEquality().hash(accountCurrency),
      const DeepCollectionEquality().hash(routingNumber),
      const DeepCollectionEquality().hash(swiftCode));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BankAccountDetailDataImplCopyWith<_$BankAccountDetailDataImpl>
      get copyWith => __$$BankAccountDetailDataImplCopyWithImpl<
          _$BankAccountDetailDataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountDetailDataImplToJson(
      this,
    );
  }
}

abstract class _BankAccountDetailData implements BankAccountDetailData {
  const factory _BankAccountDetailData(
      {final dynamic userId,
      final dynamic firstName,
      final dynamic lastName,
      final dynamic country,
      final dynamic payOutType,
      final dynamic bankId,
      final dynamic bankName,
      final dynamic bankCode,
      final dynamic branchCode,
      final dynamic accountNumber,
      final dynamic accountCurrency,
      final dynamic routingNumber,
      final dynamic swiftCode}) = _$BankAccountDetailDataImpl;

  factory _BankAccountDetailData.fromJson(Map<String, dynamic> json) =
      _$BankAccountDetailDataImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get firstName;
  @override
  dynamic get lastName;
  @override
  dynamic get country;
  @override
  dynamic get payOutType;
  @override
  dynamic get bankId;
  @override
  dynamic get bankName;
  @override
  dynamic get bankCode;
  @override
  dynamic get branchCode;
  @override
  dynamic get accountNumber;
  @override
  dynamic get accountCurrency;
  @override
  dynamic get routingNumber;
  @override
  dynamic get swiftCode;
  @override
  @JsonKey(ignore: true)
  _$$BankAccountDetailDataImplCopyWith<_$BankAccountDetailDataImpl>
      get copyWith => throw _privateConstructorUsedError;
}
