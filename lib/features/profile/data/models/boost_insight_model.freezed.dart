// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'boost_insight_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BoostInsightModel {
  String get userId;
  String get photoUrlForAds;
  String get caption;
  String get targetCountry;
  String get targetGender;
  String get targetCity;
  int get minAge;
  int get maxAge;
  int get maritalStatus;
  int get targetUsersNumber;
  int get targetUsersReached;
  int get duration;
  double get adsCost;

  /// Create a copy of BoostInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BoostInsightModelCopyWith<BoostInsightModel> get copyWith =>
      _$BoostInsightModelCopyWithImpl<BoostInsightModel>(
          this as BoostInsightModel, _$identity);

  /// Serializes this BoostInsightModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BoostInsightModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.photoUrlForAds, photoUrlForAds) ||
                other.photoUrlForAds == photoUrlForAds) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.targetCountry, targetCountry) ||
                other.targetCountry == targetCountry) &&
            (identical(other.targetGender, targetGender) ||
                other.targetGender == targetGender) &&
            (identical(other.targetCity, targetCity) ||
                other.targetCity == targetCity) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.targetUsersNumber, targetUsersNumber) ||
                other.targetUsersNumber == targetUsersNumber) &&
            (identical(other.targetUsersReached, targetUsersReached) ||
                other.targetUsersReached == targetUsersReached) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.adsCost, adsCost) || other.adsCost == adsCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      photoUrlForAds,
      caption,
      targetCountry,
      targetGender,
      targetCity,
      minAge,
      maxAge,
      maritalStatus,
      targetUsersNumber,
      targetUsersReached,
      duration,
      adsCost);

  @override
  String toString() {
    return 'BoostInsightModel(userId: $userId, photoUrlForAds: $photoUrlForAds, caption: $caption, targetCountry: $targetCountry, targetGender: $targetGender, targetCity: $targetCity, minAge: $minAge, maxAge: $maxAge, maritalStatus: $maritalStatus, targetUsersNumber: $targetUsersNumber, targetUsersReached: $targetUsersReached, duration: $duration, adsCost: $adsCost)';
  }
}

/// @nodoc
abstract mixin class $BoostInsightModelCopyWith<$Res> {
  factory $BoostInsightModelCopyWith(
          BoostInsightModel value, $Res Function(BoostInsightModel) _then) =
      _$BoostInsightModelCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String photoUrlForAds,
      String caption,
      String targetCountry,
      String targetGender,
      String targetCity,
      int minAge,
      int maxAge,
      int maritalStatus,
      int targetUsersNumber,
      int targetUsersReached,
      int duration,
      double adsCost});
}

/// @nodoc
class _$BoostInsightModelCopyWithImpl<$Res>
    implements $BoostInsightModelCopyWith<$Res> {
  _$BoostInsightModelCopyWithImpl(this._self, this._then);

  final BoostInsightModel _self;
  final $Res Function(BoostInsightModel) _then;

  /// Create a copy of BoostInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? photoUrlForAds = null,
    Object? caption = null,
    Object? targetCountry = null,
    Object? targetGender = null,
    Object? targetCity = null,
    Object? minAge = null,
    Object? maxAge = null,
    Object? maritalStatus = null,
    Object? targetUsersNumber = null,
    Object? targetUsersReached = null,
    Object? duration = null,
    Object? adsCost = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrlForAds: null == photoUrlForAds
          ? _self.photoUrlForAds
          : photoUrlForAds // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      targetCountry: null == targetCountry
          ? _self.targetCountry
          : targetCountry // ignore: cast_nullable_to_non_nullable
              as String,
      targetGender: null == targetGender
          ? _self.targetGender
          : targetGender // ignore: cast_nullable_to_non_nullable
              as String,
      targetCity: null == targetCity
          ? _self.targetCity
          : targetCity // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _self.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _self.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      maritalStatus: null == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as int,
      targetUsersNumber: null == targetUsersNumber
          ? _self.targetUsersNumber
          : targetUsersNumber // ignore: cast_nullable_to_non_nullable
              as int,
      targetUsersReached: null == targetUsersReached
          ? _self.targetUsersReached
          : targetUsersReached // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      adsCost: null == adsCost
          ? _self.adsCost
          : adsCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BoostInsightModel implements BoostInsightModel {
  const _BoostInsightModel(
      {required this.userId,
      required this.photoUrlForAds,
      required this.caption,
      required this.targetCountry,
      required this.targetGender,
      required this.targetCity,
      required this.minAge,
      required this.maxAge,
      required this.maritalStatus,
      required this.targetUsersNumber,
      required this.targetUsersReached,
      required this.duration,
      required this.adsCost});
  factory _BoostInsightModel.fromJson(Map<String, dynamic> json) =>
      _$BoostInsightModelFromJson(json);

  @override
  final String userId;
  @override
  final String photoUrlForAds;
  @override
  final String caption;
  @override
  final String targetCountry;
  @override
  final String targetGender;
  @override
  final String targetCity;
  @override
  final int minAge;
  @override
  final int maxAge;
  @override
  final int maritalStatus;
  @override
  final int targetUsersNumber;
  @override
  final int targetUsersReached;
  @override
  final int duration;
  @override
  final double adsCost;

  /// Create a copy of BoostInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BoostInsightModelCopyWith<_BoostInsightModel> get copyWith =>
      __$BoostInsightModelCopyWithImpl<_BoostInsightModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BoostInsightModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BoostInsightModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.photoUrlForAds, photoUrlForAds) ||
                other.photoUrlForAds == photoUrlForAds) &&
            (identical(other.caption, caption) || other.caption == caption) &&
            (identical(other.targetCountry, targetCountry) ||
                other.targetCountry == targetCountry) &&
            (identical(other.targetGender, targetGender) ||
                other.targetGender == targetGender) &&
            (identical(other.targetCity, targetCity) ||
                other.targetCity == targetCity) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.maritalStatus, maritalStatus) ||
                other.maritalStatus == maritalStatus) &&
            (identical(other.targetUsersNumber, targetUsersNumber) ||
                other.targetUsersNumber == targetUsersNumber) &&
            (identical(other.targetUsersReached, targetUsersReached) ||
                other.targetUsersReached == targetUsersReached) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.adsCost, adsCost) || other.adsCost == adsCost));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      userId,
      photoUrlForAds,
      caption,
      targetCountry,
      targetGender,
      targetCity,
      minAge,
      maxAge,
      maritalStatus,
      targetUsersNumber,
      targetUsersReached,
      duration,
      adsCost);

  @override
  String toString() {
    return 'BoostInsightModel(userId: $userId, photoUrlForAds: $photoUrlForAds, caption: $caption, targetCountry: $targetCountry, targetGender: $targetGender, targetCity: $targetCity, minAge: $minAge, maxAge: $maxAge, maritalStatus: $maritalStatus, targetUsersNumber: $targetUsersNumber, targetUsersReached: $targetUsersReached, duration: $duration, adsCost: $adsCost)';
  }
}

/// @nodoc
abstract mixin class _$BoostInsightModelCopyWith<$Res>
    implements $BoostInsightModelCopyWith<$Res> {
  factory _$BoostInsightModelCopyWith(
          _BoostInsightModel value, $Res Function(_BoostInsightModel) _then) =
      __$BoostInsightModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String photoUrlForAds,
      String caption,
      String targetCountry,
      String targetGender,
      String targetCity,
      int minAge,
      int maxAge,
      int maritalStatus,
      int targetUsersNumber,
      int targetUsersReached,
      int duration,
      double adsCost});
}

/// @nodoc
class __$BoostInsightModelCopyWithImpl<$Res>
    implements _$BoostInsightModelCopyWith<$Res> {
  __$BoostInsightModelCopyWithImpl(this._self, this._then);

  final _BoostInsightModel _self;
  final $Res Function(_BoostInsightModel) _then;

  /// Create a copy of BoostInsightModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? photoUrlForAds = null,
    Object? caption = null,
    Object? targetCountry = null,
    Object? targetGender = null,
    Object? targetCity = null,
    Object? minAge = null,
    Object? maxAge = null,
    Object? maritalStatus = null,
    Object? targetUsersNumber = null,
    Object? targetUsersReached = null,
    Object? duration = null,
    Object? adsCost = null,
  }) {
    return _then(_BoostInsightModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      photoUrlForAds: null == photoUrlForAds
          ? _self.photoUrlForAds
          : photoUrlForAds // ignore: cast_nullable_to_non_nullable
              as String,
      caption: null == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String,
      targetCountry: null == targetCountry
          ? _self.targetCountry
          : targetCountry // ignore: cast_nullable_to_non_nullable
              as String,
      targetGender: null == targetGender
          ? _self.targetGender
          : targetGender // ignore: cast_nullable_to_non_nullable
              as String,
      targetCity: null == targetCity
          ? _self.targetCity
          : targetCity // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _self.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _self.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      maritalStatus: null == maritalStatus
          ? _self.maritalStatus
          : maritalStatus // ignore: cast_nullable_to_non_nullable
              as int,
      targetUsersNumber: null == targetUsersNumber
          ? _self.targetUsersNumber
          : targetUsersNumber // ignore: cast_nullable_to_non_nullable
              as int,
      targetUsersReached: null == targetUsersReached
          ? _self.targetUsersReached
          : targetUsersReached // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _self.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      adsCost: null == adsCost
          ? _self.adsCost
          : adsCost // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

// dart format on
