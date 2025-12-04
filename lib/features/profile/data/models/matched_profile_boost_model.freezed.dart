// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matched_profile_boost_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileBoostModel {
  String get id;
  String get userId;
  String get userName;
  String get fullName;
  String get profileUrlForAds;
  String? get userProfileUrl;
  String? get caption;

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileBoostModelCopyWith<ProfileBoostModel> get copyWith =>
      _$ProfileBoostModelCopyWithImpl<ProfileBoostModel>(
          this as ProfileBoostModel, _$identity);

  /// Serializes this ProfileBoostModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileBoostModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileUrlForAds, profileUrlForAds) ||
                other.profileUrlForAds == profileUrlForAds) &&
            (identical(other.userProfileUrl, userProfileUrl) ||
                other.userProfileUrl == userProfileUrl) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userName, fullName,
      profileUrlForAds, userProfileUrl, caption);

  @override
  String toString() {
    return 'ProfileBoostModel(id: $id, userId: $userId, userName: $userName, fullName: $fullName, profileUrlForAds: $profileUrlForAds, userProfileUrl: $userProfileUrl, caption: $caption)';
  }
}

/// @nodoc
abstract mixin class $ProfileBoostModelCopyWith<$Res> {
  factory $ProfileBoostModelCopyWith(
          ProfileBoostModel value, $Res Function(ProfileBoostModel) _then) =
      _$ProfileBoostModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String fullName,
      String profileUrlForAds,
      String? userProfileUrl,
      String? caption});
}

/// @nodoc
class _$ProfileBoostModelCopyWithImpl<$Res>
    implements $ProfileBoostModelCopyWith<$Res> {
  _$ProfileBoostModelCopyWithImpl(this._self, this._then);

  final ProfileBoostModel _self;
  final $Res Function(ProfileBoostModel) _then;

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? fullName = null,
    Object? profileUrlForAds = null,
    Object? userProfileUrl = freezed,
    Object? caption = freezed,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrlForAds: null == profileUrlForAds
          ? _self.profileUrlForAds
          : profileUrlForAds // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileUrl: freezed == userProfileUrl
          ? _self.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileBoostModel implements ProfileBoostModel {
  _ProfileBoostModel(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.fullName,
      required this.profileUrlForAds,
      this.userProfileUrl,
      this.caption});
  factory _ProfileBoostModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBoostModelFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String userName;
  @override
  final String fullName;
  @override
  final String profileUrlForAds;
  @override
  final String? userProfileUrl;
  @override
  final String? caption;

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileBoostModelCopyWith<_ProfileBoostModel> get copyWith =>
      __$ProfileBoostModelCopyWithImpl<_ProfileBoostModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileBoostModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileBoostModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileUrlForAds, profileUrlForAds) ||
                other.profileUrlForAds == profileUrlForAds) &&
            (identical(other.userProfileUrl, userProfileUrl) ||
                other.userProfileUrl == userProfileUrl) &&
            (identical(other.caption, caption) || other.caption == caption));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userName, fullName,
      profileUrlForAds, userProfileUrl, caption);

  @override
  String toString() {
    return 'ProfileBoostModel(id: $id, userId: $userId, userName: $userName, fullName: $fullName, profileUrlForAds: $profileUrlForAds, userProfileUrl: $userProfileUrl, caption: $caption)';
  }
}

/// @nodoc
abstract mixin class _$ProfileBoostModelCopyWith<$Res>
    implements $ProfileBoostModelCopyWith<$Res> {
  factory _$ProfileBoostModelCopyWith(
          _ProfileBoostModel value, $Res Function(_ProfileBoostModel) _then) =
      __$ProfileBoostModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String fullName,
      String profileUrlForAds,
      String? userProfileUrl,
      String? caption});
}

/// @nodoc
class __$ProfileBoostModelCopyWithImpl<$Res>
    implements _$ProfileBoostModelCopyWith<$Res> {
  __$ProfileBoostModelCopyWithImpl(this._self, this._then);

  final _ProfileBoostModel _self;
  final $Res Function(_ProfileBoostModel) _then;

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? fullName = null,
    Object? profileUrlForAds = null,
    Object? userProfileUrl = freezed,
    Object? caption = freezed,
  }) {
    return _then(_ProfileBoostModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrlForAds: null == profileUrlForAds
          ? _self.profileUrlForAds
          : profileUrlForAds // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileUrl: freezed == userProfileUrl
          ? _self.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _self.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
mixin _$ProfileBoostListModel {
  List<ProfileBoostModel> get data;

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileBoostListModelCopyWith<ProfileBoostListModel> get copyWith =>
      _$ProfileBoostListModelCopyWithImpl<ProfileBoostListModel>(
          this as ProfileBoostListModel, _$identity);

  /// Serializes this ProfileBoostListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileBoostListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ProfileBoostListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ProfileBoostListModelCopyWith<$Res> {
  factory $ProfileBoostListModelCopyWith(ProfileBoostListModel value,
          $Res Function(ProfileBoostListModel) _then) =
      _$ProfileBoostListModelCopyWithImpl;
  @useResult
  $Res call({List<ProfileBoostModel> data});
}

/// @nodoc
class _$ProfileBoostListModelCopyWithImpl<$Res>
    implements $ProfileBoostListModelCopyWith<$Res> {
  _$ProfileBoostListModelCopyWithImpl(this._self, this._then);

  final ProfileBoostListModel _self;
  final $Res Function(ProfileBoostListModel) _then;

  /// Create a copy of ProfileBoostListModel
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
              as List<ProfileBoostModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ProfileBoostListModel implements ProfileBoostListModel {
  _ProfileBoostListModel({required final List<ProfileBoostModel> data})
      : _data = data;
  factory _ProfileBoostListModel.fromJson(Map<String, dynamic> json) =>
      _$ProfileBoostListModelFromJson(json);

  final List<ProfileBoostModel> _data;
  @override
  List<ProfileBoostModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileBoostListModelCopyWith<_ProfileBoostListModel> get copyWith =>
      __$ProfileBoostListModelCopyWithImpl<_ProfileBoostListModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ProfileBoostListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileBoostListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ProfileBoostListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ProfileBoostListModelCopyWith<$Res>
    implements $ProfileBoostListModelCopyWith<$Res> {
  factory _$ProfileBoostListModelCopyWith(_ProfileBoostListModel value,
          $Res Function(_ProfileBoostListModel) _then) =
      __$ProfileBoostListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<ProfileBoostModel> data});
}

/// @nodoc
class __$ProfileBoostListModelCopyWithImpl<$Res>
    implements _$ProfileBoostListModelCopyWith<$Res> {
  __$ProfileBoostListModelCopyWithImpl(this._self, this._then);

  final _ProfileBoostListModel _self;
  final $Res Function(_ProfileBoostListModel) _then;

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_ProfileBoostListModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProfileBoostModel>,
    ));
  }
}

// dart format on
