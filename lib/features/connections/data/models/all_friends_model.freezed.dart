// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'all_friends_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendModel {
  @JsonKey(name: 'userAId', defaultValue: '')
  String get userId;
  String get friendId;
  String get friendUsername;
  @JsonKey(defaultValue: '')
  String get friendProfilePicture;
  bool get friendBlockStatus;

  /// Create a copy of FriendModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FriendModelCopyWith<FriendModel> get copyWith =>
      _$FriendModelCopyWithImpl<FriendModel>(this as FriendModel, _$identity);

  /// Serializes this FriendModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FriendModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.friendUsername, friendUsername) ||
                other.friendUsername == friendUsername) &&
            (identical(other.friendProfilePicture, friendProfilePicture) ||
                other.friendProfilePicture == friendProfilePicture) &&
            (identical(other.friendBlockStatus, friendBlockStatus) ||
                other.friendBlockStatus == friendBlockStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, friendId, friendUsername,
      friendProfilePicture, friendBlockStatus);

  @override
  String toString() {
    return 'FriendModel(userId: $userId, friendId: $friendId, friendUsername: $friendUsername, friendProfilePicture: $friendProfilePicture, friendBlockStatus: $friendBlockStatus)';
  }
}

/// @nodoc
abstract mixin class $FriendModelCopyWith<$Res> {
  factory $FriendModelCopyWith(
          FriendModel value, $Res Function(FriendModel) _then) =
      _$FriendModelCopyWithImpl;
  @useResult
  $Res call(
      {@JsonKey(name: 'userAId', defaultValue: '') String userId,
      String friendId,
      String friendUsername,
      @JsonKey(defaultValue: '') String friendProfilePicture,
      bool friendBlockStatus});
}

/// @nodoc
class _$FriendModelCopyWithImpl<$Res> implements $FriendModelCopyWith<$Res> {
  _$FriendModelCopyWithImpl(this._self, this._then);

  final FriendModel _self;
  final $Res Function(FriendModel) _then;

  /// Create a copy of FriendModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? friendId = null,
    Object? friendUsername = null,
    Object? friendProfilePicture = null,
    Object? friendBlockStatus = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      friendId: null == friendId
          ? _self.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as String,
      friendUsername: null == friendUsername
          ? _self.friendUsername
          : friendUsername // ignore: cast_nullable_to_non_nullable
              as String,
      friendProfilePicture: null == friendProfilePicture
          ? _self.friendProfilePicture
          : friendProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      friendBlockStatus: null == friendBlockStatus
          ? _self.friendBlockStatus
          : friendBlockStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FriendModel implements FriendModel {
  _FriendModel(
      {@JsonKey(name: 'userAId', defaultValue: '') required this.userId,
      required this.friendId,
      required this.friendUsername,
      @JsonKey(defaultValue: '') required this.friendProfilePicture,
      required this.friendBlockStatus});
  factory _FriendModel.fromJson(Map<String, dynamic> json) =>
      _$FriendModelFromJson(json);

  @override
  @JsonKey(name: 'userAId', defaultValue: '')
  final String userId;
  @override
  final String friendId;
  @override
  final String friendUsername;
  @override
  @JsonKey(defaultValue: '')
  final String friendProfilePicture;
  @override
  final bool friendBlockStatus;

  /// Create a copy of FriendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FriendModelCopyWith<_FriendModel> get copyWith =>
      __$FriendModelCopyWithImpl<_FriendModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FriendModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.friendId, friendId) ||
                other.friendId == friendId) &&
            (identical(other.friendUsername, friendUsername) ||
                other.friendUsername == friendUsername) &&
            (identical(other.friendProfilePicture, friendProfilePicture) ||
                other.friendProfilePicture == friendProfilePicture) &&
            (identical(other.friendBlockStatus, friendBlockStatus) ||
                other.friendBlockStatus == friendBlockStatus));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userId, friendId, friendUsername,
      friendProfilePicture, friendBlockStatus);

  @override
  String toString() {
    return 'FriendModel(userId: $userId, friendId: $friendId, friendUsername: $friendUsername, friendProfilePicture: $friendProfilePicture, friendBlockStatus: $friendBlockStatus)';
  }
}

/// @nodoc
abstract mixin class _$FriendModelCopyWith<$Res>
    implements $FriendModelCopyWith<$Res> {
  factory _$FriendModelCopyWith(
          _FriendModel value, $Res Function(_FriendModel) _then) =
      __$FriendModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {@JsonKey(name: 'userAId', defaultValue: '') String userId,
      String friendId,
      String friendUsername,
      @JsonKey(defaultValue: '') String friendProfilePicture,
      bool friendBlockStatus});
}

/// @nodoc
class __$FriendModelCopyWithImpl<$Res> implements _$FriendModelCopyWith<$Res> {
  __$FriendModelCopyWithImpl(this._self, this._then);

  final _FriendModel _self;
  final $Res Function(_FriendModel) _then;

  /// Create a copy of FriendModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? friendId = null,
    Object? friendUsername = null,
    Object? friendProfilePicture = null,
    Object? friendBlockStatus = null,
  }) {
    return _then(_FriendModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      friendId: null == friendId
          ? _self.friendId
          : friendId // ignore: cast_nullable_to_non_nullable
              as String,
      friendUsername: null == friendUsername
          ? _self.friendUsername
          : friendUsername // ignore: cast_nullable_to_non_nullable
              as String,
      friendProfilePicture: null == friendProfilePicture
          ? _self.friendProfilePicture
          : friendProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      friendBlockStatus: null == friendBlockStatus
          ? _self.friendBlockStatus
          : friendBlockStatus // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
mixin _$FriendsListModel {
  List<FriendModel> get data;

  /// Create a copy of FriendsListModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FriendsListModelCopyWith<FriendsListModel> get copyWith =>
      _$FriendsListModelCopyWithImpl<FriendsListModel>(
          this as FriendsListModel, _$identity);

  /// Serializes this FriendsListModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FriendsListModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'FriendsListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $FriendsListModelCopyWith<$Res> {
  factory $FriendsListModelCopyWith(
          FriendsListModel value, $Res Function(FriendsListModel) _then) =
      _$FriendsListModelCopyWithImpl;
  @useResult
  $Res call({List<FriendModel> data});
}

/// @nodoc
class _$FriendsListModelCopyWithImpl<$Res>
    implements $FriendsListModelCopyWith<$Res> {
  _$FriendsListModelCopyWithImpl(this._self, this._then);

  final FriendsListModel _self;
  final $Res Function(FriendsListModel) _then;

  /// Create a copy of FriendsListModel
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
              as List<FriendModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FriendsListModel implements FriendsListModel {
  _FriendsListModel({required final List<FriendModel> data}) : _data = data;
  factory _FriendsListModel.fromJson(Map<String, dynamic> json) =>
      _$FriendsListModelFromJson(json);

  final List<FriendModel> _data;
  @override
  List<FriendModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of FriendsListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FriendsListModelCopyWith<_FriendsListModel> get copyWith =>
      __$FriendsListModelCopyWithImpl<_FriendsListModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FriendsListModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendsListModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'FriendsListModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$FriendsListModelCopyWith<$Res>
    implements $FriendsListModelCopyWith<$Res> {
  factory _$FriendsListModelCopyWith(
          _FriendsListModel value, $Res Function(_FriendsListModel) _then) =
      __$FriendsListModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<FriendModel> data});
}

/// @nodoc
class __$FriendsListModelCopyWithImpl<$Res>
    implements _$FriendsListModelCopyWith<$Res> {
  __$FriendsListModelCopyWithImpl(this._self, this._then);

  final _FriendsListModel _self;
  final $Res Function(_FriendsListModel) _then;

  /// Create a copy of FriendsListModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_FriendsListModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FriendModel>,
    ));
  }
}

// dart format on
