// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserProfileModel {
  UserProfileDataModel? get data;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileModelCopyWith<UserProfileModel> get copyWith =>
      _$UserProfileModelCopyWithImpl<UserProfileModel>(
          this as UserProfileModel, _$identity);

  /// Serializes this UserProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileModel &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'UserProfileModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $UserProfileModelCopyWith<$Res> {
  factory $UserProfileModelCopyWith(
          UserProfileModel value, $Res Function(UserProfileModel) _then) =
      _$UserProfileModelCopyWithImpl;
  @useResult
  $Res call({UserProfileDataModel? data});

  $UserProfileDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class _$UserProfileModelCopyWithImpl<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  _$UserProfileModelCopyWithImpl(this._self, this._then);

  final UserProfileModel _self;
  final $Res Function(UserProfileModel) _then;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_self.copyWith(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
    ));
  }

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $UserProfileDataModelCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfileModel implements UserProfileModel {
  _UserProfileModel({this.data});
  factory _UserProfileModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileModelFromJson(json);

  @override
  final UserProfileDataModel? data;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileModelCopyWith<_UserProfileModel> get copyWith =>
      __$UserProfileModelCopyWithImpl<_UserProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileModel &&
            (identical(other.data, data) || other.data == data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, data);

  @override
  String toString() {
    return 'UserProfileModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileModelCopyWith<$Res>
    implements $UserProfileModelCopyWith<$Res> {
  factory _$UserProfileModelCopyWith(
          _UserProfileModel value, $Res Function(_UserProfileModel) _then) =
      __$UserProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call({UserProfileDataModel? data});

  @override
  $UserProfileDataModelCopyWith<$Res>? get data;
}

/// @nodoc
class __$UserProfileModelCopyWithImpl<$Res>
    implements _$UserProfileModelCopyWith<$Res> {
  __$UserProfileModelCopyWithImpl(this._self, this._then);

  final _UserProfileModel _self;
  final $Res Function(_UserProfileModel) _then;

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_UserProfileModel(
      data: freezed == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as UserProfileDataModel?,
    ));
  }

  /// Create a copy of UserProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<$Res>? get data {
    if (_self.data == null) {
      return null;
    }

    return $UserProfileDataModelCopyWith<$Res>(_self.data!, (value) {
      return _then(_self.copyWith(data: value));
    });
  }
}

/// @nodoc
mixin _$UserProfileDataModel {
  UserModel? get user;
  SubscriptionModel? get userSubscription;
  ProfileModel? get profile;
  ProfileCounterModel? get profileCounters;
  ReferralInfoModel? get referralInfo;
  List<InterestModel>? get interests;
  List<UserDownlines>? get userDownlines;
  List<UserCarousels>? get userCarousels;
  MatchCriteriaModel? get matchCriteria;

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileDataModelCopyWith<UserProfileDataModel> get copyWith =>
      _$UserProfileDataModelCopyWithImpl<UserProfileDataModel>(
          this as UserProfileDataModel, _$identity);

  /// Serializes this UserProfileDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfileDataModel &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userSubscription, userSubscription) ||
                other.userSubscription == userSubscription) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileCounters, profileCounters) ||
                other.profileCounters == profileCounters) &&
            (identical(other.referralInfo, referralInfo) ||
                other.referralInfo == referralInfo) &&
            const DeepCollectionEquality().equals(other.interests, interests) &&
            const DeepCollectionEquality()
                .equals(other.userDownlines, userDownlines) &&
            const DeepCollectionEquality()
                .equals(other.userCarousels, userCarousels) &&
            (identical(other.matchCriteria, matchCriteria) ||
                other.matchCriteria == matchCriteria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      userSubscription,
      profile,
      profileCounters,
      referralInfo,
      const DeepCollectionEquality().hash(interests),
      const DeepCollectionEquality().hash(userDownlines),
      const DeepCollectionEquality().hash(userCarousels),
      matchCriteria);

  @override
  String toString() {
    return 'UserProfileDataModel(user: $user, userSubscription: $userSubscription, profile: $profile, profileCounters: $profileCounters, referralInfo: $referralInfo, interests: $interests, userDownlines: $userDownlines, userCarousels: $userCarousels, matchCriteria: $matchCriteria)';
  }
}

/// @nodoc
abstract mixin class $UserProfileDataModelCopyWith<$Res> {
  factory $UserProfileDataModelCopyWith(UserProfileDataModel value,
          $Res Function(UserProfileDataModel) _then) =
      _$UserProfileDataModelCopyWithImpl;
  @useResult
  $Res call(
      {UserModel? user,
      SubscriptionModel? userSubscription,
      ProfileModel? profile,
      ProfileCounterModel? profileCounters,
      ReferralInfoModel? referralInfo,
      List<InterestModel>? interests,
      List<UserDownlines>? userDownlines,
      List<UserCarousels>? userCarousels,
      MatchCriteriaModel? matchCriteria});

  $UserModelCopyWith<$Res>? get user;
  $SubscriptionModelCopyWith<$Res>? get userSubscription;
  $ProfileModelCopyWith<$Res>? get profile;
  $ProfileCounterModelCopyWith<$Res>? get profileCounters;
  $ReferralInfoModelCopyWith<$Res>? get referralInfo;
  $MatchCriteriaModelCopyWith<$Res>? get matchCriteria;
}

/// @nodoc
class _$UserProfileDataModelCopyWithImpl<$Res>
    implements $UserProfileDataModelCopyWith<$Res> {
  _$UserProfileDataModelCopyWithImpl(this._self, this._then);

  final UserProfileDataModel _self;
  final $Res Function(UserProfileDataModel) _then;

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userSubscription = freezed,
    Object? profile = freezed,
    Object? profileCounters = freezed,
    Object? referralInfo = freezed,
    Object? interests = freezed,
    Object? userDownlines = freezed,
    Object? userCarousels = freezed,
    Object? matchCriteria = freezed,
  }) {
    return _then(_self.copyWith(
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userSubscription: freezed == userSubscription
          ? _self.userSubscription
          : userSubscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      profileCounters: freezed == profileCounters
          ? _self.profileCounters
          : profileCounters // ignore: cast_nullable_to_non_nullable
              as ProfileCounterModel?,
      referralInfo: freezed == referralInfo
          ? _self.referralInfo
          : referralInfo // ignore: cast_nullable_to_non_nullable
              as ReferralInfoModel?,
      interests: freezed == interests
          ? _self.interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
      userDownlines: freezed == userDownlines
          ? _self.userDownlines
          : userDownlines // ignore: cast_nullable_to_non_nullable
              as List<UserDownlines>?,
      userCarousels: freezed == userCarousels
          ? _self.userCarousels
          : userCarousels // ignore: cast_nullable_to_non_nullable
              as List<UserCarousels>?,
      matchCriteria: freezed == matchCriteria
          ? _self.matchCriteria
          : matchCriteria // ignore: cast_nullable_to_non_nullable
              as MatchCriteriaModel?,
    ));
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<$Res>? get userSubscription {
    if (_self.userSubscription == null) {
      return null;
    }

    return $SubscriptionModelCopyWith<$Res>(_self.userSubscription!, (value) {
      return _then(_self.copyWith(userSubscription: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCounterModelCopyWith<$Res>? get profileCounters {
    if (_self.profileCounters == null) {
      return null;
    }

    return $ProfileCounterModelCopyWith<$Res>(_self.profileCounters!, (value) {
      return _then(_self.copyWith(profileCounters: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReferralInfoModelCopyWith<$Res>? get referralInfo {
    if (_self.referralInfo == null) {
      return null;
    }

    return $ReferralInfoModelCopyWith<$Res>(_self.referralInfo!, (value) {
      return _then(_self.copyWith(referralInfo: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchCriteriaModelCopyWith<$Res>? get matchCriteria {
    if (_self.matchCriteria == null) {
      return null;
    }

    return $MatchCriteriaModelCopyWith<$Res>(_self.matchCriteria!, (value) {
      return _then(_self.copyWith(matchCriteria: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfileDataModel implements UserProfileDataModel {
  _UserProfileDataModel(
      {this.user,
      this.userSubscription,
      this.profile,
      this.profileCounters,
      this.referralInfo,
      final List<InterestModel>? interests,
      final List<UserDownlines>? userDownlines,
      final List<UserCarousels>? userCarousels,
      this.matchCriteria})
      : _interests = interests,
        _userDownlines = userDownlines,
        _userCarousels = userCarousels;
  factory _UserProfileDataModel.fromJson(Map<String, dynamic> json) =>
      _$UserProfileDataModelFromJson(json);

  @override
  final UserModel? user;
  @override
  final SubscriptionModel? userSubscription;
  @override
  final ProfileModel? profile;
  @override
  final ProfileCounterModel? profileCounters;
  @override
  final ReferralInfoModel? referralInfo;
  final List<InterestModel>? _interests;
  @override
  List<InterestModel>? get interests {
    final value = _interests;
    if (value == null) return null;
    if (_interests is EqualUnmodifiableListView) return _interests;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserDownlines>? _userDownlines;
  @override
  List<UserDownlines>? get userDownlines {
    final value = _userDownlines;
    if (value == null) return null;
    if (_userDownlines is EqualUnmodifiableListView) return _userDownlines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<UserCarousels>? _userCarousels;
  @override
  List<UserCarousels>? get userCarousels {
    final value = _userCarousels;
    if (value == null) return null;
    if (_userCarousels is EqualUnmodifiableListView) return _userCarousels;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final MatchCriteriaModel? matchCriteria;

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileDataModelCopyWith<_UserProfileDataModel> get copyWith =>
      __$UserProfileDataModelCopyWithImpl<_UserProfileDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfileDataModel &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userSubscription, userSubscription) ||
                other.userSubscription == userSubscription) &&
            (identical(other.profile, profile) || other.profile == profile) &&
            (identical(other.profileCounters, profileCounters) ||
                other.profileCounters == profileCounters) &&
            (identical(other.referralInfo, referralInfo) ||
                other.referralInfo == referralInfo) &&
            const DeepCollectionEquality()
                .equals(other._interests, _interests) &&
            const DeepCollectionEquality()
                .equals(other._userDownlines, _userDownlines) &&
            const DeepCollectionEquality()
                .equals(other._userCarousels, _userCarousels) &&
            (identical(other.matchCriteria, matchCriteria) ||
                other.matchCriteria == matchCriteria));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      userSubscription,
      profile,
      profileCounters,
      referralInfo,
      const DeepCollectionEquality().hash(_interests),
      const DeepCollectionEquality().hash(_userDownlines),
      const DeepCollectionEquality().hash(_userCarousels),
      matchCriteria);

  @override
  String toString() {
    return 'UserProfileDataModel(user: $user, userSubscription: $userSubscription, profile: $profile, profileCounters: $profileCounters, referralInfo: $referralInfo, interests: $interests, userDownlines: $userDownlines, userCarousels: $userCarousels, matchCriteria: $matchCriteria)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileDataModelCopyWith<$Res>
    implements $UserProfileDataModelCopyWith<$Res> {
  factory _$UserProfileDataModelCopyWith(_UserProfileDataModel value,
          $Res Function(_UserProfileDataModel) _then) =
      __$UserProfileDataModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserModel? user,
      SubscriptionModel? userSubscription,
      ProfileModel? profile,
      ProfileCounterModel? profileCounters,
      ReferralInfoModel? referralInfo,
      List<InterestModel>? interests,
      List<UserDownlines>? userDownlines,
      List<UserCarousels>? userCarousels,
      MatchCriteriaModel? matchCriteria});

  @override
  $UserModelCopyWith<$Res>? get user;
  @override
  $SubscriptionModelCopyWith<$Res>? get userSubscription;
  @override
  $ProfileModelCopyWith<$Res>? get profile;
  @override
  $ProfileCounterModelCopyWith<$Res>? get profileCounters;
  @override
  $ReferralInfoModelCopyWith<$Res>? get referralInfo;
  @override
  $MatchCriteriaModelCopyWith<$Res>? get matchCriteria;
}

/// @nodoc
class __$UserProfileDataModelCopyWithImpl<$Res>
    implements _$UserProfileDataModelCopyWith<$Res> {
  __$UserProfileDataModelCopyWithImpl(this._self, this._then);

  final _UserProfileDataModel _self;
  final $Res Function(_UserProfileDataModel) _then;

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? user = freezed,
    Object? userSubscription = freezed,
    Object? profile = freezed,
    Object? profileCounters = freezed,
    Object? referralInfo = freezed,
    Object? interests = freezed,
    Object? userDownlines = freezed,
    Object? userCarousels = freezed,
    Object? matchCriteria = freezed,
  }) {
    return _then(_UserProfileDataModel(
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel?,
      userSubscription: freezed == userSubscription
          ? _self.userSubscription
          : userSubscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionModel?,
      profile: freezed == profile
          ? _self.profile
          : profile // ignore: cast_nullable_to_non_nullable
              as ProfileModel?,
      profileCounters: freezed == profileCounters
          ? _self.profileCounters
          : profileCounters // ignore: cast_nullable_to_non_nullable
              as ProfileCounterModel?,
      referralInfo: freezed == referralInfo
          ? _self.referralInfo
          : referralInfo // ignore: cast_nullable_to_non_nullable
              as ReferralInfoModel?,
      interests: freezed == interests
          ? _self._interests
          : interests // ignore: cast_nullable_to_non_nullable
              as List<InterestModel>?,
      userDownlines: freezed == userDownlines
          ? _self._userDownlines
          : userDownlines // ignore: cast_nullable_to_non_nullable
              as List<UserDownlines>?,
      userCarousels: freezed == userCarousels
          ? _self._userCarousels
          : userCarousels // ignore: cast_nullable_to_non_nullable
              as List<UserCarousels>?,
      matchCriteria: freezed == matchCriteria
          ? _self.matchCriteria
          : matchCriteria // ignore: cast_nullable_to_non_nullable
              as MatchCriteriaModel?,
    ));
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res>? get user {
    if (_self.user == null) {
      return null;
    }

    return $UserModelCopyWith<$Res>(_self.user!, (value) {
      return _then(_self.copyWith(user: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<$Res>? get userSubscription {
    if (_self.userSubscription == null) {
      return null;
    }

    return $SubscriptionModelCopyWith<$Res>(_self.userSubscription!, (value) {
      return _then(_self.copyWith(userSubscription: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<$Res>? get profile {
    if (_self.profile == null) {
      return null;
    }

    return $ProfileModelCopyWith<$Res>(_self.profile!, (value) {
      return _then(_self.copyWith(profile: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ProfileCounterModelCopyWith<$Res>? get profileCounters {
    if (_self.profileCounters == null) {
      return null;
    }

    return $ProfileCounterModelCopyWith<$Res>(_self.profileCounters!, (value) {
      return _then(_self.copyWith(profileCounters: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ReferralInfoModelCopyWith<$Res>? get referralInfo {
    if (_self.referralInfo == null) {
      return null;
    }

    return $ReferralInfoModelCopyWith<$Res>(_self.referralInfo!, (value) {
      return _then(_self.copyWith(referralInfo: value));
    });
  }

  /// Create a copy of UserProfileDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $MatchCriteriaModelCopyWith<$Res>? get matchCriteria {
    if (_self.matchCriteria == null) {
      return null;
    }

    return $MatchCriteriaModelCopyWith<$Res>(_self.matchCriteria!, (value) {
      return _then(_self.copyWith(matchCriteria: value));
    });
  }
}

/// @nodoc
mixin _$UserModel {
  String? get userId;
  bool? get isFullyVerified;
  String? get userName;
  String? get rolesCSV;
  @JsonKey(fromJson: parseCustomDate)
  DateTime? get createdDate;
  @JsonKey(fromJson: parseCustomDate)
  DateTime? get lastSeenDate;
  String? get normalizedEmail;
  bool? get emailConfirmed;
  String? get phoneCountryCode;
  String? get phoneNumber;
  bool? get phoneNumberConfirmed;
  bool? get isPromoter;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<UserModel> get copyWith =>
      _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isFullyVerified, isFullyVerified) ||
                other.isFullyVerified == isFullyVerified) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.rolesCSV, rolesCSV) ||
                other.rolesCSV == rolesCSV) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastSeenDate, lastSeenDate) ||
                other.lastSeenDate == lastSeenDate) &&
            (identical(other.normalizedEmail, normalizedEmail) ||
                other.normalizedEmail == normalizedEmail) &&
            (identical(other.emailConfirmed, emailConfirmed) ||
                other.emailConfirmed == emailConfirmed) &&
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneNumberConfirmed, phoneNumberConfirmed) ||
                other.phoneNumberConfirmed == phoneNumberConfirmed) &&
            (identical(other.isPromoter, isPromoter) ||
                other.isPromoter == isPromoter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      isFullyVerified,
      userName,
      rolesCSV,
      createdDate,
      lastSeenDate,
      normalizedEmail,
      emailConfirmed,
      phoneCountryCode,
      phoneNumber,
      phoneNumberConfirmed,
      isPromoter);

  @override
  String toString() {
    return 'UserModel(userId: $userId, isFullyVerified: $isFullyVerified, userName: $userName, rolesCSV: $rolesCSV, createdDate: $createdDate, lastSeenDate: $lastSeenDate, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, phoneCountryCode: $phoneCountryCode, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed, isPromoter: $isPromoter)';
  }
}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) =
      _$UserModelCopyWithImpl;
  @useResult
  $Res call(
      {String? userId,
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
      bool? isPromoter});
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res> implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
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
    Object? isPromoter = freezed,
  }) {
    return _then(_self.copyWith(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyVerified: freezed == isFullyVerified
          ? _self.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesCSV: freezed == rolesCSV
          ? _self.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenDate: freezed == lastSeenDate
          ? _self.lastSeenDate
          : lastSeenDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      normalizedEmail: freezed == normalizedEmail
          ? _self.normalizedEmail
          : normalizedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      emailConfirmed: freezed == emailConfirmed
          ? _self.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumberConfirmed: freezed == phoneNumberConfirmed
          ? _self.phoneNumberConfirmed
          : phoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPromoter: freezed == isPromoter
          ? _self.isPromoter
          : isPromoter // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserModel implements UserModel {
  _UserModel(
      {this.userId,
      this.isFullyVerified,
      this.userName,
      this.rolesCSV,
      @JsonKey(fromJson: parseCustomDate) this.createdDate,
      @JsonKey(fromJson: parseCustomDate) this.lastSeenDate,
      this.normalizedEmail,
      this.emailConfirmed,
      this.phoneCountryCode,
      this.phoneNumber,
      this.phoneNumberConfirmed,
      this.isPromoter});
  factory _UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  @override
  final String? userId;
  @override
  final bool? isFullyVerified;
  @override
  final String? userName;
  @override
  final String? rolesCSV;
  @override
  @JsonKey(fromJson: parseCustomDate)
  final DateTime? createdDate;
  @override
  @JsonKey(fromJson: parseCustomDate)
  final DateTime? lastSeenDate;
  @override
  final String? normalizedEmail;
  @override
  final bool? emailConfirmed;
  @override
  final String? phoneCountryCode;
  @override
  final String? phoneNumber;
  @override
  final bool? phoneNumberConfirmed;
  @override
  final bool? isPromoter;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserModelCopyWith<_UserModel> get copyWith =>
      __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.isFullyVerified, isFullyVerified) ||
                other.isFullyVerified == isFullyVerified) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.rolesCSV, rolesCSV) ||
                other.rolesCSV == rolesCSV) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.lastSeenDate, lastSeenDate) ||
                other.lastSeenDate == lastSeenDate) &&
            (identical(other.normalizedEmail, normalizedEmail) ||
                other.normalizedEmail == normalizedEmail) &&
            (identical(other.emailConfirmed, emailConfirmed) ||
                other.emailConfirmed == emailConfirmed) &&
            (identical(other.phoneCountryCode, phoneCountryCode) ||
                other.phoneCountryCode == phoneCountryCode) &&
            (identical(other.phoneNumber, phoneNumber) ||
                other.phoneNumber == phoneNumber) &&
            (identical(other.phoneNumberConfirmed, phoneNumberConfirmed) ||
                other.phoneNumberConfirmed == phoneNumberConfirmed) &&
            (identical(other.isPromoter, isPromoter) ||
                other.isPromoter == isPromoter));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      isFullyVerified,
      userName,
      rolesCSV,
      createdDate,
      lastSeenDate,
      normalizedEmail,
      emailConfirmed,
      phoneCountryCode,
      phoneNumber,
      phoneNumberConfirmed,
      isPromoter);

  @override
  String toString() {
    return 'UserModel(userId: $userId, isFullyVerified: $isFullyVerified, userName: $userName, rolesCSV: $rolesCSV, createdDate: $createdDate, lastSeenDate: $lastSeenDate, normalizedEmail: $normalizedEmail, emailConfirmed: $emailConfirmed, phoneCountryCode: $phoneCountryCode, phoneNumber: $phoneNumber, phoneNumberConfirmed: $phoneNumberConfirmed, isPromoter: $isPromoter)';
  }
}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(
          _UserModel value, $Res Function(_UserModel) _then) =
      __$UserModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? userId,
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
      bool? isPromoter});
}

/// @nodoc
class __$UserModelCopyWithImpl<$Res> implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

  /// Create a copy of UserModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    Object? isPromoter = freezed,
  }) {
    return _then(_UserModel(
      userId: freezed == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      isFullyVerified: freezed == isFullyVerified
          ? _self.isFullyVerified
          : isFullyVerified // ignore: cast_nullable_to_non_nullable
              as bool?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      rolesCSV: freezed == rolesCSV
          ? _self.rolesCSV
          : rolesCSV // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      lastSeenDate: freezed == lastSeenDate
          ? _self.lastSeenDate
          : lastSeenDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      normalizedEmail: freezed == normalizedEmail
          ? _self.normalizedEmail
          : normalizedEmail // ignore: cast_nullable_to_non_nullable
              as String?,
      emailConfirmed: freezed == emailConfirmed
          ? _self.emailConfirmed
          : emailConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      phoneCountryCode: freezed == phoneCountryCode
          ? _self.phoneCountryCode
          : phoneCountryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumber: freezed == phoneNumber
          ? _self.phoneNumber
          : phoneNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      phoneNumberConfirmed: freezed == phoneNumberConfirmed
          ? _self.phoneNumberConfirmed
          : phoneNumberConfirmed // ignore: cast_nullable_to_non_nullable
              as bool?,
      isPromoter: freezed == isPromoter
          ? _self.isPromoter
          : isPromoter // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
mixin _$SubscriptionModel {
  int? get subscriptionId;
  String? get name;
  double? get amount;
  @JsonKey(name: 'startdate', fromJson: parseCustomDate)
  DateTime? get startDate;
  @JsonKey(name: 'enddate', fromJson: parseCustomDate)
  DateTime? get endDate;
  @JsonKey(name: 'status')
  int? get status;
  @JsonKey(name: 'paymentmethod')
  String? get paymentMethod;
  SubscriptionDetail? get subscription;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionModelCopyWith<SubscriptionModel> get copyWith =>
      _$SubscriptionModelCopyWithImpl<SubscriptionModel>(
          this as SubscriptionModel, _$identity);

  /// Serializes this SubscriptionModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionModel &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subscriptionId, name, amount,
      startDate, endDate, status, paymentMethod, subscription);

  @override
  String toString() {
    return 'SubscriptionModel(subscriptionId: $subscriptionId, name: $name, amount: $amount, startDate: $startDate, endDate: $endDate, status: $status, paymentMethod: $paymentMethod, subscription: $subscription)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionModelCopyWith<$Res> {
  factory $SubscriptionModelCopyWith(
          SubscriptionModel value, $Res Function(SubscriptionModel) _then) =
      _$SubscriptionModelCopyWithImpl;
  @useResult
  $Res call(
      {int? subscriptionId,
      String? name,
      double? amount,
      @JsonKey(name: 'startdate', fromJson: parseCustomDate)
      DateTime? startDate,
      @JsonKey(name: 'enddate', fromJson: parseCustomDate) DateTime? endDate,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'paymentmethod') String? paymentMethod,
      SubscriptionDetail? subscription});

  $SubscriptionDetailCopyWith<$Res>? get subscription;
}

/// @nodoc
class _$SubscriptionModelCopyWithImpl<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  _$SubscriptionModelCopyWithImpl(this._self, this._then);

  final SubscriptionModel _self;
  final $Res Function(SubscriptionModel) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? subscriptionId = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_self.copyWith(
      subscriptionId: freezed == subscriptionId
          ? _self.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription: freezed == subscription
          ? _self.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionDetail?,
    ));
  }

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionDetailCopyWith<$Res>? get subscription {
    if (_self.subscription == null) {
      return null;
    }

    return $SubscriptionDetailCopyWith<$Res>(_self.subscription!, (value) {
      return _then(_self.copyWith(subscription: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionModel implements SubscriptionModel {
  _SubscriptionModel(
      {this.subscriptionId,
      this.name,
      this.amount,
      @JsonKey(name: 'startdate', fromJson: parseCustomDate) this.startDate,
      @JsonKey(name: 'enddate', fromJson: parseCustomDate) this.endDate,
      @JsonKey(name: 'status') this.status,
      @JsonKey(name: 'paymentmethod') this.paymentMethod,
      this.subscription});
  factory _SubscriptionModel.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionModelFromJson(json);

  @override
  final int? subscriptionId;
  @override
  final String? name;
  @override
  final double? amount;
  @override
  @JsonKey(name: 'startdate', fromJson: parseCustomDate)
  final DateTime? startDate;
  @override
  @JsonKey(name: 'enddate', fromJson: parseCustomDate)
  final DateTime? endDate;
  @override
  @JsonKey(name: 'status')
  final int? status;
  @override
  @JsonKey(name: 'paymentmethod')
  final String? paymentMethod;
  @override
  final SubscriptionDetail? subscription;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionModelCopyWith<_SubscriptionModel> get copyWith =>
      __$SubscriptionModelCopyWithImpl<_SubscriptionModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionModel &&
            (identical(other.subscriptionId, subscriptionId) ||
                other.subscriptionId == subscriptionId) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.startDate, startDate) ||
                other.startDate == startDate) &&
            (identical(other.endDate, endDate) || other.endDate == endDate) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod) &&
            (identical(other.subscription, subscription) ||
                other.subscription == subscription));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, subscriptionId, name, amount,
      startDate, endDate, status, paymentMethod, subscription);

  @override
  String toString() {
    return 'SubscriptionModel(subscriptionId: $subscriptionId, name: $name, amount: $amount, startDate: $startDate, endDate: $endDate, status: $status, paymentMethod: $paymentMethod, subscription: $subscription)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionModelCopyWith<$Res>
    implements $SubscriptionModelCopyWith<$Res> {
  factory _$SubscriptionModelCopyWith(
          _SubscriptionModel value, $Res Function(_SubscriptionModel) _then) =
      __$SubscriptionModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? subscriptionId,
      String? name,
      double? amount,
      @JsonKey(name: 'startdate', fromJson: parseCustomDate)
      DateTime? startDate,
      @JsonKey(name: 'enddate', fromJson: parseCustomDate) DateTime? endDate,
      @JsonKey(name: 'status') int? status,
      @JsonKey(name: 'paymentmethod') String? paymentMethod,
      SubscriptionDetail? subscription});

  @override
  $SubscriptionDetailCopyWith<$Res>? get subscription;
}

/// @nodoc
class __$SubscriptionModelCopyWithImpl<$Res>
    implements _$SubscriptionModelCopyWith<$Res> {
  __$SubscriptionModelCopyWithImpl(this._self, this._then);

  final _SubscriptionModel _self;
  final $Res Function(_SubscriptionModel) _then;

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? subscriptionId = freezed,
    Object? name = freezed,
    Object? amount = freezed,
    Object? startDate = freezed,
    Object? endDate = freezed,
    Object? status = freezed,
    Object? paymentMethod = freezed,
    Object? subscription = freezed,
  }) {
    return _then(_SubscriptionModel(
      subscriptionId: freezed == subscriptionId
          ? _self.subscriptionId
          : subscriptionId // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      amount: freezed == amount
          ? _self.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double?,
      startDate: freezed == startDate
          ? _self.startDate
          : startDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      endDate: freezed == endDate
          ? _self.endDate
          : endDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      status: freezed == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as int?,
      paymentMethod: freezed == paymentMethod
          ? _self.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as String?,
      subscription: freezed == subscription
          ? _self.subscription
          : subscription // ignore: cast_nullable_to_non_nullable
              as SubscriptionDetail?,
    ));
  }

  /// Create a copy of SubscriptionModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SubscriptionDetailCopyWith<$Res>? get subscription {
    if (_self.subscription == null) {
      return null;
    }

    return $SubscriptionDetailCopyWith<$Res>(_self.subscription!, (value) {
      return _then(_self.copyWith(subscription: value));
    });
  }
}

/// @nodoc
mixin _$SubscriptionDetail {
  int? get id;
  String? get name;
  String? get description;
  double? get fee;
  bool? get allowMessaging;
  bool? get allowWithdrawal;
  bool? get accessPeopleNearby;
  int? get noMatchesPerDay;
  int? get noOfBuddyEventPerWeek;
  int? get noNearbyPerWeek;
  int? get noOfChatMessagePerWeek;
  List<String>? get features;

  /// Create a copy of SubscriptionDetail
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SubscriptionDetailCopyWith<SubscriptionDetail> get copyWith =>
      _$SubscriptionDetailCopyWithImpl<SubscriptionDetail>(
          this as SubscriptionDetail, _$identity);

  /// Serializes this SubscriptionDetail to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SubscriptionDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.allowMessaging, allowMessaging) ||
                other.allowMessaging == allowMessaging) &&
            (identical(other.allowWithdrawal, allowWithdrawal) ||
                other.allowWithdrawal == allowWithdrawal) &&
            (identical(other.accessPeopleNearby, accessPeopleNearby) ||
                other.accessPeopleNearby == accessPeopleNearby) &&
            (identical(other.noMatchesPerDay, noMatchesPerDay) ||
                other.noMatchesPerDay == noMatchesPerDay) &&
            (identical(other.noOfBuddyEventPerWeek, noOfBuddyEventPerWeek) ||
                other.noOfBuddyEventPerWeek == noOfBuddyEventPerWeek) &&
            (identical(other.noNearbyPerWeek, noNearbyPerWeek) ||
                other.noNearbyPerWeek == noNearbyPerWeek) &&
            (identical(other.noOfChatMessagePerWeek, noOfChatMessagePerWeek) ||
                other.noOfChatMessagePerWeek == noOfChatMessagePerWeek) &&
            const DeepCollectionEquality().equals(other.features, features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      fee,
      allowMessaging,
      allowWithdrawal,
      accessPeopleNearby,
      noMatchesPerDay,
      noOfBuddyEventPerWeek,
      noNearbyPerWeek,
      noOfChatMessagePerWeek,
      const DeepCollectionEquality().hash(features));

  @override
  String toString() {
    return 'SubscriptionDetail(id: $id, name: $name, description: $description, fee: $fee, allowMessaging: $allowMessaging, allowWithdrawal: $allowWithdrawal, accessPeopleNearby: $accessPeopleNearby, noMatchesPerDay: $noMatchesPerDay, noOfBuddyEventPerWeek: $noOfBuddyEventPerWeek, noNearbyPerWeek: $noNearbyPerWeek, noOfChatMessagePerWeek: $noOfChatMessagePerWeek, features: $features)';
  }
}

/// @nodoc
abstract mixin class $SubscriptionDetailCopyWith<$Res> {
  factory $SubscriptionDetailCopyWith(
          SubscriptionDetail value, $Res Function(SubscriptionDetail) _then) =
      _$SubscriptionDetailCopyWithImpl;
  @useResult
  $Res call(
      {int? id,
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
      List<String>? features});
}

/// @nodoc
class _$SubscriptionDetailCopyWithImpl<$Res>
    implements $SubscriptionDetailCopyWith<$Res> {
  _$SubscriptionDetailCopyWithImpl(this._self, this._then);

  final SubscriptionDetail _self;
  final $Res Function(SubscriptionDetail) _then;

  /// Create a copy of SubscriptionDetail
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? fee = freezed,
    Object? allowMessaging = freezed,
    Object? allowWithdrawal = freezed,
    Object? accessPeopleNearby = freezed,
    Object? noMatchesPerDay = freezed,
    Object? noOfBuddyEventPerWeek = freezed,
    Object? noNearbyPerWeek = freezed,
    Object? noOfChatMessagePerWeek = freezed,
    Object? features = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      allowMessaging: freezed == allowMessaging
          ? _self.allowMessaging
          : allowMessaging // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowWithdrawal: freezed == allowWithdrawal
          ? _self.allowWithdrawal
          : allowWithdrawal // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessPeopleNearby: freezed == accessPeopleNearby
          ? _self.accessPeopleNearby
          : accessPeopleNearby // ignore: cast_nullable_to_non_nullable
              as bool?,
      noMatchesPerDay: freezed == noMatchesPerDay
          ? _self.noMatchesPerDay
          : noMatchesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfBuddyEventPerWeek: freezed == noOfBuddyEventPerWeek
          ? _self.noOfBuddyEventPerWeek
          : noOfBuddyEventPerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      noNearbyPerWeek: freezed == noNearbyPerWeek
          ? _self.noNearbyPerWeek
          : noNearbyPerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfChatMessagePerWeek: freezed == noOfChatMessagePerWeek
          ? _self.noOfChatMessagePerWeek
          : noOfChatMessagePerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      features: freezed == features
          ? _self.features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _SubscriptionDetail implements SubscriptionDetail {
  _SubscriptionDetail(
      {this.id,
      this.name,
      this.description,
      this.fee,
      this.allowMessaging,
      this.allowWithdrawal,
      this.accessPeopleNearby,
      this.noMatchesPerDay,
      this.noOfBuddyEventPerWeek,
      this.noNearbyPerWeek,
      this.noOfChatMessagePerWeek,
      final List<String>? features})
      : _features = features;
  factory _SubscriptionDetail.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionDetailFromJson(json);

  @override
  final int? id;
  @override
  final String? name;
  @override
  final String? description;
  @override
  final double? fee;
  @override
  final bool? allowMessaging;
  @override
  final bool? allowWithdrawal;
  @override
  final bool? accessPeopleNearby;
  @override
  final int? noMatchesPerDay;
  @override
  final int? noOfBuddyEventPerWeek;
  @override
  final int? noNearbyPerWeek;
  @override
  final int? noOfChatMessagePerWeek;
  final List<String>? _features;
  @override
  List<String>? get features {
    final value = _features;
    if (value == null) return null;
    if (_features is EqualUnmodifiableListView) return _features;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of SubscriptionDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SubscriptionDetailCopyWith<_SubscriptionDetail> get copyWith =>
      __$SubscriptionDetailCopyWithImpl<_SubscriptionDetail>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SubscriptionDetailToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SubscriptionDetail &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.fee, fee) || other.fee == fee) &&
            (identical(other.allowMessaging, allowMessaging) ||
                other.allowMessaging == allowMessaging) &&
            (identical(other.allowWithdrawal, allowWithdrawal) ||
                other.allowWithdrawal == allowWithdrawal) &&
            (identical(other.accessPeopleNearby, accessPeopleNearby) ||
                other.accessPeopleNearby == accessPeopleNearby) &&
            (identical(other.noMatchesPerDay, noMatchesPerDay) ||
                other.noMatchesPerDay == noMatchesPerDay) &&
            (identical(other.noOfBuddyEventPerWeek, noOfBuddyEventPerWeek) ||
                other.noOfBuddyEventPerWeek == noOfBuddyEventPerWeek) &&
            (identical(other.noNearbyPerWeek, noNearbyPerWeek) ||
                other.noNearbyPerWeek == noNearbyPerWeek) &&
            (identical(other.noOfChatMessagePerWeek, noOfChatMessagePerWeek) ||
                other.noOfChatMessagePerWeek == noOfChatMessagePerWeek) &&
            const DeepCollectionEquality().equals(other._features, _features));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      fee,
      allowMessaging,
      allowWithdrawal,
      accessPeopleNearby,
      noMatchesPerDay,
      noOfBuddyEventPerWeek,
      noNearbyPerWeek,
      noOfChatMessagePerWeek,
      const DeepCollectionEquality().hash(_features));

  @override
  String toString() {
    return 'SubscriptionDetail(id: $id, name: $name, description: $description, fee: $fee, allowMessaging: $allowMessaging, allowWithdrawal: $allowWithdrawal, accessPeopleNearby: $accessPeopleNearby, noMatchesPerDay: $noMatchesPerDay, noOfBuddyEventPerWeek: $noOfBuddyEventPerWeek, noNearbyPerWeek: $noNearbyPerWeek, noOfChatMessagePerWeek: $noOfChatMessagePerWeek, features: $features)';
  }
}

/// @nodoc
abstract mixin class _$SubscriptionDetailCopyWith<$Res>
    implements $SubscriptionDetailCopyWith<$Res> {
  factory _$SubscriptionDetailCopyWith(
          _SubscriptionDetail value, $Res Function(_SubscriptionDetail) _then) =
      __$SubscriptionDetailCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? id,
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
      List<String>? features});
}

/// @nodoc
class __$SubscriptionDetailCopyWithImpl<$Res>
    implements _$SubscriptionDetailCopyWith<$Res> {
  __$SubscriptionDetailCopyWithImpl(this._self, this._then);

  final _SubscriptionDetail _self;
  final $Res Function(_SubscriptionDetail) _then;

  /// Create a copy of SubscriptionDetail
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? name = freezed,
    Object? description = freezed,
    Object? fee = freezed,
    Object? allowMessaging = freezed,
    Object? allowWithdrawal = freezed,
    Object? accessPeopleNearby = freezed,
    Object? noMatchesPerDay = freezed,
    Object? noOfBuddyEventPerWeek = freezed,
    Object? noNearbyPerWeek = freezed,
    Object? noOfChatMessagePerWeek = freezed,
    Object? features = freezed,
  }) {
    return _then(_SubscriptionDetail(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      name: freezed == name
          ? _self.name
          : name // ignore: cast_nullable_to_non_nullable
              as String?,
      description: freezed == description
          ? _self.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      fee: freezed == fee
          ? _self.fee
          : fee // ignore: cast_nullable_to_non_nullable
              as double?,
      allowMessaging: freezed == allowMessaging
          ? _self.allowMessaging
          : allowMessaging // ignore: cast_nullable_to_non_nullable
              as bool?,
      allowWithdrawal: freezed == allowWithdrawal
          ? _self.allowWithdrawal
          : allowWithdrawal // ignore: cast_nullable_to_non_nullable
              as bool?,
      accessPeopleNearby: freezed == accessPeopleNearby
          ? _self.accessPeopleNearby
          : accessPeopleNearby // ignore: cast_nullable_to_non_nullable
              as bool?,
      noMatchesPerDay: freezed == noMatchesPerDay
          ? _self.noMatchesPerDay
          : noMatchesPerDay // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfBuddyEventPerWeek: freezed == noOfBuddyEventPerWeek
          ? _self.noOfBuddyEventPerWeek
          : noOfBuddyEventPerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      noNearbyPerWeek: freezed == noNearbyPerWeek
          ? _self.noNearbyPerWeek
          : noNearbyPerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      noOfChatMessagePerWeek: freezed == noOfChatMessagePerWeek
          ? _self.noOfChatMessagePerWeek
          : noOfChatMessagePerWeek // ignore: cast_nullable_to_non_nullable
              as int?,
      features: freezed == features
          ? _self._features
          : features // ignore: cast_nullable_to_non_nullable
              as List<String>?,
    ));
  }
}

/// @nodoc
mixin _$ProfileModel {
  String? get id;
  String? get firstName;
  String? get lastName;
  String? get dateOfBirth;
  int? get age;
  int? get gender;
  String? get languageCSV;
  String? get aboutMe;
  String? get bodyType;
  String? get complexion;
  double? get height;
  double? get weight;
  String? get occupation;
  String? get religion;
  String? get tagline;
  int? get maritalStatus;
  String? get profilePhotoURL;
  int? get profileStatus;
  @JsonKey(fromJson: parseCustomDate)
  DateTime? get lastSeenTime;
  bool? get isOnline;
  @JsonKey(fromJson: parseCustomDate)
  DateTime? get lastModifiedDate;
  @JsonKey(fromJson: parseCustomDate)
  DateTime? get createdDate;
  ResidentialAddressModel? get residentialAddress;
  OriginAddressModel? get originAddress;
  LocationModel? get location;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileModelCopyWith<ProfileModel> get copyWith =>
      _$ProfileModelCopyWithImpl<ProfileModel>(
          this as ProfileModel, _$identity);

  /// Serializes this ProfileModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.languageCSV, languageCSV) ||
                other.languageCSV == languageCSV) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.complexion, complexion) ||
                other.complexion == complexion) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.lastSeenTime, lastSeenTime) ||
                other.lastSeenTime == lastSeenTime) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.residentialAddress, residentialAddress) ||
                other.residentialAddress == residentialAddress) &&
            (identical(other.originAddress, originAddress) ||
                other.originAddress == originAddress) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        dateOfBirth,
        age,
        gender,
        languageCSV,
        aboutMe,
        bodyType,
        complexion,
        height,
        weight,
        occupation,
        religion,
        tagline,
        maritalStatus,
        profilePhotoURL,
        profileStatus,
        lastSeenTime,
        isOnline,
        lastModifiedDate,
        createdDate,
        residentialAddress,
        originAddress,
        location
      ]);

  @override
  String toString() {
    return 'ProfileModel(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, languageCSV: $languageCSV, aboutMe: $aboutMe, bodyType: $bodyType, complexion: $complexion, height: $height, weight: $weight, occupation: $occupation, religion: $religion, tagline: $tagline, maritalStatus: $maritalStatus, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus, lastSeenTime: $lastSeenTime, isOnline: $isOnline, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate, residentialAddress: $residentialAddress, originAddress: $originAddress, location: $location)';
  }
}

/// @nodoc
abstract mixin class $ProfileModelCopyWith<$Res> {
  factory $ProfileModelCopyWith(
          ProfileModel value, $Res Function(ProfileModel) _then) =
      _$ProfileModelCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
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
      LocationModel? location});

  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress;
  $OriginAddressModelCopyWith<$Res>? get originAddress;
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class _$ProfileModelCopyWithImpl<$Res> implements $ProfileModelCopyWith<$Res> {
  _$ProfileModelCopyWithImpl(this._self, this._then);

  final ProfileModel _self;
  final $Res Function(ProfileModel) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? languageCSV = freezed,
    Object? aboutMe = freezed,
    Object? bodyType = freezed,
    Object? complexion = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? occupation = freezed,
    Object? religion = freezed,
    Object? tagline = freezed,
    Object? maritalStatus = freezed,
    Object? profilePhotoURL = freezed,
    Object? profileStatus = freezed,
    Object? lastSeenTime = freezed,
    Object? isOnline = freezed,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
    Object? residentialAddress = freezed,
    Object? originAddress = freezed,
    Object? location = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      languageCSV: freezed == languageCSV
          ? _self.languageCSV
          : languageCSV // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutMe: freezed == aboutMe
          ? _self.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyType: freezed == bodyType
          ? _self.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      complexion: freezed == complexion
          ? _self.complexion
          : complexion // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      occupation: freezed == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      religion: freezed == religion
          ? _self.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _self.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      profileStatus: freezed == profileStatus
          ? _self.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSeenTime: freezed == lastSeenTime
          ? _self.lastSeenTime
          : lastSeenTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: freezed == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      residentialAddress: freezed == residentialAddress
          ? _self.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressModel?,
      originAddress: freezed == originAddress
          ? _self.originAddress
          : originAddress // ignore: cast_nullable_to_non_nullable
              as OriginAddressModel?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
    ));
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress {
    if (_self.residentialAddress == null) {
      return null;
    }

    return $ResidentialAddressModelCopyWith<$Res>(_self.residentialAddress!,
        (value) {
      return _then(_self.copyWith(residentialAddress: value));
    });
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OriginAddressModelCopyWith<$Res>? get originAddress {
    if (_self.originAddress == null) {
      return null;
    }

    return $OriginAddressModelCopyWith<$Res>(_self.originAddress!, (value) {
      return _then(_self.copyWith(originAddress: value));
    });
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileModel implements ProfileModel {
  _ProfileModel(
      {this.id,
      this.firstName,
      this.lastName,
      this.dateOfBirth,
      this.age,
      this.gender,
      this.languageCSV,
      this.aboutMe,
      this.bodyType,
      this.complexion,
      this.height,
      this.weight,
      this.occupation,
      this.religion,
      this.tagline,
      this.maritalStatus,
      this.profilePhotoURL,
      this.profileStatus,
      @JsonKey(fromJson: parseCustomDate) this.lastSeenTime,
      this.isOnline,
      @JsonKey(fromJson: parseCustomDate) this.lastModifiedDate,
      @JsonKey(fromJson: parseCustomDate) this.createdDate,
      this.residentialAddress,
      this.originAddress,
      this.location});
  factory _ProfileModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileModelFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? dateOfBirth;
  @override
  final int? age;
  @override
  final int? gender;
  @override
  final String? languageCSV;
  @override
  final String? aboutMe;
  @override
  final String? bodyType;
  @override
  final String? complexion;
  @override
  final double? height;
  @override
  final double? weight;
  @override
  final String? occupation;
  @override
  final String? religion;
  @override
  final String? tagline;
  @override
  final int? maritalStatus;
  @override
  final String? profilePhotoURL;
  @override
  final int? profileStatus;
  @override
  @JsonKey(fromJson: parseCustomDate)
  final DateTime? lastSeenTime;
  @override
  final bool? isOnline;
  @override
  @JsonKey(fromJson: parseCustomDate)
  final DateTime? lastModifiedDate;
  @override
  @JsonKey(fromJson: parseCustomDate)
  final DateTime? createdDate;
  @override
  final ResidentialAddressModel? residentialAddress;
  @override
  final OriginAddressModel? originAddress;
  @override
  final LocationModel? location;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileModelCopyWith<_ProfileModel> get copyWith =>
      __$ProfileModelCopyWithImpl<_ProfileModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.dateOfBirth, dateOfBirth) ||
                other.dateOfBirth == dateOfBirth) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.languageCSV, languageCSV) ||
                other.languageCSV == languageCSV) &&
            (identical(other.aboutMe, aboutMe) || other.aboutMe == aboutMe) &&
            (identical(other.bodyType, bodyType) ||
                other.bodyType == bodyType) &&
            (identical(other.complexion, complexion) ||
                other.complexion == complexion) &&
            (identical(other.height, height) || other.height == height) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.occupation, occupation) ||
                other.occupation == occupation) &&
            (identical(other.religion, religion) ||
                other.religion == religion) &&
            (identical(other.tagline, tagline) || other.tagline == tagline) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.lastSeenTime, lastSeenTime) ||
                other.lastSeenTime == lastSeenTime) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate) &&
            (identical(other.residentialAddress, residentialAddress) ||
                other.residentialAddress == residentialAddress) &&
            (identical(other.originAddress, originAddress) ||
                other.originAddress == originAddress) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        firstName,
        lastName,
        dateOfBirth,
        age,
        gender,
        languageCSV,
        aboutMe,
        bodyType,
        complexion,
        height,
        weight,
        occupation,
        religion,
        tagline,
        maritalStatus,
        profilePhotoURL,
        profileStatus,
        lastSeenTime,
        isOnline,
        lastModifiedDate,
        createdDate,
        residentialAddress,
        originAddress,
        location
      ]);

  @override
  String toString() {
    return 'ProfileModel(id: $id, firstName: $firstName, lastName: $lastName, dateOfBirth: $dateOfBirth, age: $age, gender: $gender, languageCSV: $languageCSV, aboutMe: $aboutMe, bodyType: $bodyType, complexion: $complexion, height: $height, weight: $weight, occupation: $occupation, religion: $religion, tagline: $tagline, maritalStatus: $maritalStatus, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus, lastSeenTime: $lastSeenTime, isOnline: $isOnline, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate, residentialAddress: $residentialAddress, originAddress: $originAddress, location: $location)';
  }
}

/// @nodoc
abstract mixin class _$ProfileModelCopyWith<$Res>
    implements $ProfileModelCopyWith<$Res> {
  factory _$ProfileModelCopyWith(
          _ProfileModel value, $Res Function(_ProfileModel) _then) =
      __$ProfileModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
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
      LocationModel? location});

  @override
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress;
  @override
  $OriginAddressModelCopyWith<$Res>? get originAddress;
  @override
  $LocationModelCopyWith<$Res>? get location;
}

/// @nodoc
class __$ProfileModelCopyWithImpl<$Res>
    implements _$ProfileModelCopyWith<$Res> {
  __$ProfileModelCopyWithImpl(this._self, this._then);

  final _ProfileModel _self;
  final $Res Function(_ProfileModel) _then;

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? dateOfBirth = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? languageCSV = freezed,
    Object? aboutMe = freezed,
    Object? bodyType = freezed,
    Object? complexion = freezed,
    Object? height = freezed,
    Object? weight = freezed,
    Object? occupation = freezed,
    Object? religion = freezed,
    Object? tagline = freezed,
    Object? maritalStatus = freezed,
    Object? profilePhotoURL = freezed,
    Object? profileStatus = freezed,
    Object? lastSeenTime = freezed,
    Object? isOnline = freezed,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
    Object? residentialAddress = freezed,
    Object? originAddress = freezed,
    Object? location = freezed,
  }) {
    return _then(_ProfileModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      dateOfBirth: freezed == dateOfBirth
          ? _self.dateOfBirth
          : dateOfBirth // ignore: cast_nullable_to_non_nullable
              as String?,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int?,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as int?,
      languageCSV: freezed == languageCSV
          ? _self.languageCSV
          : languageCSV // ignore: cast_nullable_to_non_nullable
              as String?,
      aboutMe: freezed == aboutMe
          ? _self.aboutMe
          : aboutMe // ignore: cast_nullable_to_non_nullable
              as String?,
      bodyType: freezed == bodyType
          ? _self.bodyType
          : bodyType // ignore: cast_nullable_to_non_nullable
              as String?,
      complexion: freezed == complexion
          ? _self.complexion
          : complexion // ignore: cast_nullable_to_non_nullable
              as String?,
      height: freezed == height
          ? _self.height
          : height // ignore: cast_nullable_to_non_nullable
              as double?,
      weight: freezed == weight
          ? _self.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double?,
      occupation: freezed == occupation
          ? _self.occupation
          : occupation // ignore: cast_nullable_to_non_nullable
              as String?,
      religion: freezed == religion
          ? _self.religion
          : religion // ignore: cast_nullable_to_non_nullable
              as String?,
      tagline: freezed == tagline
          ? _self.tagline
          : tagline // ignore: cast_nullable_to_non_nullable
              as String?,
      maritalStatus: freezed == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      profileStatus: freezed == profileStatus
          ? _self.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as int?,
      lastSeenTime: freezed == lastSeenTime
          ? _self.lastSeenTime
          : lastSeenTime // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      isOnline: freezed == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      residentialAddress: freezed == residentialAddress
          ? _self.residentialAddress
          : residentialAddress // ignore: cast_nullable_to_non_nullable
              as ResidentialAddressModel?,
      originAddress: freezed == originAddress
          ? _self.originAddress
          : originAddress // ignore: cast_nullable_to_non_nullable
              as OriginAddressModel?,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as LocationModel?,
    ));
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $ResidentialAddressModelCopyWith<$Res>? get residentialAddress {
    if (_self.residentialAddress == null) {
      return null;
    }

    return $ResidentialAddressModelCopyWith<$Res>(_self.residentialAddress!,
        (value) {
      return _then(_self.copyWith(residentialAddress: value));
    });
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $OriginAddressModelCopyWith<$Res>? get originAddress {
    if (_self.originAddress == null) {
      return null;
    }

    return $OriginAddressModelCopyWith<$Res>(_self.originAddress!, (value) {
      return _then(_self.copyWith(originAddress: value));
    });
  }

  /// Create a copy of ProfileModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<$Res>? get location {
    if (_self.location == null) {
      return null;
    }

    return $LocationModelCopyWith<$Res>(_self.location!, (value) {
      return _then(_self.copyWith(location: value));
    });
  }
}

/// @nodoc
mixin _$ResidentialAddressModel {
  String? get city;
  String? get state;
  String? get country;
  String? get zipCode;

  /// Create a copy of ResidentialAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ResidentialAddressModelCopyWith<ResidentialAddressModel> get copyWith =>
      _$ResidentialAddressModelCopyWithImpl<ResidentialAddressModel>(
          this as ResidentialAddressModel, _$identity);

  /// Serializes this ResidentialAddressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ResidentialAddressModel &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, state, country, zipCode);

  @override
  String toString() {
    return 'ResidentialAddressModel(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }
}

/// @nodoc
abstract mixin class $ResidentialAddressModelCopyWith<$Res> {
  factory $ResidentialAddressModelCopyWith(ResidentialAddressModel value,
          $Res Function(ResidentialAddressModel) _then) =
      _$ResidentialAddressModelCopyWithImpl;
  @useResult
  $Res call({String? city, String? state, String? country, String? zipCode});
}

/// @nodoc
class _$ResidentialAddressModelCopyWithImpl<$Res>
    implements $ResidentialAddressModelCopyWith<$Res> {
  _$ResidentialAddressModelCopyWithImpl(this._self, this._then);

  final ResidentialAddressModel _self;
  final $Res Function(ResidentialAddressModel) _then;

  /// Create a copy of ResidentialAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_self.copyWith(
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ResidentialAddressModel implements ResidentialAddressModel {
  _ResidentialAddressModel({this.city, this.state, this.country, this.zipCode});
  factory _ResidentialAddressModel.fromJson(Map<String, dynamic> json) =>
      _$ResidentialAddressModelFromJson(json);

  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? zipCode;

  /// Create a copy of ResidentialAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ResidentialAddressModelCopyWith<_ResidentialAddressModel> get copyWith =>
      __$ResidentialAddressModelCopyWithImpl<_ResidentialAddressModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ResidentialAddressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ResidentialAddressModel &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, state, country, zipCode);

  @override
  String toString() {
    return 'ResidentialAddressModel(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }
}

/// @nodoc
abstract mixin class _$ResidentialAddressModelCopyWith<$Res>
    implements $ResidentialAddressModelCopyWith<$Res> {
  factory _$ResidentialAddressModelCopyWith(_ResidentialAddressModel value,
          $Res Function(_ResidentialAddressModel) _then) =
      __$ResidentialAddressModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? city, String? state, String? country, String? zipCode});
}

/// @nodoc
class __$ResidentialAddressModelCopyWithImpl<$Res>
    implements _$ResidentialAddressModelCopyWith<$Res> {
  __$ResidentialAddressModelCopyWithImpl(this._self, this._then);

  final _ResidentialAddressModel _self;
  final $Res Function(_ResidentialAddressModel) _then;

  /// Create a copy of ResidentialAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_ResidentialAddressModel(
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$OriginAddressModel {
  String? get city;
  String? get state;
  String? get country;
  String? get zipCode;

  /// Create a copy of OriginAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OriginAddressModelCopyWith<OriginAddressModel> get copyWith =>
      _$OriginAddressModelCopyWithImpl<OriginAddressModel>(
          this as OriginAddressModel, _$identity);

  /// Serializes this OriginAddressModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OriginAddressModel &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, state, country, zipCode);

  @override
  String toString() {
    return 'OriginAddressModel(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }
}

/// @nodoc
abstract mixin class $OriginAddressModelCopyWith<$Res> {
  factory $OriginAddressModelCopyWith(
          OriginAddressModel value, $Res Function(OriginAddressModel) _then) =
      _$OriginAddressModelCopyWithImpl;
  @useResult
  $Res call({String? city, String? state, String? country, String? zipCode});
}

/// @nodoc
class _$OriginAddressModelCopyWithImpl<$Res>
    implements $OriginAddressModelCopyWith<$Res> {
  _$OriginAddressModelCopyWithImpl(this._self, this._then);

  final OriginAddressModel _self;
  final $Res Function(OriginAddressModel) _then;

  /// Create a copy of OriginAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_self.copyWith(
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _OriginAddressModel implements OriginAddressModel {
  _OriginAddressModel({this.city, this.state, this.country, this.zipCode});
  factory _OriginAddressModel.fromJson(Map<String, dynamic> json) =>
      _$OriginAddressModelFromJson(json);

  @override
  final String? city;
  @override
  final String? state;
  @override
  final String? country;
  @override
  final String? zipCode;

  /// Create a copy of OriginAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OriginAddressModelCopyWith<_OriginAddressModel> get copyWith =>
      __$OriginAddressModelCopyWithImpl<_OriginAddressModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$OriginAddressModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OriginAddressModel &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.zipCode, zipCode) || other.zipCode == zipCode));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, city, state, country, zipCode);

  @override
  String toString() {
    return 'OriginAddressModel(city: $city, state: $state, country: $country, zipCode: $zipCode)';
  }
}

/// @nodoc
abstract mixin class _$OriginAddressModelCopyWith<$Res>
    implements $OriginAddressModelCopyWith<$Res> {
  factory _$OriginAddressModelCopyWith(
          _OriginAddressModel value, $Res Function(_OriginAddressModel) _then) =
      __$OriginAddressModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? city, String? state, String? country, String? zipCode});
}

/// @nodoc
class __$OriginAddressModelCopyWithImpl<$Res>
    implements _$OriginAddressModelCopyWith<$Res> {
  __$OriginAddressModelCopyWithImpl(this._self, this._then);

  final _OriginAddressModel _self;
  final $Res Function(_OriginAddressModel) _then;

  /// Create a copy of OriginAddressModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? city = freezed,
    Object? state = freezed,
    Object? country = freezed,
    Object? zipCode = freezed,
  }) {
    return _then(_OriginAddressModel(
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
      state: freezed == state
          ? _self.state
          : state // ignore: cast_nullable_to_non_nullable
              as String?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      zipCode: freezed == zipCode
          ? _self.zipCode
          : zipCode // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$LocationModel {
  double? get latitude;
  double? get longitude;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocationModelCopyWith<LocationModel> get copyWith =>
      _$LocationModelCopyWithImpl<LocationModel>(
          this as LocationModel, _$identity);

  /// Serializes this LocationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocationModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'LocationModel(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class $LocationModelCopyWith<$Res> {
  factory $LocationModelCopyWith(
          LocationModel value, $Res Function(LocationModel) _then) =
      _$LocationModelCopyWithImpl;
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class _$LocationModelCopyWithImpl<$Res>
    implements $LocationModelCopyWith<$Res> {
  _$LocationModelCopyWithImpl(this._self, this._then);

  final LocationModel _self;
  final $Res Function(LocationModel) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_self.copyWith(
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _LocationModel implements LocationModel {
  _LocationModel({this.latitude, this.longitude});
  factory _LocationModel.fromJson(Map<String, dynamic> json) =>
      _$LocationModelFromJson(json);

  @override
  final double? latitude;
  @override
  final double? longitude;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocationModelCopyWith<_LocationModel> get copyWith =>
      __$LocationModelCopyWithImpl<_LocationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$LocationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocationModel &&
            (identical(other.latitude, latitude) ||
                other.latitude == latitude) &&
            (identical(other.longitude, longitude) ||
                other.longitude == longitude));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, latitude, longitude);

  @override
  String toString() {
    return 'LocationModel(latitude: $latitude, longitude: $longitude)';
  }
}

/// @nodoc
abstract mixin class _$LocationModelCopyWith<$Res>
    implements $LocationModelCopyWith<$Res> {
  factory _$LocationModelCopyWith(
          _LocationModel value, $Res Function(_LocationModel) _then) =
      __$LocationModelCopyWithImpl;
  @override
  @useResult
  $Res call({double? latitude, double? longitude});
}

/// @nodoc
class __$LocationModelCopyWithImpl<$Res>
    implements _$LocationModelCopyWith<$Res> {
  __$LocationModelCopyWithImpl(this._self, this._then);

  final _LocationModel _self;
  final $Res Function(_LocationModel) _then;

  /// Create a copy of LocationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? latitude = freezed,
    Object? longitude = freezed,
  }) {
    return _then(_LocationModel(
      latitude: freezed == latitude
          ? _self.latitude
          : latitude // ignore: cast_nullable_to_non_nullable
              as double?,
      longitude: freezed == longitude
          ? _self.longitude
          : longitude // ignore: cast_nullable_to_non_nullable
              as double?,
    ));
  }
}

/// @nodoc
mixin _$ProfileCounterModel {
  int? get friendsCount;
  int? get downlinesCount;
  int? get successfulEventCount;
  int? get totalDownlinesCount;
  int? get indirectDownlinesCount;

  /// Create a copy of ProfileCounterModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileCounterModelCopyWith<ProfileCounterModel> get copyWith =>
      _$ProfileCounterModelCopyWithImpl<ProfileCounterModel>(
          this as ProfileCounterModel, _$identity);

  /// Serializes this ProfileCounterModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileCounterModel &&
            (identical(other.friendsCount, friendsCount) ||
                other.friendsCount == friendsCount) &&
            (identical(other.downlinesCount, downlinesCount) ||
                other.downlinesCount == downlinesCount) &&
            (identical(other.successfulEventCount, successfulEventCount) ||
                other.successfulEventCount == successfulEventCount) &&
            (identical(other.totalDownlinesCount, totalDownlinesCount) ||
                other.totalDownlinesCount == totalDownlinesCount) &&
            (identical(other.indirectDownlinesCount, indirectDownlinesCount) ||
                other.indirectDownlinesCount == indirectDownlinesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, friendsCount, downlinesCount,
      successfulEventCount, totalDownlinesCount, indirectDownlinesCount);

  @override
  String toString() {
    return 'ProfileCounterModel(friendsCount: $friendsCount, downlinesCount: $downlinesCount, successfulEventCount: $successfulEventCount, totalDownlinesCount: $totalDownlinesCount, indirectDownlinesCount: $indirectDownlinesCount)';
  }
}

/// @nodoc
abstract mixin class $ProfileCounterModelCopyWith<$Res> {
  factory $ProfileCounterModelCopyWith(
          ProfileCounterModel value, $Res Function(ProfileCounterModel) _then) =
      _$ProfileCounterModelCopyWithImpl;
  @useResult
  $Res call(
      {int? friendsCount,
      int? downlinesCount,
      int? successfulEventCount,
      int? totalDownlinesCount,
      int? indirectDownlinesCount});
}

/// @nodoc
class _$ProfileCounterModelCopyWithImpl<$Res>
    implements $ProfileCounterModelCopyWith<$Res> {
  _$ProfileCounterModelCopyWithImpl(this._self, this._then);

  final ProfileCounterModel _self;
  final $Res Function(ProfileCounterModel) _then;

  /// Create a copy of ProfileCounterModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? friendsCount = freezed,
    Object? downlinesCount = freezed,
    Object? successfulEventCount = freezed,
    Object? totalDownlinesCount = freezed,
    Object? indirectDownlinesCount = freezed,
  }) {
    return _then(_self.copyWith(
      friendsCount: freezed == friendsCount
          ? _self.friendsCount
          : friendsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      downlinesCount: freezed == downlinesCount
          ? _self.downlinesCount
          : downlinesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      successfulEventCount: freezed == successfulEventCount
          ? _self.successfulEventCount
          : successfulEventCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDownlinesCount: freezed == totalDownlinesCount
          ? _self.totalDownlinesCount
          : totalDownlinesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      indirectDownlinesCount: freezed == indirectDownlinesCount
          ? _self.indirectDownlinesCount
          : indirectDownlinesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileCounterModel implements ProfileCounterModel {
  _ProfileCounterModel(
      {this.friendsCount,
      this.downlinesCount,
      this.successfulEventCount,
      this.totalDownlinesCount,
      this.indirectDownlinesCount});
  factory _ProfileCounterModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileCounterModelFromJson(json);

  @override
  final int? friendsCount;
  @override
  final int? downlinesCount;
  @override
  final int? successfulEventCount;
  @override
  final int? totalDownlinesCount;
  @override
  final int? indirectDownlinesCount;

  /// Create a copy of ProfileCounterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileCounterModelCopyWith<_ProfileCounterModel> get copyWith =>
      __$ProfileCounterModelCopyWithImpl<_ProfileCounterModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileCounterModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileCounterModel &&
            (identical(other.friendsCount, friendsCount) ||
                other.friendsCount == friendsCount) &&
            (identical(other.downlinesCount, downlinesCount) ||
                other.downlinesCount == downlinesCount) &&
            (identical(other.successfulEventCount, successfulEventCount) ||
                other.successfulEventCount == successfulEventCount) &&
            (identical(other.totalDownlinesCount, totalDownlinesCount) ||
                other.totalDownlinesCount == totalDownlinesCount) &&
            (identical(other.indirectDownlinesCount, indirectDownlinesCount) ||
                other.indirectDownlinesCount == indirectDownlinesCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, friendsCount, downlinesCount,
      successfulEventCount, totalDownlinesCount, indirectDownlinesCount);

  @override
  String toString() {
    return 'ProfileCounterModel(friendsCount: $friendsCount, downlinesCount: $downlinesCount, successfulEventCount: $successfulEventCount, totalDownlinesCount: $totalDownlinesCount, indirectDownlinesCount: $indirectDownlinesCount)';
  }
}

/// @nodoc
abstract mixin class _$ProfileCounterModelCopyWith<$Res>
    implements $ProfileCounterModelCopyWith<$Res> {
  factory _$ProfileCounterModelCopyWith(_ProfileCounterModel value,
          $Res Function(_ProfileCounterModel) _then) =
      __$ProfileCounterModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {int? friendsCount,
      int? downlinesCount,
      int? successfulEventCount,
      int? totalDownlinesCount,
      int? indirectDownlinesCount});
}

/// @nodoc
class __$ProfileCounterModelCopyWithImpl<$Res>
    implements _$ProfileCounterModelCopyWith<$Res> {
  __$ProfileCounterModelCopyWithImpl(this._self, this._then);

  final _ProfileCounterModel _self;
  final $Res Function(_ProfileCounterModel) _then;

  /// Create a copy of ProfileCounterModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? friendsCount = freezed,
    Object? downlinesCount = freezed,
    Object? successfulEventCount = freezed,
    Object? totalDownlinesCount = freezed,
    Object? indirectDownlinesCount = freezed,
  }) {
    return _then(_ProfileCounterModel(
      friendsCount: freezed == friendsCount
          ? _self.friendsCount
          : friendsCount // ignore: cast_nullable_to_non_nullable
              as int?,
      downlinesCount: freezed == downlinesCount
          ? _self.downlinesCount
          : downlinesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      successfulEventCount: freezed == successfulEventCount
          ? _self.successfulEventCount
          : successfulEventCount // ignore: cast_nullable_to_non_nullable
              as int?,
      totalDownlinesCount: freezed == totalDownlinesCount
          ? _self.totalDownlinesCount
          : totalDownlinesCount // ignore: cast_nullable_to_non_nullable
              as int?,
      indirectDownlinesCount: freezed == indirectDownlinesCount
          ? _self.indirectDownlinesCount
          : indirectDownlinesCount // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
mixin _$ReferralInfoModel {
  String? get referralCode;
  String? get referralLink;

  /// Create a copy of ReferralInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ReferralInfoModelCopyWith<ReferralInfoModel> get copyWith =>
      _$ReferralInfoModelCopyWithImpl<ReferralInfoModel>(
          this as ReferralInfoModel, _$identity);

  /// Serializes this ReferralInfoModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ReferralInfoModel &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referralCode, referralLink);

  @override
  String toString() {
    return 'ReferralInfoModel(referralCode: $referralCode, referralLink: $referralLink)';
  }
}

/// @nodoc
abstract mixin class $ReferralInfoModelCopyWith<$Res> {
  factory $ReferralInfoModelCopyWith(
          ReferralInfoModel value, $Res Function(ReferralInfoModel) _then) =
      _$ReferralInfoModelCopyWithImpl;
  @useResult
  $Res call({String? referralCode, String? referralLink});
}

/// @nodoc
class _$ReferralInfoModelCopyWithImpl<$Res>
    implements $ReferralInfoModelCopyWith<$Res> {
  _$ReferralInfoModelCopyWithImpl(this._self, this._then);

  final ReferralInfoModel _self;
  final $Res Function(ReferralInfoModel) _then;

  /// Create a copy of ReferralInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? referralCode = freezed,
    Object? referralLink = freezed,
  }) {
    return _then(_self.copyWith(
      referralCode: freezed == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referralLink: freezed == referralLink
          ? _self.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ReferralInfoModel implements ReferralInfoModel {
  _ReferralInfoModel({this.referralCode, this.referralLink});
  factory _ReferralInfoModel.fromJson(Map<String, dynamic> json) =>
      _$ReferralInfoModelFromJson(json);

  @override
  final String? referralCode;
  @override
  final String? referralLink;

  /// Create a copy of ReferralInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ReferralInfoModelCopyWith<_ReferralInfoModel> get copyWith =>
      __$ReferralInfoModelCopyWithImpl<_ReferralInfoModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ReferralInfoModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ReferralInfoModel &&
            (identical(other.referralCode, referralCode) ||
                other.referralCode == referralCode) &&
            (identical(other.referralLink, referralLink) ||
                other.referralLink == referralLink));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, referralCode, referralLink);

  @override
  String toString() {
    return 'ReferralInfoModel(referralCode: $referralCode, referralLink: $referralLink)';
  }
}

/// @nodoc
abstract mixin class _$ReferralInfoModelCopyWith<$Res>
    implements $ReferralInfoModelCopyWith<$Res> {
  factory _$ReferralInfoModelCopyWith(
          _ReferralInfoModel value, $Res Function(_ReferralInfoModel) _then) =
      __$ReferralInfoModelCopyWithImpl;
  @override
  @useResult
  $Res call({String? referralCode, String? referralLink});
}

/// @nodoc
class __$ReferralInfoModelCopyWithImpl<$Res>
    implements _$ReferralInfoModelCopyWith<$Res> {
  __$ReferralInfoModelCopyWithImpl(this._self, this._then);

  final _ReferralInfoModel _self;
  final $Res Function(_ReferralInfoModel) _then;

  /// Create a copy of ReferralInfoModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? referralCode = freezed,
    Object? referralLink = freezed,
  }) {
    return _then(_ReferralInfoModel(
      referralCode: freezed == referralCode
          ? _self.referralCode
          : referralCode // ignore: cast_nullable_to_non_nullable
              as String?,
      referralLink: freezed == referralLink
          ? _self.referralLink
          : referralLink // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$InterestModel {
  int? get id;
  String? get title;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InterestModelCopyWith<InterestModel> get copyWith =>
      _$InterestModelCopyWithImpl<InterestModel>(
          this as InterestModel, _$identity);

  /// Serializes this InterestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InterestModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @override
  String toString() {
    return 'InterestModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class $InterestModelCopyWith<$Res> {
  factory $InterestModelCopyWith(
          InterestModel value, $Res Function(InterestModel) _then) =
      _$InterestModelCopyWithImpl;
  @useResult
  $Res call({int? id, String? title});
}

/// @nodoc
class _$InterestModelCopyWithImpl<$Res>
    implements $InterestModelCopyWith<$Res> {
  _$InterestModelCopyWithImpl(this._self, this._then);

  final InterestModel _self;
  final $Res Function(InterestModel) _then;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _InterestModel implements InterestModel {
  _InterestModel({this.id, this.title});
  factory _InterestModel.fromJson(Map<String, dynamic> json) =>
      _$InterestModelFromJson(json);

  @override
  final int? id;
  @override
  final String? title;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$InterestModelCopyWith<_InterestModel> get copyWith =>
      __$InterestModelCopyWithImpl<_InterestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$InterestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _InterestModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, title);

  @override
  String toString() {
    return 'InterestModel(id: $id, title: $title)';
  }
}

/// @nodoc
abstract mixin class _$InterestModelCopyWith<$Res>
    implements $InterestModelCopyWith<$Res> {
  factory _$InterestModelCopyWith(
          _InterestModel value, $Res Function(_InterestModel) _then) =
      __$InterestModelCopyWithImpl;
  @override
  @useResult
  $Res call({int? id, String? title});
}

/// @nodoc
class __$InterestModelCopyWithImpl<$Res>
    implements _$InterestModelCopyWith<$Res> {
  __$InterestModelCopyWithImpl(this._self, this._then);

  final _InterestModel _self;
  final $Res Function(_InterestModel) _then;

  /// Create a copy of InterestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? title = freezed,
  }) {
    return _then(_InterestModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as int?,
      title: freezed == title
          ? _self.title
          : title // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$UserDownlines {
  String? get id;
  String? get firstName;
  String? get lastName;
  String? get userName;
  String? get profilePhotoURL;
  @JsonKey(fromJson: parseCustomDate)
  DateTime? get createdDate;

  /// Create a copy of UserDownlines
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserDownlinesCopyWith<UserDownlines> get copyWith =>
      _$UserDownlinesCopyWithImpl<UserDownlines>(
          this as UserDownlines, _$identity);

  /// Serializes this UserDownlines to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserDownlines &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      userName, profilePhotoURL, createdDate);

  @override
  String toString() {
    return 'UserDownlines(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, profilePhotoURL: $profilePhotoURL, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $UserDownlinesCopyWith<$Res> {
  factory $UserDownlinesCopyWith(
          UserDownlines value, $Res Function(UserDownlines) _then) =
      _$UserDownlinesCopyWithImpl;
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? userName,
      String? profilePhotoURL,
      @JsonKey(fromJson: parseCustomDate) DateTime? createdDate});
}

/// @nodoc
class _$UserDownlinesCopyWithImpl<$Res>
    implements $UserDownlinesCopyWith<$Res> {
  _$UserDownlinesCopyWithImpl(this._self, this._then);

  final UserDownlines _self;
  final $Res Function(UserDownlines) _then;

  /// Create a copy of UserDownlines
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? profilePhotoURL = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserDownlines implements UserDownlines {
  _UserDownlines(
      {this.id,
      this.firstName,
      this.lastName,
      this.userName,
      this.profilePhotoURL,
      @JsonKey(fromJson: parseCustomDate) this.createdDate});
  factory _UserDownlines.fromJson(Map<String, dynamic> json) =>
      _$UserDownlinesFromJson(json);

  @override
  final String? id;
  @override
  final String? firstName;
  @override
  final String? lastName;
  @override
  final String? userName;
  @override
  final String? profilePhotoURL;
  @override
  @JsonKey(fromJson: parseCustomDate)
  final DateTime? createdDate;

  /// Create a copy of UserDownlines
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserDownlinesCopyWith<_UserDownlines> get copyWith =>
      __$UserDownlinesCopyWithImpl<_UserDownlines>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserDownlinesToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserDownlines &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      userName, profilePhotoURL, createdDate);

  @override
  String toString() {
    return 'UserDownlines(id: $id, firstName: $firstName, lastName: $lastName, userName: $userName, profilePhotoURL: $profilePhotoURL, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$UserDownlinesCopyWith<$Res>
    implements $UserDownlinesCopyWith<$Res> {
  factory _$UserDownlinesCopyWith(
          _UserDownlines value, $Res Function(_UserDownlines) _then) =
      __$UserDownlinesCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? id,
      String? firstName,
      String? lastName,
      String? userName,
      String? profilePhotoURL,
      @JsonKey(fromJson: parseCustomDate) DateTime? createdDate});
}

/// @nodoc
class __$UserDownlinesCopyWithImpl<$Res>
    implements _$UserDownlinesCopyWith<$Res> {
  __$UserDownlinesCopyWithImpl(this._self, this._then);

  final _UserDownlines _self;
  final $Res Function(_UserDownlines) _then;

  /// Create a copy of UserDownlines
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? firstName = freezed,
    Object? lastName = freezed,
    Object? userName = freezed,
    Object? profilePhotoURL = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_UserDownlines(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      firstName: freezed == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String?,
      lastName: freezed == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String?,
      userName: freezed == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String?,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
mixin _$UserCarousels {
  String? get id;
  String? get carouselPhotoUrl;

  /// Create a copy of UserCarousels
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserCarouselsCopyWith<UserCarousels> get copyWith =>
      _$UserCarouselsCopyWithImpl<UserCarousels>(
          this as UserCarousels, _$identity);

  /// Serializes this UserCarousels to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserCarousels &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.carouselPhotoUrl, carouselPhotoUrl) ||
                other.carouselPhotoUrl == carouselPhotoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, carouselPhotoUrl);

  @override
  String toString() {
    return 'UserCarousels(id: $id, carouselPhotoUrl: $carouselPhotoUrl)';
  }
}

/// @nodoc
abstract mixin class $UserCarouselsCopyWith<$Res> {
  factory $UserCarouselsCopyWith(
          UserCarousels value, $Res Function(UserCarousels) _then) =
      _$UserCarouselsCopyWithImpl;
  @useResult
  $Res call({String? id, String? carouselPhotoUrl});
}

/// @nodoc
class _$UserCarouselsCopyWithImpl<$Res>
    implements $UserCarouselsCopyWith<$Res> {
  _$UserCarouselsCopyWithImpl(this._self, this._then);

  final UserCarousels _self;
  final $Res Function(UserCarousels) _then;

  /// Create a copy of UserCarousels
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? carouselPhotoUrl = freezed,
  }) {
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      carouselPhotoUrl: freezed == carouselPhotoUrl
          ? _self.carouselPhotoUrl
          : carouselPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserCarousels implements UserCarousels {
  _UserCarousels({this.id, this.carouselPhotoUrl});
  factory _UserCarousels.fromJson(Map<String, dynamic> json) =>
      _$UserCarouselsFromJson(json);

  @override
  final String? id;
  @override
  final String? carouselPhotoUrl;

  /// Create a copy of UserCarousels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserCarouselsCopyWith<_UserCarousels> get copyWith =>
      __$UserCarouselsCopyWithImpl<_UserCarousels>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserCarouselsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserCarousels &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.carouselPhotoUrl, carouselPhotoUrl) ||
                other.carouselPhotoUrl == carouselPhotoUrl));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, carouselPhotoUrl);

  @override
  String toString() {
    return 'UserCarousels(id: $id, carouselPhotoUrl: $carouselPhotoUrl)';
  }
}

/// @nodoc
abstract mixin class _$UserCarouselsCopyWith<$Res>
    implements $UserCarouselsCopyWith<$Res> {
  factory _$UserCarouselsCopyWith(
          _UserCarousels value, $Res Function(_UserCarousels) _then) =
      __$UserCarouselsCopyWithImpl;
  @override
  @useResult
  $Res call({String? id, String? carouselPhotoUrl});
}

/// @nodoc
class __$UserCarouselsCopyWithImpl<$Res>
    implements _$UserCarouselsCopyWith<$Res> {
  __$UserCarouselsCopyWithImpl(this._self, this._then);

  final _UserCarousels _self;
  final $Res Function(_UserCarousels) _then;

  /// Create a copy of UserCarousels
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = freezed,
    Object? carouselPhotoUrl = freezed,
  }) {
    return _then(_UserCarousels(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      carouselPhotoUrl: freezed == carouselPhotoUrl
          ? _self.carouselPhotoUrl
          : carouselPhotoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$MatchCriteriaModel {
  String? get gender;
  int? get minAge;
  int? get maxAge;
  double? get distance;
  String? get country;
  String? get city;

  /// Create a copy of MatchCriteriaModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchCriteriaModelCopyWith<MatchCriteriaModel> get copyWith =>
      _$MatchCriteriaModelCopyWithImpl<MatchCriteriaModel>(
          this as MatchCriteriaModel, _$identity);

  /// Serializes this MatchCriteriaModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchCriteriaModel &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gender, minAge, maxAge, distance, country, city);

  @override
  String toString() {
    return 'MatchCriteriaModel(gender: $gender, minAge: $minAge, maxAge: $maxAge, distance: $distance, country: $country, city: $city)';
  }
}

/// @nodoc
abstract mixin class $MatchCriteriaModelCopyWith<$Res> {
  factory $MatchCriteriaModelCopyWith(
          MatchCriteriaModel value, $Res Function(MatchCriteriaModel) _then) =
      _$MatchCriteriaModelCopyWithImpl;
  @useResult
  $Res call(
      {String? gender,
      int? minAge,
      int? maxAge,
      double? distance,
      String? country,
      String? city});
}

/// @nodoc
class _$MatchCriteriaModelCopyWithImpl<$Res>
    implements $MatchCriteriaModelCopyWith<$Res> {
  _$MatchCriteriaModelCopyWithImpl(this._self, this._then);

  final MatchCriteriaModel _self;
  final $Res Function(MatchCriteriaModel) _then;

  /// Create a copy of MatchCriteriaModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? gender = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? distance = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_self.copyWith(
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      minAge: freezed == minAge
          ? _self.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int?,
      maxAge: freezed == maxAge
          ? _self.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MatchCriteriaModel implements MatchCriteriaModel {
  _MatchCriteriaModel(
      {this.gender,
      this.minAge,
      this.maxAge,
      this.distance,
      this.country,
      this.city});
  factory _MatchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$MatchCriteriaModelFromJson(json);

  @override
  final String? gender;
  @override
  final int? minAge;
  @override
  final int? maxAge;
  @override
  final double? distance;
  @override
  final String? country;
  @override
  final String? city;

  /// Create a copy of MatchCriteriaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchCriteriaModelCopyWith<_MatchCriteriaModel> get copyWith =>
      __$MatchCriteriaModelCopyWithImpl<_MatchCriteriaModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchCriteriaModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchCriteriaModel &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, gender, minAge, maxAge, distance, country, city);

  @override
  String toString() {
    return 'MatchCriteriaModel(gender: $gender, minAge: $minAge, maxAge: $maxAge, distance: $distance, country: $country, city: $city)';
  }
}

/// @nodoc
abstract mixin class _$MatchCriteriaModelCopyWith<$Res>
    implements $MatchCriteriaModelCopyWith<$Res> {
  factory _$MatchCriteriaModelCopyWith(
          _MatchCriteriaModel value, $Res Function(_MatchCriteriaModel) _then) =
      __$MatchCriteriaModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String? gender,
      int? minAge,
      int? maxAge,
      double? distance,
      String? country,
      String? city});
}

/// @nodoc
class __$MatchCriteriaModelCopyWithImpl<$Res>
    implements _$MatchCriteriaModelCopyWith<$Res> {
  __$MatchCriteriaModelCopyWithImpl(this._self, this._then);

  final _MatchCriteriaModel _self;
  final $Res Function(_MatchCriteriaModel) _then;

  /// Create a copy of MatchCriteriaModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? gender = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? distance = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_MatchCriteriaModel(
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String?,
      minAge: freezed == minAge
          ? _self.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int?,
      maxAge: freezed == maxAge
          ? _self.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double?,
      country: freezed == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String?,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
