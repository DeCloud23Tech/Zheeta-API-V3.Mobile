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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

NearbyListModel _$NearbyListModelFromJson(Map<String, dynamic> json) {
  return _NearbyListModel.fromJson(json);
}

/// @nodoc
mixin _$NearbyListModel {
  List<NearbyDataModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $NearbyListModelCopyWith<NearbyListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NearbyListModelCopyWith<$Res> {
  factory $NearbyListModelCopyWith(
          NearbyListModel value, $Res Function(NearbyListModel) then) =
      _$NearbyListModelCopyWithImpl<$Res, NearbyListModel>;
  @useResult
  $Res call({List<NearbyDataModel> data});
}

/// @nodoc
class _$NearbyListModelCopyWithImpl<$Res, $Val extends NearbyListModel>
    implements $NearbyListModelCopyWith<$Res> {
  _$NearbyListModelCopyWithImpl(this._value, this._then);

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
              as List<NearbyDataModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NearbyListModelImplCopyWith<$Res>
    implements $NearbyListModelCopyWith<$Res> {
  factory _$$NearbyListModelImplCopyWith(_$NearbyListModelImpl value,
          $Res Function(_$NearbyListModelImpl) then) =
      __$$NearbyListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<NearbyDataModel> data});
}

/// @nodoc
class __$$NearbyListModelImplCopyWithImpl<$Res>
    extends _$NearbyListModelCopyWithImpl<$Res, _$NearbyListModelImpl>
    implements _$$NearbyListModelImplCopyWith<$Res> {
  __$$NearbyListModelImplCopyWithImpl(
      _$NearbyListModelImpl _value, $Res Function(_$NearbyListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$NearbyListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyDataModel>,
    ));
  }
}

/// @nodoc

@JsonSerializable(explicitToJson: true)
class _$NearbyListModelImpl implements _NearbyListModel {
  _$NearbyListModelImpl({required final List<NearbyDataModel> data})
      : _data = data;

  factory _$NearbyListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NearbyListModelImplFromJson(json);

  final List<NearbyDataModel> _data;
  @override
  List<NearbyDataModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'NearbyListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NearbyListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$NearbyListModelImplCopyWith<_$NearbyListModelImpl> get copyWith =>
      __$$NearbyListModelImplCopyWithImpl<_$NearbyListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NearbyListModelImplToJson(
      this,
    );
  }
}

abstract class _NearbyListModel implements NearbyListModel {
  factory _NearbyListModel({required final List<NearbyDataModel> data}) =
      _$NearbyListModelImpl;

  factory _NearbyListModel.fromJson(Map<String, dynamic> json) =
      _$NearbyListModelImpl.fromJson;

  @override
  List<NearbyDataModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$NearbyListModelImplCopyWith<_$NearbyListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

NearbyDataModel _$NearbyDataModelFromJson(Map<String, dynamic> json) {
  return _NearbyDataModel.fromJson(json);
}

/// @nodoc
mixin _$NearbyDataModel {
  String get id => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get profilePhotoURL => throw _privateConstructorUsedError;
  String get location => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  int get totalWeight => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
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
      String profilePhotoURL,
      String location,
      int distance,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? profilePhotoURL = null,
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
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
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
      String profilePhotoURL,
      String location,
      int distance,
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

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? username = null,
    Object? profilePhotoURL = null,
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
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
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
      required this.profilePhotoURL,
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
  final String profilePhotoURL;
  @override
  final String location;
  @override
  final int distance;
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, username, profilePhotoURL,
      location, distance, age, gender, totalWeight);

  @JsonKey(ignore: true)
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
      required final String profilePhotoURL,
      required final String location,
      required final int distance,
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
  String get profilePhotoURL;
  @override
  String get location;
  @override
  int get distance;
  @override
  int get age;
  @override
  String get gender;
  @override
  int get totalWeight;
  @override
  @JsonKey(ignore: true)
  _$$NearbyDataModelImplCopyWith<_$NearbyDataModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
