// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'blocked_user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

BlockedUser _$BlockedUserFromJson(Map<String, dynamic> json) {
  return _BlockedUser.fromJson(json);
}

/// @nodoc
mixin _$BlockedUser {
  String get userName => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  int get age => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get gender => throw _privateConstructorUsedError;
  String get profilePhotoURL => throw _privateConstructorUsedError;
  String get blockedUserId => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockedUserCopyWith<BlockedUser> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUserCopyWith<$Res> {
  factory $BlockedUserCopyWith(
          BlockedUser value, $Res Function(BlockedUser) then) =
      _$BlockedUserCopyWithImpl<$Res, BlockedUser>;
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
class _$BlockedUserCopyWithImpl<$Res, $Val extends BlockedUser>
    implements $BlockedUserCopyWith<$Res> {
  _$BlockedUserCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      blockedUserId: null == blockedUserId
          ? _value.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockedUserImplCopyWith<$Res>
    implements $BlockedUserCopyWith<$Res> {
  factory _$$BlockedUserImplCopyWith(
          _$BlockedUserImpl value, $Res Function(_$BlockedUserImpl) then) =
      __$$BlockedUserImplCopyWithImpl<$Res>;
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
class __$$BlockedUserImplCopyWithImpl<$Res>
    extends _$BlockedUserCopyWithImpl<$Res, _$BlockedUserImpl>
    implements _$$BlockedUserImplCopyWith<$Res> {
  __$$BlockedUserImplCopyWithImpl(
      _$BlockedUserImpl _value, $Res Function(_$BlockedUserImpl) _then)
      : super(_value, _then);

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
    return _then(_$BlockedUserImpl(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      fullName: null == fullName
          ? _value.fullName
          : fullName // ignore: cast_nullable_to_non_nullable
              as String,
      age: null == age
          ? _value.age
          : age // ignore: cast_nullable_to_non_nullable
              as int,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      gender: null == gender
          ? _value.gender
          : gender // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      blockedUserId: null == blockedUserId
          ? _value.blockedUserId
          : blockedUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockedUserImpl implements _BlockedUser {
  const _$BlockedUserImpl(
      {required this.userName,
      required this.fullName,
      required this.age,
      required this.city,
      required this.country,
      required this.gender,
      required this.profilePhotoURL,
      required this.blockedUserId});

  factory _$BlockedUserImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockedUserImplFromJson(json);

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

  @override
  String toString() {
    return 'BlockedUser(userName: $userName, fullName: $fullName, age: $age, city: $city, country: $country, gender: $gender, profilePhotoURL: $profilePhotoURL, blockedUserId: $blockedUserId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedUserImpl &&
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

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userName, fullName, age, city,
      country, gender, profilePhotoURL, blockedUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockedUserImplCopyWith<_$BlockedUserImpl> get copyWith =>
      __$$BlockedUserImplCopyWithImpl<_$BlockedUserImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockedUserImplToJson(
      this,
    );
  }
}

abstract class _BlockedUser implements BlockedUser {
  const factory _BlockedUser(
      {required final String userName,
      required final String fullName,
      required final int age,
      required final String city,
      required final String country,
      required final String gender,
      required final String profilePhotoURL,
      required final String blockedUserId}) = _$BlockedUserImpl;

  factory _BlockedUser.fromJson(Map<String, dynamic> json) =
      _$BlockedUserImpl.fromJson;

  @override
  String get userName;
  @override
  String get fullName;
  @override
  int get age;
  @override
  String get city;
  @override
  String get country;
  @override
  String get gender;
  @override
  String get profilePhotoURL;
  @override
  String get blockedUserId;
  @override
  @JsonKey(ignore: true)
  _$$BlockedUserImplCopyWith<_$BlockedUserImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

BlockedUsersResponse _$BlockedUsersResponseFromJson(Map<String, dynamic> json) {
  return _BlockedUsersResponse.fromJson(json);
}

/// @nodoc
mixin _$BlockedUsersResponse {
  List<BlockedUser> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BlockedUsersResponseCopyWith<BlockedUsersResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BlockedUsersResponseCopyWith<$Res> {
  factory $BlockedUsersResponseCopyWith(BlockedUsersResponse value,
          $Res Function(BlockedUsersResponse) then) =
      _$BlockedUsersResponseCopyWithImpl<$Res, BlockedUsersResponse>;
  @useResult
  $Res call({List<BlockedUser> data});
}

/// @nodoc
class _$BlockedUsersResponseCopyWithImpl<$Res,
        $Val extends BlockedUsersResponse>
    implements $BlockedUsersResponseCopyWith<$Res> {
  _$BlockedUsersResponseCopyWithImpl(this._value, this._then);

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
              as List<BlockedUser>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BlockedUsersResponseImplCopyWith<$Res>
    implements $BlockedUsersResponseCopyWith<$Res> {
  factory _$$BlockedUsersResponseImplCopyWith(_$BlockedUsersResponseImpl value,
          $Res Function(_$BlockedUsersResponseImpl) then) =
      __$$BlockedUsersResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<BlockedUser> data});
}

/// @nodoc
class __$$BlockedUsersResponseImplCopyWithImpl<$Res>
    extends _$BlockedUsersResponseCopyWithImpl<$Res, _$BlockedUsersResponseImpl>
    implements _$$BlockedUsersResponseImplCopyWith<$Res> {
  __$$BlockedUsersResponseImplCopyWithImpl(_$BlockedUsersResponseImpl _value,
      $Res Function(_$BlockedUsersResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$BlockedUsersResponseImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<BlockedUser>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BlockedUsersResponseImpl implements _BlockedUsersResponse {
  const _$BlockedUsersResponseImpl({required final List<BlockedUser> data})
      : _data = data;

  factory _$BlockedUsersResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$BlockedUsersResponseImplFromJson(json);

  final List<BlockedUser> _data;
  @override
  List<BlockedUser> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'BlockedUsersResponse(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BlockedUsersResponseImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BlockedUsersResponseImplCopyWith<_$BlockedUsersResponseImpl>
      get copyWith =>
          __$$BlockedUsersResponseImplCopyWithImpl<_$BlockedUsersResponseImpl>(
              this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BlockedUsersResponseImplToJson(
      this,
    );
  }
}

abstract class _BlockedUsersResponse implements BlockedUsersResponse {
  const factory _BlockedUsersResponse({required final List<BlockedUser> data}) =
      _$BlockedUsersResponseImpl;

  factory _BlockedUsersResponse.fromJson(Map<String, dynamic> json) =
      _$BlockedUsersResponseImpl.fromJson;

  @override
  List<BlockedUser> get data;
  @override
  @JsonKey(ignore: true)
  _$$BlockedUsersResponseImplCopyWith<_$BlockedUsersResponseImpl>
      get copyWith => throw _privateConstructorUsedError;
}
