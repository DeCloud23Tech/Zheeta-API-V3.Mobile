// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NearbyDataModel _$NearbyDataModelFromJson(Map<String, dynamic> json) {
  return _NearbyDataModel.fromJson(json);
}

/// @nodoc
mixin _$NearbyDataModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String? get profilePhotoURL => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  double get distance => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get totalWeight => throw _privateConstructorUsedError;

  /// Serializes this NearbyDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyDataModelCopyWith<NearbyDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyDataModelCopyWith<$Res> {
  factory $NearbyDataModelCopyWith(
          NearbyDataModel value, $Res Function(NearbyDataModel) then) =
      _$NearbyDataModelCopyWithImpl<$Res, NearbyDataModel>;
  @useResult
  $Res call(
      {String id,
      String username,
      String? profilePhotoURL,
      String location,
      double distance,
      int age,
      String gender,
      int totalWeight});
}

/// @nodoc
class _$NearbyDataModelCopyWithImpl<$Res, $Val extends NearbyDataModel>
    implements $NearbyDataModelCopyWith<$Res> {
  _$NearbyDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? profilePhotoURL = freezed,
    Object? location = null,
    Object? distance = null,
    Object? age = null,
    Object? gender = null,
    Object? totalWeight = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: freezed == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      totalWeight: null == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyDataModelImplCopyWith<$Res>
    implements $NearbyDataModelCopyWith<$Res> {
  factory _$$NearbyDataModelImplCopyWith(_$NearbyDataModelImpl value,
          $Res Function(_$NearbyDataModelImpl) then) =
      __$$NearbyDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String username,
      String? profilePhotoURL,
      String location,
      double distance,
      int age,
      String gender,
      int totalWeight});
}

/// @nodoc
class __$$NearbyDataModelImplCopyWithImpl<$Res>
    extends _$NearbyDataModelCopyWithImpl<$Res, _$NearbyDataModelImpl>
    implements _$$NearbyDataModelImplCopyWith<$Res> {
  __$$NearbyDataModelImplCopyWithImpl(
      _$NearbyDataModelImpl _value, $Res Function(_$NearbyDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? profilePhotoURL = freezed,
    Object? location = null,
    Object? distance = null,
    Object? age = null,
    Object? gender = null,
    Object? totalWeight = null,
  }) {
    return _then(_$NearbyDataModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: freezed == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      totalWeight: null == totalWeight
          ? _value.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyDataModelImpl implements _NearbyDataModel {
  _$NearbyDataModelImpl(
      {required this.id,
      required this.username,
      this.profilePhotoURL,
      required this.location,
      required this.distance,
      required this.age,
      required this.gender,
      required this.totalWeight});

  factory _$NearbyDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyDataModelImplFromJson(json);

  @override
  final String id;
  @override
  final String username;
  @override
  final String? profilePhotoURL;
  @override
  final String location;
  @override
  final double distance;
  @override
  final int age;
  @override
  final String gender;
  @override
  final int totalWeight;

  @override
  String toString() {
    return 'NearbyDataModel(id: $id, username: $username, profilePhotoURL: $profilePhotoURL, location: $location, distance: $distance, age: $age, gender: $gender, totalWeight: $totalWeight)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyDataModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.location, location) ||
                other.location == location) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.totalWeight, totalWeight) ||
                other.totalWeight == totalWeight));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, profilePhotoURL,
      location, distance, age, gender, totalWeight);

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyDataModelImplCopyWith<_$NearbyDataModelImpl> get copyWith =>
      __$$NearbyDataModelImplCopyWithImpl<_$NearbyDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyDataModelImplToJson(
      this,
    );
  }
}

abstract class _NearbyDataModel implements NearbyDataModel {
  factory _NearbyDataModel(
      {required final String id,
      required final String username,
      final String? profilePhotoURL,
      required final String location,
      required final double distance,
      required final int age,
      required final String gender,
      required final int totalWeight}) = _$NearbyDataModelImpl;

  factory _NearbyDataModel.fromJson(Map<String, dynamic> json) =
      _$NearbyDataModelImpl.fromJson;

  @override
  String get id;
  @override
  String get username;
  @override
  String? get profilePhotoURL;
  @override
  String get location;
  @override
  double get distance;
  @override
  int get age;
  @override
  String get gender;
  @override
  int get totalWeight;

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyDataModelImplCopyWith<_$NearbyDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearbyListDataModel _$NearbyListDataModelFromJson(Map<String, dynamic> json) {
  return _NearbyListDataModel.fromJson(json);
}

/// @nodoc
mixin _$NearbyListDataModel {
  List<NearbyDataModel> get data => throw _privateConstructorUsedError;

  /// Serializes this NearbyListDataModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NearbyListDataModelCopyWith<NearbyListDataModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyListDataModelCopyWith<$Res> {
  factory $NearbyListDataModelCopyWith(
          NearbyListDataModel value, $Res Function(NearbyListDataModel) then) =
      _$NearbyListDataModelCopyWithImpl<$Res, NearbyListDataModel>;
  @useResult
  $Res call({List<NearbyDataModel> data});
}

/// @nodoc
class _$NearbyListDataModelCopyWithImpl<$Res, $Val extends NearbyListDataModel>
    implements $NearbyListDataModelCopyWith<$Res> {
  _$NearbyListDataModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyListDataModelImplCopyWith<$Res>
    implements $NearbyListDataModelCopyWith<$Res> {
  factory _$$NearbyListDataModelImplCopyWith(_$NearbyListDataModelImpl value,
          $Res Function(_$NearbyListDataModelImpl) then) =
      __$$NearbyListDataModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NearbyDataModel> data});
}

/// @nodoc
class __$$NearbyListDataModelImplCopyWithImpl<$Res>
    extends _$NearbyListDataModelCopyWithImpl<$Res, _$NearbyListDataModelImpl>
    implements _$$NearbyListDataModelImplCopyWith<$Res> {
  __$$NearbyListDataModelImplCopyWithImpl(_$NearbyListDataModelImpl _value,
      $Res Function(_$NearbyListDataModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$NearbyListDataModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NearbyListDataModelImpl implements _NearbyListDataModel {
  const _$NearbyListDataModelImpl({required final List<NearbyDataModel> data})
      : _data = data;

  factory _$NearbyListDataModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyListDataModelImplFromJson(json);

  final List<NearbyDataModel> _data;
  @override
  List<NearbyDataModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NearbyListDataModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyListDataModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyListDataModelImplCopyWith<_$NearbyListDataModelImpl> get copyWith =>
      __$$NearbyListDataModelImplCopyWithImpl<_$NearbyListDataModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyListDataModelImplToJson(
      this,
    );
  }
}

abstract class _NearbyListDataModel implements NearbyListDataModel {
  const factory _NearbyListDataModel(
      {required final List<NearbyDataModel> data}) = _$NearbyListDataModelImpl;

  factory _NearbyListDataModel.fromJson(Map<String, dynamic> json) =
      _$NearbyListDataModelImpl.fromJson;

  @override
  List<NearbyDataModel> get data;

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NearbyListDataModelImplCopyWith<_$NearbyListDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
