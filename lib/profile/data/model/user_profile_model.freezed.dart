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

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) {
  return _UserProfileModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileModel {
  UserProfileDataModel get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) then) =
      _$UserProfileModelCopyWithImpl<$Res, UserProfileModel>;
  @useResult
  $Res call({UserProfileDataModel data});

  $UserProfileDataModelCopyWith<$Res> get data;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res, $Val extends UserProfileModel>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res> get data {
    return $UserProfileDataModelCopyWith<$Res>(_value.data, (value) {
      return _then(_value.copyWith(data: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileModelImplCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$$UserProfileModelImplCopyWith(_$UserProfileModelImpl value,
          $Res Function(_$UserProfileModelImpl) then) =
      __$$UserProfileModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({UserProfileDataModel data});

  @override
  $UserProfileDataModelCopyWith<$Res> get data;
}

/// @nodoc
class __$$UserProfileModelImplCopyWithImpl<$Res>
    extends _$UserProfileModelCopyWithImpl<$Res, _$UserProfileModelImpl>
    implements _$$UserProfileModelImplCopyWith<$Res> {
  __$$UserProfileModelImplCopyWithImpl(_$UserProfileModelImpl _value,
      $Res Function(_$UserProfileModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UserProfileModelImpl(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserProfileModelImpl implements _UserProfileModel {
  _$UserProfileModelImpl({required this.data});

  factory _$UserProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileModelImplFromJson(json);

  @override
  final UserProfileDataModel data;

  @override
  String toString() {
    return 'UserProfileModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileModelImpl &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      __$$UserProfileModelImplCopyWithImpl<_$UserProfileModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileModel implements UserProfileModel {
  factory _UserProfileModel({required final UserProfileDataModel data}) =
      _$UserProfileModelImpl;

  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileModelImpl.fromJson;

  @override
  UserProfileDataModel get data;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileModelImplCopyWith<_$UserProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfileDataModel _$UserProfileDataModelFromJson(Map<String, dynamic> json) {
  return _UserProfileDataModel.fromJson(json);
}

/// @nodoc
mixin _$UserProfileDataModel {
  UserModel? get user => throw _privateConstructorUsedError;
  ProfileModel? get profile => throw _privateConstructorUsedError;
  ResidentialAddressModel? get residentialAddress =>
      throw _privateConstructorUsedError;
  OriginAddressModel? get originAddress => throw _privateConstructorUsedError;
  LocationModel? get location => throw _privateConstructorUsedError;
  ProfileCounterModel? get profileCounters =>
      throw _privateConstructorUsedError;
  SubscriptionModel? get subscription => throw _privateConstructorUsedError;
  WalletModel? get wallet => throw _privateConstructorUsedError;
  List<InterestModel>? get interests => throw _privateConstructorUsedError;
  BankAccountDetailModel? get bankAccountDetails =>
      throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserProfileDataModelCopyWith<UserProfileDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileDataModelCopyWith<$Res> {
  factory $UserProfileDataModelCopyWith(UserProfileDataModel value,
          $Res Function(UserProfileDataModel) then) =
      _$UserProfileDataModelCopyWithImpl<$Res, UserProfileDataModel>;
  @useResult
  $Res call(
      {UserModel? user,
      ProfileModel? profile,
      ResidentialAddressModel? residentialAddress,
      OriginAddressModel? originAddress,
      LocationModel? location,
      ProfileCounterModel? profileCounters,
      SubscriptionModel? subscription,
      WalletModel? wallet,
      List<InterestModel>? interests,
      BankAccountDetailModel? bankAccountDetails});

  $UserModelCopyWith<$Res>? get user;
  $ProfileModelCopyWith<$Res>? get profile;
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress;
  $OriginAddressModelCopyWith<$Res>? get originAddress;
  $LocationModelCopyWith<$Res>? get location;
  $ProfileCounterModelCopyWith<$Res>? get profileCounters;
  $SubscriptionModelCopyWith<$Res>? get subscription;
  $WalletModelCopyWith<$Res>? get wallet;
  $BankAccountDetailModelCopyWith<$Res>? get bankAccountDetails;
}

/// @nodoc
class _$UserProfileDataModelCopyWithImpl<$Res,
        $Val extends UserProfileDataModel>
    implements $UserProfileDataModelCopyWith<$Res> {
  _$UserProfileDataModelCopyWithImpl(this._value, this._then);

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
              as UserModel?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      residentialAddress: freezed == residentialAddress
          ? _value.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressModel?,
      originAddress: freezed == originAddress
          ? _value.originAddress
          : originAddress // ignore: cast_nullable_to_non_nullable
              as OriginAddressModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      profileCounters: freezed == profileCounters
          ? _value.profileCounters
          : profileCounters // ignore: cast_nullable_to_non_nullable
              as ProfileCounterModel?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
      interests: freezed == interests
          ? _value.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
      bankAccountDetails: freezed == bankAccountDetails
          ? _value.bankAccountDetails
          : bankAccountDetails // ignore: cast_nullable_to_non_nullable
              as BankAccountDetailModel?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_value.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_value.user!, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get profile {
    if (_value.profile == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_value.profile!, (value) {
      return _then(_value.copyWith(profile: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress {
    if (_value.residentialAddress == null) {
      return null;
    }

    return $ResidentialAddressModelCopyWith<$Res>(_value.residentialAddress!,
        (value) {
      return _then(_value.copyWith(residentialAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $OriginAddressModelCopyWith<$Res>? get originAddress {
    if (_value.originAddress == null) {
      return null;
    }

    return $OriginAddressModelCopyWith<$Res>(_value.originAddress!, (value) {
      return _then(_value.copyWith(originAddress: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_value.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_value.location!, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ProfileCounterModelCopyWith<$Res>? get profileCounters {
    if (_value.profileCounters == null) {
      return null;
    }

    return $ProfileCounterModelCopyWith<$Res>(_value.profileCounters!, (value) {
      return _then(_value.copyWith(profileCounters: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<$Res>? get subscription {
    if (_value.subscription == null) {
      return null;
    }

    return $SubscriptionModelCopyWith<$Res>(_value.subscription!, (value) {
      return _then(_value.copyWith(subscription: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $WalletModelCopyWith<$Res>? get wallet {
    if (_value.wallet == null) {
      return null;
    }

    return $WalletModelCopyWith<$Res>(_value.wallet!, (value) {
      return _then(_value.copyWith(wallet: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $BankAccountDetailModelCopyWith<$Res>? get bankAccountDetails {
    if (_value.bankAccountDetails == null) {
      return null;
    }

    return $BankAccountDetailModelCopyWith<$Res>(_value.bankAccountDetails!,
        (value) {
      return _then(_value.copyWith(bankAccountDetails: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileDataModelImplCopyWith<$Res>
    implements $UserProfileDataModelCopyWith<$Res> {
  factory _$$UserProfileDataModelImplCopyWith(_$UserProfileDataModelImpl value,
          $Res Function(_$UserProfileDataModelImpl) then) =
      __$$UserProfileDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      ProfileModel? profile,
      ResidentialAddressModel? residentialAddress,
      OriginAddressModel? originAddress,
      LocationModel? location,
      ProfileCounterModel? profileCounters,
      SubscriptionModel? subscription,
      WalletModel? wallet,
      List<InterestModel>? interests,
      BankAccountDetailModel? bankAccountDetails});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $ProfileModelCopyWith<$Res>? get profile;
  @override
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress;
  @override
  $OriginAddressModelCopyWith<$Res>? get originAddress;
  @override
  $LocationModelCopyWith<$Res>? get location;
  @override
  $ProfileCounterModelCopyWith<$Res>? get profileCounters;
  @override
  $SubscriptionModelCopyWith<$Res>? get subscription;
  @override
  $WalletModelCopyWith<$Res>? get wallet;
  @override
  $BankAccountDetailModelCopyWith<$Res>? get bankAccountDetails;
}

/// @nodoc
class __$$UserProfileDataModelImplCopyWithImpl<$Res>
    extends _$UserProfileDataModelCopyWithImpl<$Res, _$UserProfileDataModelImpl>
    implements _$$UserProfileDataModelImplCopyWith<$Res> {
  __$$UserProfileDataModelImplCopyWithImpl(_$UserProfileDataModelImpl _value,
      $Res Function(_$UserProfileDataModelImpl) _then)
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
    return _then(_$UserProfileDataModelImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      profile: freezed == profile
          ? _value.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      residentialAddress: freezed == residentialAddress
          ? _value.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressModel?,
      originAddress: freezed == originAddress
          ? _value.originAddress
          : originAddress // ignore: cast_nullable_to_non_nullable
              as OriginAddressModel?,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
      profileCounters: freezed == profileCounters
          ? _value.profileCounters
          : profileCounters // ignore: cast_nullable_to_non_nullable
              as ProfileCounterModel?,
      subscription: freezed == subscription
          ? _value.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel?,
      wallet: freezed == wallet
          ? _value.wallet
          : wallet // ignore: cast_nullable_to_non_nullable
              as WalletModel?,
      interests: freezed == interests
          ? _value._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
      bankAccountDetails: freezed == bankAccountDetails
          ? _value.bankAccountDetails
          : bankAccountDetails // ignore: cast_nullable_to_non_nullable
              as BankAccountDetailModel?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$UserProfileDataModelImpl implements _UserProfileDataModel {
  _$UserProfileDataModelImpl(
      {this.user,
      this.profile,
      this.residentialAddress,
      this.originAddress,
      this.location,
      this.profileCounters,
      this.subscription,
      this.wallet,
      final List<InterestModel>? interests,
      this.bankAccountDetails})
      : _interests = interests;

  factory _$UserProfileDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileDataModelImplFromJson(json);

  @override
  final UserModel? user;
  @override
  final ProfileModel? profile;
  @override
  final ResidentialAddressModel? residentialAddress;
  @override
  final OriginAddressModel? originAddress;
  @override
  final LocationModel? location;
  @override
  final ProfileCounterModel? profileCounters;
  @override
  final SubscriptionModel? subscription;
  @override
  final WalletModel? wallet;
  final List<InterestModel>? _interests;
  @override
  List<InterestModel>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final BankAccountDetailModel? bankAccountDetails;

  @override
  String toString() {
    return 'UserProfileDataModel(user: $user, profile: $profile, residentialAddress: $residentialAddress, originAddress: $originAddress, location: $location, profileCounters: $profileCounters, subscription: $subscription, wallet: $wallet, interests: $interests, bankAccountDetails: $bankAccountDetails)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileDataModelImpl &&
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
  _$$UserProfileDataModelImplCopyWith<_$UserProfileDataModelImpl>
      get copyWith =>
          __$$UserProfileDataModelImplCopyWithImpl<_$UserProfileDataModelImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileDataModelImplToJson(
      this,
    );
  }
}

abstract class _UserProfileDataModel implements UserProfileDataModel {
  factory _UserProfileDataModel(
          {final UserModel? user,
          final ProfileModel? profile,
          final ResidentialAddressModel? residentialAddress,
          final OriginAddressModel? originAddress,
          final LocationModel? location,
          final ProfileCounterModel? profileCounters,
          final SubscriptionModel? subscription,
          final WalletModel? wallet,
          final List<InterestModel>? interests,
          final BankAccountDetailModel? bankAccountDetails}) =
      _$UserProfileDataModelImpl;

  factory _UserProfileDataModel.fromJson(Map<String, dynamic> json) =
      _$UserProfileDataModelImpl.fromJson;

  @override
  UserModel? get user;
  @override
  ProfileModel? get profile;
  @override
  ResidentialAddressModel? get residentialAddress;
  @override
  OriginAddressModel? get originAddress;
  @override
  LocationModel? get location;
  @override
  ProfileCounterModel? get profileCounters;
  @override
  SubscriptionModel? get subscription;
  @override
  WalletModel? get wallet;
  @override
  List<InterestModel>? get interests;
  @override
  BankAccountDetailModel? get bankAccountDetails;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileDataModelImplCopyWith<_$UserProfileDataModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
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
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
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
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

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
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
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
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
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
    return _then(_$UserModelImpl(
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
class _$UserModelImpl implements _UserModel {
  _$UserModelImpl(
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

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

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
    return 'UserModel(userId: $userId, isFullyVerified: $isFullyVerified, userName: $userName, rolesCSV: $rolesCSV, createdDate: $createdDate, lastSeenDate: $lastSeenDate, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, phoneCountryCode: $phoneCountryCode, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
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
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  factory _UserModel(
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
      final dynamic phoneNumberConfirmed}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

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
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileModel _$ProfileModelFromJson(Map<String, dynamic> json) {
  return _ProfileModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileModel {
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
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) then) =
      _$ProfileModelCopyWithImpl<$Res, ProfileModel>;
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
class _$ProfileModelCopyWithImpl<$Res, $Val extends ProfileModel>
    implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfileModelImplCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$$ProfileModelImplCopyWith(
          _$ProfileModelImpl value, $Res Function(_$ProfileModelImpl) then) =
      __$$ProfileModelImplCopyWithImpl<$Res>;
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
class __$$ProfileModelImplCopyWithImpl<$Res>
    extends _$ProfileModelCopyWithImpl<$Res, _$ProfileModelImpl>
    implements _$$ProfileModelImplCopyWith<$Res> {
  __$$ProfileModelImplCopyWithImpl(
      _$ProfileModelImpl _value, $Res Function(_$ProfileModelImpl) _then)
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
    return _then(_$ProfileModelImpl(
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
class _$ProfileModelImpl implements _ProfileModel {
  _$ProfileModelImpl(
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

  factory _$ProfileModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileModelImplFromJson(json);

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
    return 'ProfileModel(firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, gender: $gender, languageCSV: $languageCSV, aboutMe: $aboutMe, height: $height, weight: $weight, bodyType: $bodyType, complexion: $complexion, religion: $religion, tagline: $tagline, occupation: $occupation, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileModelImpl &&
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
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      __$$ProfileModelImplCopyWithImpl<_$ProfileModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileModel implements ProfileModel {
  factory _ProfileModel(
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
      final dynamic profileStatus}) = _$ProfileModelImpl;

  factory _ProfileModel.fromJson(Map<String, dynamic> json) =
      _$ProfileModelImpl.fromJson;

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
  _$$ProfileModelImplCopyWith<_$ProfileModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ResidentialAddressModel _$ResidentialAddressModelFromJson(
    Map<String, dynamic> json) {
  return _ResidentialAddressModel.fromJson(json);
}

/// @nodoc
mixin _$ResidentialAddressModel {
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get state => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get zipCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ResidentialAddressModelCopyWith<ResidentialAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ResidentialAddressModelCopyWith<$Res> {
  factory $ResidentialAddressModelCopyWith(ResidentialAddressModel value,
          $Res Function(ResidentialAddressModel) then) =
      _$ResidentialAddressModelCopyWithImpl<$Res, ResidentialAddressModel>;
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class _$ResidentialAddressModelCopyWithImpl<$Res,
        $Val extends ResidentialAddressModel>
    implements $ResidentialAddressModelCopyWith<$Res> {
  _$ResidentialAddressModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ResidentialAddressModelImplCopyWith<$Res>
    implements $ResidentialAddressModelCopyWith<$Res> {
  factory _$$ResidentialAddressModelImplCopyWith(
          _$ResidentialAddressModelImpl value,
          $Res Function(_$ResidentialAddressModelImpl) then) =
      __$$ResidentialAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class __$$ResidentialAddressModelImplCopyWithImpl<$Res>
    extends _$ResidentialAddressModelCopyWithImpl<$Res,
        _$ResidentialAddressModelImpl>
    implements _$$ResidentialAddressModelImplCopyWith<$Res> {
  __$$ResidentialAddressModelImplCopyWithImpl(
      _$ResidentialAddressModelImpl _value,
      $Res Function(_$ResidentialAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_$ResidentialAddressModelImpl(
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
class _$ResidentialAddressModelImpl implements _ResidentialAddressModel {
  _$ResidentialAddressModelImpl(
      {this.city, this.state, this.country, this.zipCode});

  factory _$ResidentialAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ResidentialAddressModelImplFromJson(json);

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
    return 'ResidentialAddressModel(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ResidentialAddressModelImpl &&
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
  _$$ResidentialAddressModelImplCopyWith<_$ResidentialAddressModelImpl>
      get copyWith => __$$ResidentialAddressModelImplCopyWithImpl<
          _$ResidentialAddressModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ResidentialAddressModelImplToJson(
      this,
    );
  }
}

abstract class _ResidentialAddressModel implements ResidentialAddressModel {
  factory _ResidentialAddressModel(
      {final dynamic city,
      final dynamic state,
      final dynamic country,
      final dynamic zipCode}) = _$ResidentialAddressModelImpl;

  factory _ResidentialAddressModel.fromJson(Map<String, dynamic> json) =
      _$ResidentialAddressModelImpl.fromJson;

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
  _$$ResidentialAddressModelImplCopyWith<_$ResidentialAddressModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

OriginAddressModel _$OriginAddressModelFromJson(Map<String, dynamic> json) {
  return _OriginAddressModel.fromJson(json);
}

/// @nodoc
mixin _$OriginAddressModel {
  dynamic get city => throw _privateConstructorUsedError;
  dynamic get state => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get zipCode => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $OriginAddressModelCopyWith<OriginAddressModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $OriginAddressModelCopyWith<$Res> {
  factory $OriginAddressModelCopyWith(
          OriginAddressModel value, $Res Function(OriginAddressModel) then) =
      _$OriginAddressModelCopyWithImpl<$Res, OriginAddressModel>;
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class _$OriginAddressModelCopyWithImpl<$Res, $Val extends OriginAddressModel>
    implements $OriginAddressModelCopyWith<$Res> {
  _$OriginAddressModelCopyWithImpl(this._value, this._then);

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
abstract class _$$OriginAddressModelImplCopyWith<$Res>
    implements $OriginAddressModelCopyWith<$Res> {
  factory _$$OriginAddressModelImplCopyWith(_$OriginAddressModelImpl value,
          $Res Function(_$OriginAddressModelImpl) then) =
      __$$OriginAddressModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic city, dynamic state, dynamic country, dynamic zipCode});
}

/// @nodoc
class __$$OriginAddressModelImplCopyWithImpl<$Res>
    extends _$OriginAddressModelCopyWithImpl<$Res, _$OriginAddressModelImpl>
    implements _$$OriginAddressModelImplCopyWith<$Res> {
  __$$OriginAddressModelImplCopyWithImpl(_$OriginAddressModelImpl _value,
      $Res Function(_$OriginAddressModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_$OriginAddressModelImpl(
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
class _$OriginAddressModelImpl implements _OriginAddressModel {
  _$OriginAddressModelImpl({this.city, this.state, this.country, this.zipCode});

  factory _$OriginAddressModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$OriginAddressModelImplFromJson(json);

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
    return 'OriginAddressModel(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$OriginAddressModelImpl &&
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
  _$$OriginAddressModelImplCopyWith<_$OriginAddressModelImpl> get copyWith =>
      __$$OriginAddressModelImplCopyWithImpl<_$OriginAddressModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$OriginAddressModelImplToJson(
      this,
    );
  }
}

abstract class _OriginAddressModel implements OriginAddressModel {
  factory _OriginAddressModel(
      {final dynamic city,
      final dynamic state,
      final dynamic country,
      final dynamic zipCode}) = _$OriginAddressModelImpl;

  factory _OriginAddressModel.fromJson(Map<String, dynamic> json) =
      _$OriginAddressModelImpl.fromJson;

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
  _$$OriginAddressModelImplCopyWith<_$OriginAddressModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) {
  return _LocationModel.fromJson(json);
}

/// @nodoc
mixin _$LocationModel {
  dynamic get latitude => throw _privateConstructorUsedError;
  dynamic get longitude => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LocationModelCopyWith<LocationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) then) =
      _$LocationModelCopyWithImpl<$Res, LocationModel>;
  @useResult
  $Res call({dynamic latitude, dynamic longitude});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res, $Val extends LocationModel>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._value, this._then);

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
abstract class _$$LocationModelImplCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$$LocationModelImplCopyWith(
          _$LocationModelImpl value, $Res Function(_$LocationModelImpl) then) =
      __$$LocationModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic latitude, dynamic longitude});
}

/// @nodoc
class __$$LocationModelImplCopyWithImpl<$Res>
    extends _$LocationModelCopyWithImpl<$Res, _$LocationModelImpl>
    implements _$$LocationModelImplCopyWith<$Res> {
  __$$LocationModelImplCopyWithImpl(
      _$LocationModelImpl _value, $Res Function(_$LocationModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_$LocationModelImpl(
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
class _$LocationModelImpl implements _LocationModel {
  _$LocationModelImpl({this.latitude, this.longitude});

  factory _$LocationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$LocationModelImplFromJson(json);

  @override
  final dynamic latitude;
  @override
  final dynamic longitude;

  @override
  String toString() {
    return 'LocationModel(latitude: $latitude, longitude: $longitude)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LocationModelImpl &&
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
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      __$$LocationModelImplCopyWithImpl<_$LocationModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LocationModelImplToJson(
      this,
    );
  }
}

abstract class _LocationModel implements LocationModel {
  factory _LocationModel({final dynamic latitude, final dynamic longitude}) =
      _$LocationModelImpl;

  factory _LocationModel.fromJson(Map<String, dynamic> json) =
      _$LocationModelImpl.fromJson;

  @override
  dynamic get latitude;
  @override
  dynamic get longitude;
  @override
  @JsonKey(ignore: true)
  _$$LocationModelImplCopyWith<_$LocationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileCounterModel _$ProfileCounterModelFromJson(Map<String, dynamic> json) {
  return _ProfileCounterModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileCounterModel {
  dynamic get friendsCount => throw _privateConstructorUsedError;
  dynamic get refereesCount => throw _privateConstructorUsedError;
  dynamic get postCount => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ProfileCounterModelCopyWith<ProfileCounterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCounterModelCopyWith<$Res> {
  factory $ProfileCounterModelCopyWith(
          ProfileCounterModel value, $Res Function(ProfileCounterModel) then) =
      _$ProfileCounterModelCopyWithImpl<$Res, ProfileCounterModel>;
  @useResult
  $Res call({dynamic friendsCount, dynamic refereesCount, dynamic postCount});
}

/// @nodoc
class _$ProfileCounterModelCopyWithImpl<$Res, $Val extends ProfileCounterModel>
    implements $ProfileCounterModelCopyWith<$Res> {
  _$ProfileCounterModelCopyWithImpl(this._value, this._then);

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
abstract class _$$ProfileCounterModelImplCopyWith<$Res>
    implements $ProfileCounterModelCopyWith<$Res> {
  factory _$$ProfileCounterModelImplCopyWith(_$ProfileCounterModelImpl value,
          $Res Function(_$ProfileCounterModelImpl) then) =
      __$$ProfileCounterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic friendsCount, dynamic refereesCount, dynamic postCount});
}

/// @nodoc
class __$$ProfileCounterModelImplCopyWithImpl<$Res>
    extends _$ProfileCounterModelCopyWithImpl<$Res, _$ProfileCounterModelImpl>
    implements _$$ProfileCounterModelImplCopyWith<$Res> {
  __$$ProfileCounterModelImplCopyWithImpl(_$ProfileCounterModelImpl _value,
      $Res Function(_$ProfileCounterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsCount = freezed,
    Object? refereesCount = freezed,
    Object? postCount = freezed,
  }) {
    return _then(_$ProfileCounterModelImpl(
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
class _$ProfileCounterModelImpl implements _ProfileCounterModel {
  _$ProfileCounterModelImpl(
      {this.friendsCount, this.refereesCount, this.postCount});

  factory _$ProfileCounterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileCounterModelImplFromJson(json);

  @override
  final dynamic friendsCount;
  @override
  final dynamic refereesCount;
  @override
  final dynamic postCount;

  @override
  String toString() {
    return 'ProfileCounterModel(friendsCount: $friendsCount, refereesCount: $refereesCount, postCount: $postCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileCounterModelImpl &&
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
  _$$ProfileCounterModelImplCopyWith<_$ProfileCounterModelImpl> get copyWith =>
      __$$ProfileCounterModelImplCopyWithImpl<_$ProfileCounterModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileCounterModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileCounterModel implements ProfileCounterModel {
  factory _ProfileCounterModel(
      {final dynamic friendsCount,
      final dynamic refereesCount,
      final dynamic postCount}) = _$ProfileCounterModelImpl;

  factory _ProfileCounterModel.fromJson(Map<String, dynamic> json) =
      _$ProfileCounterModelImpl.fromJson;

  @override
  dynamic get friendsCount;
  @override
  dynamic get refereesCount;
  @override
  dynamic get postCount;
  @override
  @JsonKey(ignore: true)
  _$$ProfileCounterModelImplCopyWith<_$ProfileCounterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SubscriptionModel _$SubscriptionModelFromJson(Map<String, dynamic> json) {
  return _SubscriptionModel.fromJson(json);
}

/// @nodoc
mixin _$SubscriptionModel {
  SubscriptionType? get subscriptionId => throw _privateConstructorUsedError;
  dynamic get name => throw _privateConstructorUsedError;
  dynamic get amount => throw _privateConstructorUsedError;
  dynamic get startdate => throw _privateConstructorUsedError;
  dynamic get enddate => throw _privateConstructorUsedError;
  SubscriptionStatus? get status => throw _privateConstructorUsedError;
  dynamic get paymentmethod => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) then) =
      _$SubscriptionModelCopyWithImpl<$Res, SubscriptionModel>;
  @useResult
  $Res call(
      {SubscriptionType? subscriptionId,
      dynamic name,
      dynamic amount,
      dynamic startdate,
      dynamic enddate,
      SubscriptionStatus? status,
      dynamic paymentmethod});
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res, $Val extends SubscriptionModel>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._value, this._then);

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
              as SubscriptionType?,
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
              as SubscriptionStatus?,
      paymentmethod: freezed == paymentmethod
          ? _value.paymentmethod
          : paymentmethod // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SubscriptionModelImplCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$$SubscriptionModelImplCopyWith(_$SubscriptionModelImpl value,
          $Res Function(_$SubscriptionModelImpl) then) =
      __$$SubscriptionModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {SubscriptionType? subscriptionId,
      dynamic name,
      dynamic amount,
      dynamic startdate,
      dynamic enddate,
      SubscriptionStatus? status,
      dynamic paymentmethod});
}

/// @nodoc
class __$$SubscriptionModelImplCopyWithImpl<$Res>
    extends _$SubscriptionModelCopyWithImpl<$Res, _$SubscriptionModelImpl>
    implements _$$SubscriptionModelImplCopyWith<$Res> {
  __$$SubscriptionModelImplCopyWithImpl(_$SubscriptionModelImpl _value,
      $Res Function(_$SubscriptionModelImpl) _then)
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
    return _then(_$SubscriptionModelImpl(
      subscriptionId: freezed == subscriptionId
          ? _value.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as SubscriptionType?,
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
              as SubscriptionStatus?,
      paymentmethod: freezed == paymentmethod
          ? _value.paymentmethod
          : paymentmethod // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$SubscriptionModelImpl implements _SubscriptionModel {
  _$SubscriptionModelImpl(
      {this.subscriptionId,
      this.name,
      this.amount,
      this.startdate,
      this.enddate,
      this.status,
      this.paymentmethod});

  factory _$SubscriptionModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SubscriptionModelImplFromJson(json);

  @override
  final SubscriptionType? subscriptionId;
  @override
  final dynamic name;
  @override
  final dynamic amount;
  @override
  final dynamic startdate;
  @override
  final dynamic enddate;
  @override
  final SubscriptionStatus? status;
  @override
  final dynamic paymentmethod;

  @override
  String toString() {
    return 'SubscriptionModel(subscriptionId: $subscriptionId, name: $name, amount: $amount, startdate: $startdate, enddate: $enddate, status: $status, paymentmethod: $paymentmethod)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SubscriptionModelImpl &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            const DeepCollectionEquality().equals(other.name, name) &&
            const DeepCollectionEquality().equals(other.amount, amount) &&
            const DeepCollectionEquality().equals(other.startdate, startdate) &&
            const DeepCollectionEquality().equals(other.enddate, enddate) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.paymentmethod, paymentmethod));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      subscriptionId,
      const DeepCollectionEquality().hash(name),
      const DeepCollectionEquality().hash(amount),
      const DeepCollectionEquality().hash(startdate),
      const DeepCollectionEquality().hash(enddate),
      status,
      const DeepCollectionEquality().hash(paymentmethod));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      __$$SubscriptionModelImplCopyWithImpl<_$SubscriptionModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SubscriptionModelImplToJson(
      this,
    );
  }
}

abstract class _SubscriptionModel implements SubscriptionModel {
  factory _SubscriptionModel(
      {final SubscriptionType? subscriptionId,
      final dynamic name,
      final dynamic amount,
      final dynamic startdate,
      final dynamic enddate,
      final SubscriptionStatus? status,
      final dynamic paymentmethod}) = _$SubscriptionModelImpl;

  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =
      _$SubscriptionModelImpl.fromJson;

  @override
  SubscriptionType? get subscriptionId;
  @override
  dynamic get name;
  @override
  dynamic get amount;
  @override
  dynamic get startdate;
  @override
  dynamic get enddate;
  @override
  SubscriptionStatus? get status;
  @override
  dynamic get paymentmethod;
  @override
  @JsonKey(ignore: true)
  _$$SubscriptionModelImplCopyWith<_$SubscriptionModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

WalletModel _$WalletModelFromJson(Map<String, dynamic> json) {
  return _WalletModel.fromJson(json);
}

/// @nodoc
mixin _$WalletModel {
  dynamic get availableBalance => throw _privateConstructorUsedError;
  dynamic get lastTransactionDate => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $WalletModelCopyWith<WalletModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletModelCopyWith<$Res> {
  factory $WalletModelCopyWith(
          WalletModel value, $Res Function(WalletModel) then) =
      _$WalletModelCopyWithImpl<$Res, WalletModel>;
  @useResult
  $Res call({dynamic availableBalance, dynamic lastTransactionDate});
}

/// @nodoc
class _$WalletModelCopyWithImpl<$Res, $Val extends WalletModel>
    implements $WalletModelCopyWith<$Res> {
  _$WalletModelCopyWithImpl(this._value, this._then);

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
abstract class _$$WalletModelImplCopyWith<$Res>
    implements $WalletModelCopyWith<$Res> {
  factory _$$WalletModelImplCopyWith(
          _$WalletModelImpl value, $Res Function(_$WalletModelImpl) then) =
      __$$WalletModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic availableBalance, dynamic lastTransactionDate});
}

/// @nodoc
class __$$WalletModelImplCopyWithImpl<$Res>
    extends _$WalletModelCopyWithImpl<$Res, _$WalletModelImpl>
    implements _$$WalletModelImplCopyWith<$Res> {
  __$$WalletModelImplCopyWithImpl(
      _$WalletModelImpl _value, $Res Function(_$WalletModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? availableBalance = freezed,
    Object? lastTransactionDate = freezed,
  }) {
    return _then(_$WalletModelImpl(
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
class _$WalletModelImpl implements _WalletModel {
  _$WalletModelImpl({this.availableBalance, this.lastTransactionDate});

  factory _$WalletModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletModelImplFromJson(json);

  @override
  final dynamic availableBalance;
  @override
  final dynamic lastTransactionDate;

  @override
  String toString() {
    return 'WalletModel(availableBalance: $availableBalance, lastTransactionDate: $lastTransactionDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletModelImpl &&
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
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      __$$WalletModelImplCopyWithImpl<_$WalletModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletModelImplToJson(
      this,
    );
  }
}

abstract class _WalletModel implements WalletModel {
  factory _WalletModel(
      {final dynamic availableBalance,
      final dynamic lastTransactionDate}) = _$WalletModelImpl;

  factory _WalletModel.fromJson(Map<String, dynamic> json) =
      _$WalletModelImpl.fromJson;

  @override
  dynamic get availableBalance;
  @override
  dynamic get lastTransactionDate;
  @override
  @JsonKey(ignore: true)
  _$$WalletModelImplCopyWith<_$WalletModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

InterestModel _$InterestModelFromJson(Map<String, dynamic> json) {
  return _InterestModel.fromJson(json);
}

/// @nodoc
mixin _$InterestModel {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $InterestModelCopyWith<InterestModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $InterestModelCopyWith<$Res> {
  factory $InterestModelCopyWith(
          InterestModel value, $Res Function(InterestModel) then) =
      _$InterestModelCopyWithImpl<$Res, InterestModel>;
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class _$InterestModelCopyWithImpl<$Res, $Val extends InterestModel>
    implements $InterestModelCopyWith<$Res> {
  _$InterestModelCopyWithImpl(this._value, this._then);

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
abstract class _$$InterestModelImplCopyWith<$Res>
    implements $InterestModelCopyWith<$Res> {
  factory _$$InterestModelImplCopyWith(
          _$InterestModelImpl value, $Res Function(_$InterestModelImpl) then) =
      __$$InterestModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({dynamic id, dynamic title});
}

/// @nodoc
class __$$InterestModelImplCopyWithImpl<$Res>
    extends _$InterestModelCopyWithImpl<$Res, _$InterestModelImpl>
    implements _$$InterestModelImplCopyWith<$Res> {
  __$$InterestModelImplCopyWithImpl(
      _$InterestModelImpl _value, $Res Function(_$InterestModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_$InterestModelImpl(
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
class _$InterestModelImpl implements _InterestModel {
  _$InterestModelImpl({this.id, this.title});

  factory _$InterestModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$InterestModelImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic title;

  @override
  String toString() {
    return 'InterestModel(id: $id, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InterestModelImpl &&
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
  _$$InterestModelImplCopyWith<_$InterestModelImpl> get copyWith =>
      __$$InterestModelImplCopyWithImpl<_$InterestModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$InterestModelImplToJson(
      this,
    );
  }
}

abstract class _InterestModel implements InterestModel {
  factory _InterestModel({final dynamic id, final dynamic title}) =
      _$InterestModelImpl;

  factory _InterestModel.fromJson(Map<String, dynamic> json) =
      _$InterestModelImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get title;
  @override
  @JsonKey(ignore: true)
  _$$InterestModelImplCopyWith<_$InterestModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BankAccountDetailModel _$BankAccountDetailModelFromJson(
    Map<String, dynamic> json) {
  return _BankAccountDetailModel.fromJson(json);
}

/// @nodoc
mixin _$BankAccountDetailModel {
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
  $BankAccountDetailModelCopyWith<BankAccountDetailModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BankAccountDetailModelCopyWith<$Res> {
  factory $BankAccountDetailModelCopyWith(BankAccountDetailModel value,
          $Res Function(BankAccountDetailModel) then) =
      _$BankAccountDetailModelCopyWithImpl<$Res, BankAccountDetailModel>;
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
class _$BankAccountDetailModelCopyWithImpl<$Res,
        $Val extends BankAccountDetailModel>
    implements $BankAccountDetailModelCopyWith<$Res> {
  _$BankAccountDetailModelCopyWithImpl(this._value, this._then);

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
abstract class _$$BankAccountDetailModelImplCopyWith<$Res>
    implements $BankAccountDetailModelCopyWith<$Res> {
  factory _$$BankAccountDetailModelImplCopyWith(
          _$BankAccountDetailModelImpl value,
          $Res Function(_$BankAccountDetailModelImpl) then) =
      __$$BankAccountDetailModelImplCopyWithImpl<$Res>;
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
class __$$BankAccountDetailModelImplCopyWithImpl<$Res>
    extends _$BankAccountDetailModelCopyWithImpl<$Res,
        _$BankAccountDetailModelImpl>
    implements _$$BankAccountDetailModelImplCopyWith<$Res> {
  __$$BankAccountDetailModelImplCopyWithImpl(
      _$BankAccountDetailModelImpl _value,
      $Res Function(_$BankAccountDetailModelImpl) _then)
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
    return _then(_$BankAccountDetailModelImpl(
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
class _$BankAccountDetailModelImpl implements _BankAccountDetailModel {
  _$BankAccountDetailModelImpl(
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

  factory _$BankAccountDetailModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$BankAccountDetailModelImplFromJson(json);

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
    return 'BankAccountDetailModel(userId: $userId, firstName: $firstName, lastName: $lastName, country: $country, payOutType: $payOutType, bankId: $bankId, bankName: $bankName, bankCode: $bankCode, branchCode: $branchCode, accountNumber: $accountNumber, accountCurrency: $accountCurrency, routingNumber: $routingNumber, swiftCode: $swiftCode)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BankAccountDetailModelImpl &&
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
  _$$BankAccountDetailModelImplCopyWith<_$BankAccountDetailModelImpl>
      get copyWith => __$$BankAccountDetailModelImplCopyWithImpl<
          _$BankAccountDetailModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BankAccountDetailModelImplToJson(
      this,
    );
  }
}

abstract class _BankAccountDetailModel implements BankAccountDetailModel {
  factory _BankAccountDetailModel(
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
      final dynamic swiftCode}) = _$BankAccountDetailModelImpl;

  factory _BankAccountDetailModel.fromJson(Map<String, dynamic> json) =
      _$BankAccountDetailModelImpl.fromJson;

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
  _$$BankAccountDetailModelImplCopyWith<_$BankAccountDetailModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
