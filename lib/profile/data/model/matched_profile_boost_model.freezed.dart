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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MatchedProfileBoostModel _$MatchedProfileBoostModelFromJson(
    Map<String, dynamic> json) {
  return _MatchedProfileBoostModel.fromJson(json);
}

/// @nodoc
mixin _$MatchedProfileBoostModel {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get fullName => throw _privateConstructorUsedError;
  String get profileUrlForAds => throw _privateConstructorUsedError;
  String get userProfileUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchedProfileBoostModelCopyWith<MatchedProfileBoostModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchedProfileBoostModelCopyWith<$Res> {
  factory $MatchedProfileBoostModelCopyWith(MatchedProfileBoostModel value,
          $Res Function(MatchedProfileBoostModel) then) =
      _$MatchedProfileBoostModelCopyWithImpl<$Res, MatchedProfileBoostModel>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String fullName,
      String profileUrlForAds,
      String userProfileUrl});
}

/// @nodoc
class _$MatchedProfileBoostModelCopyWithImpl<$Res,
        $Val extends MatchedProfileBoostModel>
    implements $MatchedProfileBoostModelCopyWith<$Res> {
  _$MatchedProfileBoostModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? fullName = null,
    Object? profileUrlForAds = null,
    Object? userProfileUrl = null,
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
      userProfileUrl: null == userProfileUrl
          ? _value.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchedProfileBoostModelImplCopyWith<$Res>
    implements $MatchedProfileBoostModelCopyWith<$Res> {
  factory _$$MatchedProfileBoostModelImplCopyWith(
          _$MatchedProfileBoostModelImpl value,
          $Res Function(_$MatchedProfileBoostModelImpl) then) =
      __$$MatchedProfileBoostModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String userName,
      String fullName,
      String profileUrlForAds,
      String userProfileUrl});
}

/// @nodoc
class __$$MatchedProfileBoostModelImplCopyWithImpl<$Res>
    extends _$MatchedProfileBoostModelCopyWithImpl<$Res,
        _$MatchedProfileBoostModelImpl>
    implements _$$MatchedProfileBoostModelImplCopyWith<$Res> {
  __$$MatchedProfileBoostModelImplCopyWithImpl(
      _$MatchedProfileBoostModelImpl _value,
      $Res Function(_$MatchedProfileBoostModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? userName = null,
    Object? fullName = null,
    Object? profileUrlForAds = null,
    Object? userProfileUrl = null,
  }) {
    return _then(_$MatchedProfileBoostModelImpl(
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
      userProfileUrl: null == userProfileUrl
          ? _value.userProfileUrl
          : userProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

@JsonSerializable()
class _$MatchedProfileBoostModelImpl implements _MatchedProfileBoostModel {
  _$MatchedProfileBoostModelImpl(
      {required this.id,
      required this.userId,
      required this.userName,
      required this.fullName,
      required this.profileUrlForAds,
      required this.userProfileUrl});

  factory _$MatchedProfileBoostModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MatchedProfileBoostModelImplFromJson(json);

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
  final String userProfileUrl;

  @override
  String toString() {
    return 'MatchedProfileBoostModel(id: $id, userId: $userId, userName: $userName, fullName: $fullName, profileUrlForAds: $profileUrlForAds, userProfileUrl: $userProfileUrl)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchedProfileBoostModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.fullName, fullName) ||
                other.fullName == fullName) &&
            (identical(other.profileUrlForAds, profileUrlForAds) ||
                other.profileUrlForAds == profileUrlForAds) &&
            (identical(other.userProfileUrl, userProfileUrl) ||
                other.userProfileUrl == userProfileUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, userId, userName, fullName,
      profileUrlForAds, userProfileUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchedProfileBoostModelImplCopyWith<_$MatchedProfileBoostModelImpl>
      get copyWith => __$$MatchedProfileBoostModelImplCopyWithImpl<
          _$MatchedProfileBoostModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchedProfileBoostModelImplToJson(
      this,
    );
  }
}

abstract class _MatchedProfileBoostModel implements MatchedProfileBoostModel {
  factory _MatchedProfileBoostModel(
      {required final String id,
      required final String userId,
      required final String userName,
      required final String fullName,
      required final String profileUrlForAds,
      required final String userProfileUrl}) = _$MatchedProfileBoostModelImpl;

  factory _MatchedProfileBoostModel.fromJson(Map<String, dynamic> json) =
      _$MatchedProfileBoostModelImpl.fromJson;

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
  String get userProfileUrl;
  @override
  @JsonKey(ignore: true)
  _$$MatchedProfileBoostModelImplCopyWith<_$MatchedProfileBoostModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}

MatchedProfileBoostListModel _$MatchedProfileBoostListModelFromJson(
    Map<String, dynamic> json) {
  return _MatchedProfileBoostListModel.fromJson(json);
}

/// @nodoc
mixin _$MatchedProfileBoostListModel {
  List<MatchedProfileBoostModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MatchedProfileBoostListModelCopyWith<MatchedProfileBoostListModel>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MatchedProfileBoostListModelCopyWith<$Res> {
  factory $MatchedProfileBoostListModelCopyWith(
          MatchedProfileBoostListModel value,
          $Res Function(MatchedProfileBoostListModel) then) =
      _$MatchedProfileBoostListModelCopyWithImpl<$Res,
          MatchedProfileBoostListModel>;
  @useResult
  $Res call({List<MatchedProfileBoostModel> data});
}

/// @nodoc
class _$MatchedProfileBoostListModelCopyWithImpl<$Res,
        $Val extends MatchedProfileBoostListModel>
    implements $MatchedProfileBoostListModelCopyWith<$Res> {
  _$MatchedProfileBoostListModelCopyWithImpl(this._value, this._then);

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
              as List<MatchedProfileBoostModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MatchedProfileBoostListModelImplCopyWith<$Res>
    implements $MatchedProfileBoostListModelCopyWith<$Res> {
  factory _$$MatchedProfileBoostListModelImplCopyWith(
          _$MatchedProfileBoostListModelImpl value,
          $Res Function(_$MatchedProfileBoostListModelImpl) then) =
      __$$MatchedProfileBoostListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<MatchedProfileBoostModel> data});
}

/// @nodoc
class __$$MatchedProfileBoostListModelImplCopyWithImpl<$Res>
    extends _$MatchedProfileBoostListModelCopyWithImpl<$Res,
        _$MatchedProfileBoostListModelImpl>
    implements _$$MatchedProfileBoostListModelImplCopyWith<$Res> {
  __$$MatchedProfileBoostListModelImplCopyWithImpl(
      _$MatchedProfileBoostListModelImpl _value,
      $Res Function(_$MatchedProfileBoostListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$MatchedProfileBoostListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<MatchedProfileBoostModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MatchedProfileBoostListModelImpl
    implements _MatchedProfileBoostListModel {
  _$MatchedProfileBoostListModelImpl(
      {required final List<MatchedProfileBoostModel> data})
      : _data = data;

  factory _$MatchedProfileBoostListModelImpl.fromJson(
          Map<String, dynamic> json) =>
      _$$MatchedProfileBoostListModelImplFromJson(json);

  final List<MatchedProfileBoostModel> _data;
  @override
  List<MatchedProfileBoostModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'MatchedProfileBoostListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MatchedProfileBoostListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MatchedProfileBoostListModelImplCopyWith<
          _$MatchedProfileBoostListModelImpl>
      get copyWith => __$$MatchedProfileBoostListModelImplCopyWithImpl<
          _$MatchedProfileBoostListModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MatchedProfileBoostListModelImplToJson(
      this,
    );
  }
}

abstract class _MatchedProfileBoostListModel
    implements MatchedProfileBoostListModel {
  factory _MatchedProfileBoostListModel(
          {required final List<MatchedProfileBoostModel> data}) =
      _$MatchedProfileBoostListModelImpl;

  factory _MatchedProfileBoostListModel.fromJson(Map<String, dynamic> json) =
      _$MatchedProfileBoostListModelImpl.fromJson;

  @override
  List<MatchedProfileBoostModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$MatchedProfileBoostListModelImplCopyWith<
          _$MatchedProfileBoostListModelImpl>
      get copyWith => throw _privateConstructorUsedError;
}
