// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BlockedUser {
  String get userName;
  String get fullName;
  int get age;
  String get city;
  String get country;
  String get gender;
  String get profilePhotoURL;
  String get blockedUserId;

  /// Create a copy of BlockedUser
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockedUserCopyWith<BlockedUser> get copyWith =>
      _$BlockedUserCopyWithImpl<BlockedUser>(this as BlockedUser, _$identity);

  /// Serializes this BlockedUser to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockedUser &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, fullName, age, city,
      country, gender, profilePhotoURL, blockedUserId);

  @override
  String toString() {
    return 'BlockedUser(userName: $userName, fullName: $fullName, age: $age, city: $city, country: $country, gender: $gender, profilePhotoURL: $profilePhotoURL, blockedUserId: $blockedUserId)';
  }
}

/// @nodoc
abstract mixin class $BlockedUserCopyWith<$Res> {
  factory $BlockedUserCopyWith(
          BlockedUser value, $Res Function(BlockedUser) _then) =
      _$BlockedUserCopyWithImpl;
  @useResult
  $Res call(
      {String userName,
      String fullName,
      int age,
      String city,
      String country,
      String gender,
      String profilePhotoURL,
      String blockedUserId});
}

/// @nodoc
class _$BlockedUserCopyWithImpl<$Res> implements $BlockedUserCopyWith<$Res> {
  _$BlockedUserCopyWithImpl(this._self, this._then);

  final BlockedUser _self;
  final $Res Function(BlockedUser) _then;

  /// Create a copy of BlockedUser
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? fullName = null,
    Object? age = null,
    Object? city = null,
    Object? country = null,
    Object? gender = null,
    Object? profilePhotoURL = null,
    Object? blockedUserId = null,
  }) {
    return _then(_self.copyWith(
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      blockedUserId: null == blockedUserId
          ? _self.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockedUser implements BlockedUser {
  const _BlockedUser(
      {required this.userName,
      required this.fullName,
      required this.age,
      required this.city,
      required this.country,
      required this.gender,
      required this.profilePhotoURL,
      required this.blockedUserId});
  factory _BlockedUser.fromJson(Map<String, dynamic> json) =>
      _$BlockedUserFromJson(json);

  @override
  final String userName;
  @override
  final String fullName;
  @override
  final int age;
  @override
  final String city;
  @override
  final String country;
  @override
  final String gender;
  @override
  final String profilePhotoURL;
  @override
  final String blockedUserId;

  /// Create a copy of BlockedUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockedUserCopyWith<_BlockedUser> get copyWith =>
      __$BlockedUserCopyWithImpl<_BlockedUser>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockedUserToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockedUser &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.age, age) || other.age == age) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.gender, gender) || other.gender == gender) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.blockedUserId, blockedUserId) ||
                other.blockedUserId == blockedUserId));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userName, fullName, age, city,
      country, gender, profilePhotoURL, blockedUserId);

  @override
  String toString() {
    return 'BlockedUser(userName: $userName, fullName: $fullName, age: $age, city: $city, country: $country, gender: $gender, profilePhotoURL: $profilePhotoURL, blockedUserId: $blockedUserId)';
  }
}

/// @nodoc
abstract mixin class _$BlockedUserCopyWith<$Res>
    implements $BlockedUserCopyWith<$Res> {
  factory _$BlockedUserCopyWith(
          _BlockedUser value, $Res Function(_BlockedUser) _then) =
      __$BlockedUserCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userName,
      String fullName,
      int age,
      String city,
      String country,
      String gender,
      String profilePhotoURL,
      String blockedUserId});
}

/// @nodoc
class __$BlockedUserCopyWithImpl<$Res> implements _$BlockedUserCopyWith<$Res> {
  __$BlockedUserCopyWithImpl(this._self, this._then);

  final _BlockedUser _self;
  final $Res Function(_BlockedUser) _then;

  /// Create a copy of BlockedUser
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userName = null,
    Object? fullName = null,
    Object? age = null,
    Object? city = null,
    Object? country = null,
    Object? gender = null,
    Object? profilePhotoURL = null,
    Object? blockedUserId = null,
  }) {
    return _then(_BlockedUser(
      userName: null == userName
          ? _self.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _self.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _self.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _self.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _self.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _self.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      blockedUserId: null == blockedUserId
          ? _self.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$BlockedUsersResponse {
  List<BlockedUser> get data;

  /// Create a copy of BlockedUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BlockedUsersResponseCopyWith<BlockedUsersResponse> get copyWith =>
      _$BlockedUsersResponseCopyWithImpl<BlockedUsersResponse>(
          this as BlockedUsersResponse, _$identity);

  /// Serializes this BlockedUsersResponse to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BlockedUsersResponse &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'BlockedUsersResponse(data: $data)';
  }
}

/// @nodoc
abstract mixin class $BlockedUsersResponseCopyWith<$Res> {
  factory $BlockedUsersResponseCopyWith(BlockedUsersResponse value,
          $Res Function(BlockedUsersResponse) _then) =
      _$BlockedUsersResponseCopyWithImpl;
  @useResult
  $Res call({List<BlockedUser> data});
}

/// @nodoc
class _$BlockedUsersResponseCopyWithImpl<$Res>
    implements $BlockedUsersResponseCopyWith<$Res> {
  _$BlockedUsersResponseCopyWithImpl(this._self, this._then);

  final BlockedUsersResponse _self;
  final $Res Function(BlockedUsersResponse) _then;

  /// Create a copy of BlockedUsersResponse
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
              as List<BlockedUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BlockedUsersResponse implements BlockedUsersResponse {
  const _BlockedUsersResponse({required final List<BlockedUser> data})
      : _data = data;
  factory _BlockedUsersResponse.fromJson(Map<String, dynamic> json) =>
      _$BlockedUsersResponseFromJson(json);

  final List<BlockedUser> _data;
  @override
  List<BlockedUser> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of BlockedUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BlockedUsersResponseCopyWith<_BlockedUsersResponse> get copyWith =>
      __$BlockedUsersResponseCopyWithImpl<_BlockedUsersResponse>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BlockedUsersResponseToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BlockedUsersResponse &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'BlockedUsersResponse(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$BlockedUsersResponseCopyWith<$Res>
    implements $BlockedUsersResponseCopyWith<$Res> {
  factory _$BlockedUsersResponseCopyWith(_BlockedUsersResponse value,
          $Res Function(_BlockedUsersResponse) _then) =
      __$BlockedUsersResponseCopyWithImpl;
  @override
  @useResult
  $Res call({List<BlockedUser> data});
}

/// @nodoc
class __$BlockedUsersResponseCopyWithImpl<$Res>
    implements _$BlockedUsersResponseCopyWith<$Res> {
  __$BlockedUsersResponseCopyWithImpl(this._self, this._then);

  final _BlockedUsersResponse _self;
  final $Res Function(_BlockedUsersResponse) _then;

  /// Create a copy of BlockedUsersResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_BlockedUsersResponse(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BlockedUser>,
    ));
  }
}

// dart format on
