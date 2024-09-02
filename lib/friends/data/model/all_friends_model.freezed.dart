// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_friends_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

FriendModel _$FriendModelFromJson(Map<String, dynamic> json) {
  return _FriendModel.fromJson(json);
}

/// @nodoc
mixin _$FriendModel {
  String get userAId => throw _privateConstructorUsedError;
  String get friendId => throw _privateConstructorUsedError;
  String get friendUsername => throw _privateConstructorUsedError;
  String get friendProfilePicture => throw _privateConstructorUsedError;
  bool get friendBlockStatus => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendModelCopyWith<FriendModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendModelCopyWith<$Res> {
  factory $FriendModelCopyWith(
          FriendModel value, $Res Function(FriendModel) then) =
      _$FriendModelCopyWithImpl<$Res, FriendModel>;
  @useResult
  $Res call(
      {String userAId,
      String friendId,
      String friendUsername,
      String friendProfilePicture,
      bool friendBlockStatus});
}

/// @nodoc
class _$FriendModelCopyWithImpl<$Res, $Val extends FriendModel>
    implements $FriendModelCopyWith<$Res> {
  _$FriendModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAId = null,
    Object? friendId = null,
    Object? friendUsername = null,
    Object? friendProfilePicture = null,
    Object? friendBlockStatus = null,
  }) {
    return _then(_value.copyWith(
      userAId: null == userAId
          ? _value.userAId
          : userAId // ignore: cast_nullable_to_non_nullable
              as String,
      friendId: null == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as String,
      friendUsername: null == friendUsername
          ? _value.friendUsername
          : friendUsername // ignore: cast_nullable_to_non_nullable
              as String,
      friendProfilePicture: null == friendProfilePicture
          ? _value.friendProfilePicture
          : friendProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      friendBlockStatus: null == friendBlockStatus
          ? _value.friendBlockStatus
          : friendBlockStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendModelImplCopyWith<$Res>
    implements $FriendModelCopyWith<$Res> {
  factory _$$FriendModelImplCopyWith(
          _$FriendModelImpl value, $Res Function(_$FriendModelImpl) then) =
      __$$FriendModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userAId,
      String friendId,
      String friendUsername,
      String friendProfilePicture,
      bool friendBlockStatus});
}

/// @nodoc
class __$$FriendModelImplCopyWithImpl<$Res>
    extends _$FriendModelCopyWithImpl<$Res, _$FriendModelImpl>
    implements _$$FriendModelImplCopyWith<$Res> {
  __$$FriendModelImplCopyWithImpl(
      _$FriendModelImpl _value, $Res Function(_$FriendModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userAId = null,
    Object? friendId = null,
    Object? friendUsername = null,
    Object? friendProfilePicture = null,
    Object? friendBlockStatus = null,
  }) {
    return _then(_$FriendModelImpl(
      userAId: null == userAId
          ? _value.userAId
          : userAId // ignore: cast_nullable_to_non_nullable
              as String,
      friendId: null == friendId
          ? _value.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as String,
      friendUsername: null == friendUsername
          ? _value.friendUsername
          : friendUsername // ignore: cast_nullable_to_non_nullable
              as String,
      friendProfilePicture: null == friendProfilePicture
          ? _value.friendProfilePicture
          : friendProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      friendBlockStatus: null == friendBlockStatus
          ? _value.friendBlockStatus
          : friendBlockStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendModelImpl implements _FriendModel {
  _$FriendModelImpl(
      {required this.userAId,
      required this.friendId,
      required this.friendUsername,
      required this.friendProfilePicture,
      required this.friendBlockStatus});

  factory _$FriendModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendModelImplFromJson(json);

  @override
  final String userAId;
  @override
  final String friendId;
  @override
  final String friendUsername;
  @override
  final String friendProfilePicture;
  @override
  final bool friendBlockStatus;

  @override
  String toString() {
    return 'FriendModel(userAId: $userAId, friendId: $friendId, friendUsername: $friendUsername, friendProfilePicture: $friendProfilePicture, friendBlockStatus: $friendBlockStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendModelImpl &&
            (identical(other.userAId, userAId) || other.userAId == userAId) &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.friendUsername, friendUsername) ||
                other.friendUsername == friendUsername) &&
            (identical(other.friendProfilePicture, friendProfilePicture) ||
                other.friendProfilePicture == friendProfilePicture) &&
            (identical(other.friendBlockStatus, friendBlockStatus) ||
                other.friendBlockStatus == friendBlockStatus));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, userAId, friendId,
      friendUsername, friendProfilePicture, friendBlockStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendModelImplCopyWith<_$FriendModelImpl> get copyWith =>
      __$$FriendModelImplCopyWithImpl<_$FriendModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendModelImplToJson(
      this,
    );
  }
}

abstract class _FriendModel implements FriendModel {
  factory _FriendModel(
      {required final String userAId,
      required final String friendId,
      required final String friendUsername,
      required final String friendProfilePicture,
      required final bool friendBlockStatus}) = _$FriendModelImpl;

  factory _FriendModel.fromJson(Map<String, dynamic> json) =
      _$FriendModelImpl.fromJson;

  @override
  String get userAId;
  @override
  String get friendId;
  @override
  String get friendUsername;
  @override
  String get friendProfilePicture;
  @override
  bool get friendBlockStatus;
  @override
  @JsonKey(ignore: true)
  _$$FriendModelImplCopyWith<_$FriendModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FriendsListModel _$FriendsListModelFromJson(Map<String, dynamic> json) {
  return _FriendsListModel.fromJson(json);
}

/// @nodoc
mixin _$FriendsListModel {
  List<FriendModel> get data => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FriendsListModelCopyWith<FriendsListModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendsListModelCopyWith<$Res> {
  factory $FriendsListModelCopyWith(
          FriendsListModel value, $Res Function(FriendsListModel) then) =
      _$FriendsListModelCopyWithImpl<$Res, FriendsListModel>;
  @useResult
  $Res call({List<FriendModel> data});
}

/// @nodoc
class _$FriendsListModelCopyWithImpl<$Res, $Val extends FriendsListModel>
    implements $FriendsListModelCopyWith<$Res> {
  _$FriendsListModelCopyWithImpl(this._value, this._then);

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
              as List<FriendModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FriendsListModelImplCopyWith<$Res>
    implements $FriendsListModelCopyWith<$Res> {
  factory _$$FriendsListModelImplCopyWith(_$FriendsListModelImpl value,
          $Res Function(_$FriendsListModelImpl) then) =
      __$$FriendsListModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<FriendModel> data});
}

/// @nodoc
class __$$FriendsListModelImplCopyWithImpl<$Res>
    extends _$FriendsListModelCopyWithImpl<$Res, _$FriendsListModelImpl>
    implements _$$FriendsListModelImplCopyWith<$Res> {
  __$$FriendsListModelImplCopyWithImpl(_$FriendsListModelImpl _value,
      $Res Function(_$FriendsListModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$FriendsListModelImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FriendModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FriendsListModelImpl implements _FriendsListModel {
  _$FriendsListModelImpl({required final List<FriendModel> data})
      : _data = data;

  factory _$FriendsListModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$FriendsListModelImplFromJson(json);

  final List<FriendModel> _data;
  @override
  List<FriendModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'FriendsListModel(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendsListModelImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendsListModelImplCopyWith<_$FriendsListModelImpl> get copyWith =>
      __$$FriendsListModelImplCopyWithImpl<_$FriendsListModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FriendsListModelImplToJson(
      this,
    );
  }
}

abstract class _FriendsListModel implements FriendsListModel {
  factory _FriendsListModel({required final List<FriendModel> data}) =
      _$FriendsListModelImpl;

  factory _FriendsListModel.fromJson(Map<String, dynamic> json) =
      _$FriendsListModelImpl.fromJson;

  @override
  List<FriendModel> get data;
  @override
  @JsonKey(ignore: true)
  _$$FriendsListModelImplCopyWith<_$FriendsListModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
