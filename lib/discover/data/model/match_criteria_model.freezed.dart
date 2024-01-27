// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_criteria_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchCriteriaModel _$MatchCriteriaModelFromJson(Map<String, dynamic> json) {
  return _MatchCriteriaModel.fromJson(json);
}

/// @nodoc
mixin _$MatchCriteriaModel {
  String get userId => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get minAge => throw _privateConstructorUsedError;
  int get maxAge => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String? get city => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchCriteriaModelCopyWith<MatchCriteriaModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchCriteriaModelCopyWith<$Res> {
  factory $MatchCriteriaModelCopyWith(
          MatchCriteriaModel value, $Res Function(MatchCriteriaModel) then) =
      _$MatchCriteriaModelCopyWithImpl<$Res, MatchCriteriaModel>;
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
class _$MatchCriteriaModelCopyWithImpl<$Res, $Val extends MatchCriteriaModel>
    implements $MatchCriteriaModelCopyWith<$Res> {
  _$MatchCriteriaModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchCriteriaModelImplCopyWith<$Res>
    implements $MatchCriteriaModelCopyWith<$Res> {
  factory _$$MatchCriteriaModelImplCopyWith(_$MatchCriteriaModelImpl value,
          $Res Function(_$MatchCriteriaModelImpl) then) =
      __$$MatchCriteriaModelImplCopyWithImpl<$Res>;
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
class __$$MatchCriteriaModelImplCopyWithImpl<$Res>
    extends _$MatchCriteriaModelCopyWithImpl<$Res, _$MatchCriteriaModelImpl>
    implements _$$MatchCriteriaModelImplCopyWith<$Res> {
  __$$MatchCriteriaModelImplCopyWithImpl(_$MatchCriteriaModelImpl _value,
      $Res Function(_$MatchCriteriaModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$MatchCriteriaModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      minAge: null == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as int,
      maxAge: null == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MatchCriteriaModelImpl implements _MatchCriteriaModel {
  _$MatchCriteriaModelImpl(
      {required this.userId,
      required this.gender,
      required this.minAge,
      required this.maxAge,
      required this.distance,
      required this.country,
      required this.city});

  factory _$MatchCriteriaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchCriteriaModelImplFromJson(json);

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

  @override
  String toString() {
    return 'MatchCriteriaModel(userId: $userId, gender: $gender, minAge: $minAge, maxAge: $maxAge, distance: $distance, country: $country, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchCriteriaModelImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.minAge, minAge) || other.minAge == minAge) &&
            (identical(other.maxAge, maxAge) || other.maxAge == maxAge) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, gender, minAge, maxAge, distance, country, city);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchCriteriaModelImplCopyWith<_$MatchCriteriaModelImpl> get copyWith =>
      __$$MatchCriteriaModelImplCopyWithImpl<_$MatchCriteriaModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchCriteriaModelImplToJson(
      this,
    );
  }
}

abstract class _MatchCriteriaModel implements MatchCriteriaModel {
  factory _MatchCriteriaModel(
      {required final String userId,
      required final String gender,
      required final int minAge,
      required final int maxAge,
      required final int distance,
      required final String country,
      required final String? city}) = _$MatchCriteriaModelImpl;

  factory _MatchCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$MatchCriteriaModelImpl.fromJson;

  @override
  String get userId;
  @override
  String get gender;
  @override
  int get minAge;
  @override
  int get maxAge;
  @override
  int get distance;
  @override
  String get country;
  @override
  String? get city;
  @override
  @JsonKey(ignore: true)
  _$$MatchCriteriaModelImplCopyWith<_$MatchCriteriaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
