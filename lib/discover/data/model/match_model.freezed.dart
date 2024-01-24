// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchModel _$MatchModelFromJson(Map<String, dynamic> json) {
  return _MatchModel.fromJson(json);
}

/// @nodoc
mixin _$MatchModel {
  dynamic get id => throw _privateConstructorUsedError;
  dynamic get username => throw _privateConstructorUsedError;
  dynamic get profilePhotoURL => throw _privateConstructorUsedError;
  dynamic get location => throw _privateConstructorUsedError;
  dynamic get distance => throw _privateConstructorUsedError;
  dynamic get age => throw _privateConstructorUsedError;
  dynamic get gender => throw _privateConstructorUsedError;
  dynamic get totalWeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchModelCopyWith<MatchModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) then) =
      _$MatchModelCopyWithImpl<$Res, MatchModel>;
  @useResult
  $Res call(
      {dynamic id,
      dynamic username,
      dynamic profilePhotoURL,
      dynamic location,
      dynamic distance,
      dynamic age,
      dynamic gender,
      dynamic totalWeight});
}

/// @nodoc
class _$MatchModelCopyWithImpl<$Res, $Val extends MatchModel>
    implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profilePhotoURL = freezed,
    Object? location = freezed,
    Object? distance = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? totalWeight = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePhotoURL: freezed == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalWeight: freezed == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchModelImplCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$$MatchModelImplCopyWith(
          _$MatchModelImpl value, $Res Function(_$MatchModelImpl) then) =
      __$$MatchModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {dynamic id,
      dynamic username,
      dynamic profilePhotoURL,
      dynamic location,
      dynamic distance,
      dynamic age,
      dynamic gender,
      dynamic totalWeight});
}

/// @nodoc
class __$$MatchModelImplCopyWithImpl<$Res>
    extends _$MatchModelCopyWithImpl<$Res, _$MatchModelImpl>
    implements _$$MatchModelImplCopyWith<$Res> {
  __$$MatchModelImplCopyWithImpl(
      _$MatchModelImpl _value, $Res Function(_$MatchModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? username = freezed,
    Object? profilePhotoURL = freezed,
    Object? location = freezed,
    Object? distance = freezed,
    Object? age = freezed,
    Object? gender = freezed,
    Object? totalWeight = freezed,
  }) {
    return _then(_$MatchModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePhotoURL: freezed == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location: freezed == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      age: freezed == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalWeight: freezed == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MatchModelImpl implements _MatchModel {
  const _$MatchModelImpl(
      {this.id,
      this.username,
      this.profilePhotoURL,
      this.location,
      this.distance,
      this.age,
      this.gender,
      this.totalWeight});

  factory _$MatchModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchModelImplFromJson(json);

  @override
  final dynamic id;
  @override
  final dynamic username;
  @override
  final dynamic profilePhotoURL;
  @override
  final dynamic location;
  @override
  final dynamic distance;
  @override
  final dynamic age;
  @override
  final dynamic gender;
  @override
  final dynamic totalWeight;

  @override
  String toString() {
    return 'MatchModel(id: $id, username: $username, profilePhotoURL: $profilePhotoURL, location: $location, distance: $distance, age: $age, gender: $gender, totalWeight: $totalWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchModelImpl &&
            const DeepCollectionEquality().equals(other.id, id) &&
            const DeepCollectionEquality().equals(other.username, username) &&
            const DeepCollectionEquality()
                .equals(other.profilePhotoURL, profilePhotoURL) &&
            const DeepCollectionEquality().equals(other.location, location) &&
            const DeepCollectionEquality().equals(other.distance, distance) &&
            const DeepCollectionEquality().equals(other.age, age) &&
            const DeepCollectionEquality().equals(other.gender, gender) &&
            const DeepCollectionEquality()
                .equals(other.totalWeight, totalWeight));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(id),
      const DeepCollectionEquality().hash(username),
      const DeepCollectionEquality().hash(profilePhotoURL),
      const DeepCollectionEquality().hash(location),
      const DeepCollectionEquality().hash(distance),
      const DeepCollectionEquality().hash(age),
      const DeepCollectionEquality().hash(gender),
      const DeepCollectionEquality().hash(totalWeight));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      __$$MatchModelImplCopyWithImpl<_$MatchModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchModelImplToJson(
      this,
    );
  }
}

abstract class _MatchModel implements MatchModel {
  const factory _MatchModel(
      {final dynamic id,
      final dynamic username,
      final dynamic profilePhotoURL,
      final dynamic location,
      final dynamic distance,
      final dynamic age,
      final dynamic gender,
      final dynamic totalWeight}) = _$MatchModelImpl;

  factory _MatchModel.fromJson(Map<String, dynamic> json) =
      _$MatchModelImpl.fromJson;

  @override
  dynamic get id;
  @override
  dynamic get username;
  @override
  dynamic get profilePhotoURL;
  @override
  dynamic get location;
  @override
  dynamic get distance;
  @override
  dynamic get age;
  @override
  dynamic get gender;
  @override
  dynamic get totalWeight;
  @override
  @JsonKey(ignore: true)
  _$$MatchModelImplCopyWith<_$MatchModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

MatchListModel _$MatchListModelFromJson(Map<String, dynamic> json) {
  return _MatchListModel.fromJson(json);
}

/// @nodoc
mixin _$MatchListModel {
  List<MatchModel>? get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchListModelCopyWith<MatchListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchListModelCopyWith<$Res> {
  factory $MatchListModelCopyWith(
          MatchListModel value, $Res Function(MatchListModel) then) =
      _$MatchListModelCopyWithImpl<$Res, MatchListModel>;
  @useResult
  $Res call({List<MatchModel>? data});
}

/// @nodoc
class _$MatchListModelCopyWithImpl<$Res, $Val extends MatchListModel>
    implements $MatchListModelCopyWith<$Res> {
  _$MatchListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_value.copyWith(
      data: freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchListModelImplCopyWith<$Res>
    implements $MatchListModelCopyWith<$Res> {
  factory _$$MatchListModelImplCopyWith(_$MatchListModelImpl value,
          $Res Function(_$MatchListModelImpl) then) =
      __$$MatchListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchModel>? data});
}

/// @nodoc
class __$$MatchListModelImplCopyWithImpl<$Res>
    extends _$MatchListModelCopyWithImpl<$Res, _$MatchListModelImpl>
    implements _$$MatchListModelImplCopyWith<$Res> {
  __$$MatchListModelImplCopyWithImpl(
      _$MatchListModelImpl _value, $Res Function(_$MatchListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$MatchListModelImpl(
      data: freezed == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$MatchListModelImpl implements _MatchListModel {
  const _$MatchListModelImpl({final List<MatchModel>? data}) : _data = data;

  factory _$MatchListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchListModelImplFromJson(json);

  final List<MatchModel>? _data;
  @override
  List<MatchModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'MatchListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchListModelImplCopyWith<_$MatchListModelImpl> get copyWith =>
      __$$MatchListModelImplCopyWithImpl<_$MatchListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchListModelImplToJson(
      this,
    );
  }
}

abstract class _MatchListModel implements MatchListModel {
  const factory _MatchListModel({final List<MatchModel>? data}) =
      _$MatchListModelImpl;

  factory _MatchListModel.fromJson(Map<String, dynamic> json) =
      _$MatchListModelImpl.fromJson;

  @override
  List<MatchModel>? get data;
  @override
  @JsonKey(ignore: true)
  _$$MatchListModelImplCopyWith<_$MatchListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
