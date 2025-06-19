// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'matched_profile_boost_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ProfileBoostModel _$ProfileBoostModelFromJson(Map<String, dynamic> json) {
  return _ProfileBoostModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileBoostModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get profileUrlForAds => throw _privateConstructorUsedError;
  String? get userProfileUrl => throw _privateConstructorUsedError;
  String? get caption => throw _privateConstructorUsedError;

  /// Serializes this ProfileBoostModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileBoostModelCopyWith<ProfileBoostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileBoostModelCopyWith<$Res> {
  factory $ProfileBoostModelCopyWith(
          ProfileBoostModel value, $Res Function(ProfileBoostModel) then) =
      _$ProfileBoostModelCopyWithImpl<$Res, ProfileBoostModel>;
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
class _$ProfileBoostModelCopyWithImpl<$Res, $Val extends ProfileBoostModel>
    implements $ProfileBoostModelCopyWith<$Res> {
  _$ProfileBoostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrlForAds: null == profileUrlForAds
          ? _value.profileUrlForAds
          : profileUrlForAds // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileUrl: freezed == userProfileUrl
          ? _value.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileBoostModelImplCopyWith<$Res>
    implements $ProfileBoostModelCopyWith<$Res> {
  factory _$$ProfileBoostModelImplCopyWith(_$ProfileBoostModelImpl value,
          $Res Function(_$ProfileBoostModelImpl) then) =
      __$$ProfileBoostModelImplCopyWithImpl<$Res>;
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
class __$$ProfileBoostModelImplCopyWithImpl<$Res>
    extends _$ProfileBoostModelCopyWithImpl<$Res, _$ProfileBoostModelImpl>
    implements _$$ProfileBoostModelImplCopyWith<$Res> {
  __$$ProfileBoostModelImplCopyWithImpl(_$ProfileBoostModelImpl _value,
      $Res Function(_$ProfileBoostModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$ProfileBoostModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      profileUrlForAds: null == profileUrlForAds
          ? _value.profileUrlForAds
          : profileUrlForAds // ignore: cast_nullable_to_non_nullable
              as String,
      userProfileUrl: freezed == userProfileUrl
          ? _value.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      caption: freezed == caption
          ? _value.caption
          : caption // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileBoostModelImpl implements _ProfileBoostModel {
  _$ProfileBoostModelImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.fullName,
      required this.profileUrlForAds,
      this.userProfileUrl,
      this.caption});

  factory _$ProfileBoostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileBoostModelImplFromJson(json);

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

  @override
  String toString() {
    return 'ProfileBoostModel(id: $id, userId: $userId, userName: $userName, fullName: $fullName, profileUrlForAds: $profileUrlForAds, userProfileUrl: $userProfileUrl, caption: $caption)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileBoostModelImpl &&
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

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileBoostModelImplCopyWith<_$ProfileBoostModelImpl> get copyWith =>
      __$$ProfileBoostModelImplCopyWithImpl<_$ProfileBoostModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileBoostModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileBoostModel implements ProfileBoostModel {
  factory _ProfileBoostModel(
      {required final String id,
      required final String userId,
      required final String userName,
      required final String fullName,
      required final String profileUrlForAds,
      final String? userProfileUrl,
      final String? caption}) = _$ProfileBoostModelImpl;

  factory _ProfileBoostModel.fromJson(Map<String, dynamic> json) =
      _$ProfileBoostModelImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get userName;
  @override
  String get fullName;
  @override
  String get profileUrlForAds;
  @override
  String? get userProfileUrl;
  @override
  String? get caption;

  /// Create a copy of ProfileBoostModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileBoostModelImplCopyWith<_$ProfileBoostModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ProfileBoostListModel _$ProfileBoostListModelFromJson(
    Map<String, dynamic> json) {
  return _ProfileBoostListModel.fromJson(json);
}

/// @nodoc
mixin _$ProfileBoostListModel {
  List<ProfileBoostModel> get data => throw _privateConstructorUsedError;

  /// Serializes this ProfileBoostListModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileBoostListModelCopyWith<ProfileBoostListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileBoostListModelCopyWith<$Res> {
  factory $ProfileBoostListModelCopyWith(ProfileBoostListModel value,
          $Res Function(ProfileBoostListModel) then) =
      _$ProfileBoostListModelCopyWithImpl<$Res, ProfileBoostListModel>;
  @useResult
  $Res call({List<ProfileBoostModel> data});
}

/// @nodoc
class _$ProfileBoostListModelCopyWithImpl<$Res,
        $Val extends ProfileBoostListModel>
    implements $ProfileBoostListModelCopyWith<$Res> {
  _$ProfileBoostListModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ProfileBoostListModel
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
              as List<ProfileBoostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileBoostListModelImplCopyWith<$Res>
    implements $ProfileBoostListModelCopyWith<$Res> {
  factory _$$ProfileBoostListModelImplCopyWith(
          _$ProfileBoostListModelImpl value,
          $Res Function(_$ProfileBoostListModelImpl) then) =
      __$$ProfileBoostListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ProfileBoostModel> data});
}

/// @nodoc
class __$$ProfileBoostListModelImplCopyWithImpl<$Res>
    extends _$ProfileBoostListModelCopyWithImpl<$Res,
        _$ProfileBoostListModelImpl>
    implements _$$ProfileBoostListModelImplCopyWith<$Res> {
  __$$ProfileBoostListModelImplCopyWithImpl(_$ProfileBoostListModelImpl _value,
      $Res Function(_$ProfileBoostListModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ProfileBoostListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<ProfileBoostModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileBoostListModelImpl implements _ProfileBoostListModel {
  _$ProfileBoostListModelImpl({required final List<ProfileBoostModel> data})
      : _data = data;

  factory _$ProfileBoostListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileBoostListModelImplFromJson(json);

  final List<ProfileBoostModel> _data;
  @override
  List<ProfileBoostModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ProfileBoostListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileBoostListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileBoostListModelImplCopyWith<_$ProfileBoostListModelImpl>
      get copyWith => __$$ProfileBoostListModelImplCopyWithImpl<
          _$ProfileBoostListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileBoostListModelImplToJson(
      this,
    );
  }
}

abstract class _ProfileBoostListModel implements ProfileBoostListModel {
  factory _ProfileBoostListModel(
          {required final List<ProfileBoostModel> data}) =
      _$ProfileBoostListModelImpl;

  factory _ProfileBoostListModel.fromJson(Map<String, dynamic> json) =
      _$ProfileBoostListModelImpl.fromJson;

  @override
  List<ProfileBoostModel> get data;

  /// Create a copy of ProfileBoostListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileBoostListModelImplCopyWith<_$ProfileBoostListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
