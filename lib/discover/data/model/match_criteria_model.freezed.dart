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
  dynamic get userId => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  dynamic get minAge => throw _privateConstructorUsedError;
  dynamic get maxAge => throw _privateConstructorUsedError;
  dynamic get distance => throw _privateConstructorUsedError;
  dynamic get country => throw _privateConstructorUsedError;
  dynamic get city => throw _privateConstructorUsedError;

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
      {dynamic userId,
      dynamic gender,
      dynamic minAge,
      dynamic maxAge,
      dynamic distance,
      dynamic country,
      dynamic city});
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
    Object? userId = freezed,
    Object? gender = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? distance = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_value.copyWith(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      minAge: freezed == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxAge: freezed == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
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
      {dynamic userId,
      dynamic gender,
      dynamic minAge,
      dynamic maxAge,
      dynamic distance,
      dynamic country,
      dynamic city});
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
    Object? userId = freezed,
    Object? gender = freezed,
    Object? minAge = freezed,
    Object? maxAge = freezed,
    Object? distance = freezed,
    Object? country = freezed,
    Object? city = freezed,
  }) {
    return _then(_$MatchCriteriaModelImpl(
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      minAge: freezed == minAge
          ? _value.minAge
          : minAge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      maxAge: freezed == maxAge
          ? _value.maxAge
          : maxAge // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      country: freezed == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as dynamic,
      city: freezed == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MatchCriteriaModelImpl implements _MatchCriteriaModel {
  const _$MatchCriteriaModelImpl(
      {this.userId,
      this.gender,
      this.minAge,
      this.maxAge,
      this.distance,
      this.country,
      this.city});

  factory _$MatchCriteriaModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchCriteriaModelImplFromJson(json);

  @override
  final dynamic userId;
  @override
  final dynamic gender;
  @override
  final dynamic minAge;
  @override
  final dynamic maxAge;
  @override
  final dynamic distance;
  @override
  final dynamic country;
  @override
  final dynamic city;

  @override
  String toString() {
    return 'MatchCriteriaModel(userId: $userId, gender: $gender, minAge: $minAge, maxAge: $maxAge, distance: $distance, country: $country, city: $city)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchCriteriaModelImpl &&
            const DeepCollectionEquality().equals(other.userId, userId) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality().equals(other.minAge, minAge) &&
            const DeepCollectionEquality().equals(other.maxAge, maxAge) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.country, country) &&
            const DeepCollectionEquality().equals(other.city, city));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(userId),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(minAge),
      const DeepCollectionEquality().hash(maxAge),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(country),
      const DeepCollectionEquality().hash(city));

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
  const factory _MatchCriteriaModel(
      {final dynamic userId,
      final dynamic gender,
      final dynamic minAge,
      final dynamic maxAge,
      final dynamic distance,
      final dynamic country,
      final dynamic city}) = _$MatchCriteriaModelImpl;

  factory _MatchCriteriaModel.fromJson(Map<String, dynamic> json) =
      _$MatchCriteriaModelImpl.fromJson;

  @override
  dynamic get userId;
  @override
  dynamic get gender;
  @override
  dynamic get minAge;
  @override
  dynamic get maxAge;
  @override
  dynamic get distance;
  @override
  dynamic get country;
  @override
  dynamic get city;
  @override
  @JsonKey(ignore: true)
  _$$MatchCriteriaModelImplCopyWith<_$MatchCriteriaModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
