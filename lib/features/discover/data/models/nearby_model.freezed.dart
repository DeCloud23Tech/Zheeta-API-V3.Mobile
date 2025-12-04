// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'nearby_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NearbyDataModel {
  String get id;
  String get username;
  String? get profilePhotoURL;
  String get location;
  double get distance;
  int get age;
  String get gender;
  int get totalWeight;

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyDataModelCopyWith<NearbyDataModel> get copyWith =>
      _$NearbyDataModelCopyWithImpl<NearbyDataModel>(
          this as NearbyDataModel, _$identity);

  /// Serializes this NearbyDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyDataModel &&
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

  @override
  String toString() {
    return 'NearbyDataModel(id: $id, username: $username, profilePhotoURL: $profilePhotoURL, location: $location, distance: $distance, age: $age, gender: $gender, totalWeight: $totalWeight)';
  }
}

/// @nodoc
abstract mixin class $NearbyDataModelCopyWith<$Res> {
  factory $NearbyDataModelCopyWith(
          NearbyDataModel value, $Res Function(NearbyDataModel) _then) =
      _$NearbyDataModelCopyWithImpl;
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
class _$NearbyDataModelCopyWithImpl<$Res>
    implements $NearbyDataModelCopyWith<$Res> {
  _$NearbyDataModelCopyWithImpl(this._self, this._then);

  final NearbyDataModel _self;
  final $Res Function(NearbyDataModel) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      totalWeight: null == totalWeight
          ? _self.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyDataModel implements NearbyDataModel {
  _NearbyDataModel(
      {required this.id,
      required this.username,
      this.profilePhotoURL,
      required this.location,
      required this.distance,
      required this.age,
      required this.gender,
      required this.totalWeight});
  factory _NearbyDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyDataModelFromJson(json);

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

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyDataModelCopyWith<_NearbyDataModel> get copyWith =>
      __$NearbyDataModelCopyWithImpl<_NearbyDataModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyDataModel &&
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

  @override
  String toString() {
    return 'NearbyDataModel(id: $id, username: $username, profilePhotoURL: $profilePhotoURL, location: $location, distance: $distance, age: $age, gender: $gender, totalWeight: $totalWeight)';
  }
}

/// @nodoc
abstract mixin class _$NearbyDataModelCopyWith<$Res>
    implements $NearbyDataModelCopyWith<$Res> {
  factory _$NearbyDataModelCopyWith(
          _NearbyDataModel value, $Res Function(_NearbyDataModel) _then) =
      __$NearbyDataModelCopyWithImpl;
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
class __$NearbyDataModelCopyWithImpl<$Res>
    implements _$NearbyDataModelCopyWith<$Res> {
  __$NearbyDataModelCopyWithImpl(this._self, this._then);

  final _NearbyDataModel _self;
  final $Res Function(_NearbyDataModel) _then;

  /// Create a copy of NearbyDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_NearbyDataModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as String,
      distance: null == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as double,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      totalWeight: null == totalWeight
          ? _self.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$NearbyListDataModel {
  List<NearbyDataModel> get data;

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NearbyListDataModelCopyWith<NearbyListDataModel> get copyWith =>
      _$NearbyListDataModelCopyWithImpl<NearbyListDataModel>(
          this as NearbyListDataModel, _$identity);

  /// Serializes this NearbyListDataModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NearbyListDataModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'NearbyListDataModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $NearbyListDataModelCopyWith<$Res> {
  factory $NearbyListDataModelCopyWith(
          NearbyListDataModel value, $Res Function(NearbyListDataModel) _then) =
      _$NearbyListDataModelCopyWithImpl;
  @useResult
  $Res call({List<NearbyDataModel> data});
}

/// @nodoc
class _$NearbyListDataModelCopyWithImpl<$Res>
    implements $NearbyListDataModelCopyWith<$Res> {
  _$NearbyListDataModelCopyWithImpl(this._self, this._then);

  final NearbyListDataModel _self;
  final $Res Function(NearbyListDataModel) _then;

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_self.copyWith(
      data: null == data
          ? _self.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyDataModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NearbyListDataModel implements NearbyListDataModel {
  const _NearbyListDataModel({required final List<NearbyDataModel> data})
      : _data = data;
  factory _NearbyListDataModel.fromJson(Map<String, dynamic> json) =>
      _$NearbyListDataModelFromJson(json);

  final List<NearbyDataModel> _data;
  @override
  List<NearbyDataModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NearbyListDataModelCopyWith<_NearbyListDataModel> get copyWith =>
      __$NearbyListDataModelCopyWithImpl<_NearbyListDataModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NearbyListDataModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NearbyListDataModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'NearbyListDataModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$NearbyListDataModelCopyWith<$Res>
    implements $NearbyListDataModelCopyWith<$Res> {
  factory _$NearbyListDataModelCopyWith(_NearbyListDataModel value,
          $Res Function(_NearbyListDataModel) _then) =
      __$NearbyListDataModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<NearbyDataModel> data});
}

/// @nodoc
class __$NearbyListDataModelCopyWithImpl<$Res>
    implements _$NearbyListDataModelCopyWith<$Res> {
  __$NearbyListDataModelCopyWithImpl(this._self, this._then);

  final _NearbyListDataModel _self;
  final $Res Function(_NearbyListDataModel) _then;

  /// Create a copy of NearbyListDataModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_NearbyListDataModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<NearbyDataModel>,
    ));
  }
}

// dart format on
