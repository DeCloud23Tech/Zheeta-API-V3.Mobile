// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_criteria_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchCriteriaModel {
  String get userId;
  String get gender;
  int get minAge;
  int get maxAge;
  int get distance;
  String get country;
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
            (identical(other.userId, userId) || other.userId == userId) &&
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
  int get hashCode => Object.hash(
      runtimeType, userId, gender, minAge, maxAge, distance, country, city);

  @override
  String toString() {
    return 'MatchCriteriaModel(userId: $userId, gender: $gender, minAge: $minAge, maxAge: $maxAge, distance: $distance, country: $country, city: $city)';
  }
}

/// @nodoc
abstract mixin class $MatchCriteriaModelCopyWith<$Res> {
  factory $MatchCriteriaModelCopyWith(
          MatchCriteriaModel value, $Res Function(MatchCriteriaModel) _then) =
      _$MatchCriteriaModelCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String gender,
      int minAge,
      int maxAge,
      int distance,
      String country,
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
    Object? userId = null,
    Object? gender = null,
    Object? minAge = null,
    Object? maxAge = null,
    Object? distance = null,
    Object? country = null,
    Object? city = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _self.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _self.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
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
      {required this.userId,
      required this.gender,
      required this.minAge,
      required this.maxAge,
      required this.distance,
      required this.country,
      required this.city});
  factory _MatchCriteriaModel.fromJson(Map<String, dynamic> json) =>
      _$MatchCriteriaModelFromJson(json);

  @override
  final String userId;
  @override
  final String gender;
  @override
  final int minAge;
  @override
  final int maxAge;
  @override
  final int distance;
  @override
  final String country;
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
            (identical(other.userId, userId) || other.userId == userId) &&
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
  int get hashCode => Object.hash(
      runtimeType, userId, gender, minAge, maxAge, distance, country, city);

  @override
  String toString() {
    return 'MatchCriteriaModel(userId: $userId, gender: $gender, minAge: $minAge, maxAge: $maxAge, distance: $distance, country: $country, city: $city)';
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
      {String userId,
      String gender,
      int minAge,
      int maxAge,
      int distance,
      String country,
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
    Object? userId = null,
    Object? gender = null,
    Object? minAge = null,
    Object? maxAge = null,
    Object? distance = null,
    Object? country = null,
    Object? city = freezed,
  }) {
    return _then(_MatchCriteriaModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _self.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _self.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
