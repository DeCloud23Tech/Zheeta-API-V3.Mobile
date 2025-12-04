// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'match_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MatchModel {
  dynamic get id;
  dynamic get username;
  dynamic get profilePhotoURL;
  dynamic get location;
  dynamic get distance;
  dynamic get age;
  dynamic get gender;
  dynamic get totalWeight;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchModelCopyWith<MatchModel> get copyWith =>
      _$MatchModelCopyWithImpl<MatchModel>(this as MatchModel, _$identity);

  /// Serializes this MatchModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'MatchModel(id: $id, username: $username, profilePhotoURL: $profilePhotoURL, location: $location, distance: $distance, age: $age, gender: $gender, totalWeight: $totalWeight)';
  }
}

/// @nodoc
abstract mixin class $MatchModelCopyWith<$Res> {
  factory $MatchModelCopyWith(
          MatchModel value, $Res Function(MatchModel) _then) =
      _$MatchModelCopyWithImpl;
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
class _$MatchModelCopyWithImpl<$Res> implements $MatchModelCopyWith<$Res> {
  _$MatchModelCopyWithImpl(this._self, this._then);

  final MatchModel _self;
  final $Res Function(MatchModel) _then;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
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
    return _then(_self.copyWith(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalWeight: freezed == totalWeight
          ? _self.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MatchModel implements MatchModel {
  _MatchModel(
      {this.id,
      this.username,
      this.profilePhotoURL,
      this.location,
      this.distance,
      this.age,
      this.gender,
      this.totalWeight});
  factory _MatchModel.fromJson(Map<String, dynamic> json) =>
      _$MatchModelFromJson(json);

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

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchModelCopyWith<_MatchModel> get copyWith =>
      __$MatchModelCopyWithImpl<_MatchModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchModel &&
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

  @JsonKey(includeFromJson: false, includeToJson: false)
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

  @override
  String toString() {
    return 'MatchModel(id: $id, username: $username, profilePhotoURL: $profilePhotoURL, location: $location, distance: $distance, age: $age, gender: $gender, totalWeight: $totalWeight)';
  }
}

/// @nodoc
abstract mixin class _$MatchModelCopyWith<$Res>
    implements $MatchModelCopyWith<$Res> {
  factory _$MatchModelCopyWith(
          _MatchModel value, $Res Function(_MatchModel) _then) =
      __$MatchModelCopyWithImpl;
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
class __$MatchModelCopyWithImpl<$Res> implements _$MatchModelCopyWith<$Res> {
  __$MatchModelCopyWithImpl(this._self, this._then);

  final _MatchModel _self;
  final $Res Function(_MatchModel) _then;

  /// Create a copy of MatchModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
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
    return _then(_MatchModel(
      id: freezed == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as dynamic,
      username: freezed == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as dynamic,
      profilePhotoURL: freezed == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as dynamic,
      location: freezed == location
          ? _self.location
          : location // ignore: cast_nullable_to_non_nullable
              as dynamic,
      distance: freezed == distance
          ? _self.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as dynamic,
      age: freezed == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as dynamic,
      gender: freezed == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as dynamic,
      totalWeight: freezed == totalWeight
          ? _self.totalWeight
          : totalWeight // ignore: cast_nullable_to_non_nullable
              as dynamic,
    ));
  }
}

/// @nodoc
mixin _$MatchListModel {
  List<MatchModel>? get data;

  /// Create a copy of MatchListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MatchListModelCopyWith<MatchListModel> get copyWith =>
      _$MatchListModelCopyWithImpl<MatchListModel>(
          this as MatchListModel, _$identity);

  /// Serializes this MatchListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is MatchListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'MatchListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $MatchListModelCopyWith<$Res> {
  factory $MatchListModelCopyWith(
          MatchListModel value, $Res Function(MatchListModel) _then) =
      _$MatchListModelCopyWithImpl;
  @useResult
  $Res call({List<MatchModel>? data});
}

/// @nodoc
class _$MatchListModelCopyWithImpl<$Res>
    implements $MatchListModelCopyWith<$Res> {
  _$MatchListModelCopyWithImpl(this._self, this._then);

  final MatchListModel _self;
  final $Res Function(MatchListModel) _then;

  /// Create a copy of MatchListModel
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
              as List<MatchModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _MatchListModel implements MatchListModel {
  _MatchListModel({final List<MatchModel>? data}) : _data = data;
  factory _MatchListModel.fromJson(Map<String, dynamic> json) =>
      _$MatchListModelFromJson(json);

  final List<MatchModel>? _data;
  @override
  List<MatchModel>? get data {
    final value = _data;
    if (value == null) return null;
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  /// Create a copy of MatchListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MatchListModelCopyWith<_MatchListModel> get copyWith =>
      __$MatchListModelCopyWithImpl<_MatchListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MatchListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _MatchListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'MatchListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$MatchListModelCopyWith<$Res>
    implements $MatchListModelCopyWith<$Res> {
  factory _$MatchListModelCopyWith(
          _MatchListModel value, $Res Function(_MatchListModel) _then) =
      __$MatchListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<MatchModel>? data});
}

/// @nodoc
class __$MatchListModelCopyWithImpl<$Res>
    implements _$MatchListModelCopyWith<$Res> {
  __$MatchListModelCopyWithImpl(this._self, this._then);

  final _MatchListModel _self;
  final $Res Function(_MatchListModel) _then;

  /// Create a copy of MatchListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_MatchListModel(
      data: freezed == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MatchModel>?,
    ));
  }
}

// dart format on
