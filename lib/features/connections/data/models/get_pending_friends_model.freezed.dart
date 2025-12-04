// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'get_pending_friends_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$FriendRequestModel {
  String get id;
  String get requesterId;
  String get recieverId;
  DateTime get createDate;
  int get requestType;
  String get requesterName;
  String get requesterUserName;
  String get requesterProfilePicture;
  int get requesterAge;
  String get requesterGender;

  /// Create a copy of FriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $FriendRequestModelCopyWith<FriendRequestModel> get copyWith =>
      _$FriendRequestModelCopyWithImpl<FriendRequestModel>(
          this as FriendRequestModel, _$identity);

  /// Serializes this FriendRequestModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is FriendRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.recieverId, recieverId) ||
                other.recieverId == recieverId) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.requesterName, requesterName) ||
                other.requesterName == requesterName) &&
            (identical(other.requesterUserName, requesterUserName) ||
                other.requesterUserName == requesterUserName) &&
            (identical(
                    other.requesterProfilePicture, requesterProfilePicture) ||
                other.requesterProfilePicture == requesterProfilePicture) &&
            (identical(other.requesterAge, requesterAge) ||
                other.requesterAge == requesterAge) &&
            (identical(other.requesterGender, requesterGender) ||
                other.requesterGender == requesterGender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      requesterId,
      recieverId,
      createDate,
      requestType,
      requesterName,
      requesterUserName,
      requesterProfilePicture,
      requesterAge,
      requesterGender);

  @override
  String toString() {
    return 'FriendRequestModel(id: $id, requesterId: $requesterId, recieverId: $recieverId, createDate: $createDate, requestType: $requestType, requesterName: $requesterName, requesterUserName: $requesterUserName, requesterProfilePicture: $requesterProfilePicture, requesterAge: $requesterAge, requesterGender: $requesterGender)';
  }
}

/// @nodoc
abstract mixin class $FriendRequestModelCopyWith<$Res> {
  factory $FriendRequestModelCopyWith(
          FriendRequestModel value, $Res Function(FriendRequestModel) _then) =
      _$FriendRequestModelCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String requesterId,
      String recieverId,
      DateTime createDate,
      int requestType,
      String requesterName,
      String requesterUserName,
      String requesterProfilePicture,
      int requesterAge,
      String requesterGender});
}

/// @nodoc
class _$FriendRequestModelCopyWithImpl<$Res>
    implements $FriendRequestModelCopyWith<$Res> {
  _$FriendRequestModelCopyWithImpl(this._self, this._then);

  final FriendRequestModel _self;
  final $Res Function(FriendRequestModel) _then;

  /// Create a copy of FriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? requesterId = null,
    Object? recieverId = null,
    Object? createDate = null,
    Object? requestType = null,
    Object? requesterName = null,
    Object? requesterUserName = null,
    Object? requesterProfilePicture = null,
    Object? requesterAge = null,
    Object? requesterGender = null,
  }) {
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requesterId: null == requesterId
          ? _self.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverId: null == recieverId
          ? _self.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestType: null == requestType
          ? _self.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as int,
      requesterName: null == requesterName
          ? _self.requesterName
          : requesterName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterUserName: null == requesterUserName
          ? _self.requesterUserName
          : requesterUserName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterProfilePicture: null == requesterProfilePicture
          ? _self.requesterProfilePicture
          : requesterProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      requesterAge: null == requesterAge
          ? _self.requesterAge
          : requesterAge // ignore: cast_nullable_to_non_nullable
              as int,
      requesterGender: null == requesterGender
          ? _self.requesterGender
          : requesterGender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _FriendRequestModel implements FriendRequestModel {
  _FriendRequestModel(
      {required this.id,
      required this.requesterId,
      required this.recieverId,
      required this.createDate,
      required this.requestType,
      required this.requesterName,
      required this.requesterUserName,
      required this.requesterProfilePicture,
      required this.requesterAge,
      required this.requesterGender});
  factory _FriendRequestModel.fromJson(Map<String, dynamic> json) =>
      _$FriendRequestModelFromJson(json);

  @override
  final String id;
  @override
  final String requesterId;
  @override
  final String recieverId;
  @override
  final DateTime createDate;
  @override
  final int requestType;
  @override
  final String requesterName;
  @override
  final String requesterUserName;
  @override
  final String requesterProfilePicture;
  @override
  final int requesterAge;
  @override
  final String requesterGender;

  /// Create a copy of FriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$FriendRequestModelCopyWith<_FriendRequestModel> get copyWith =>
      __$FriendRequestModelCopyWithImpl<_FriendRequestModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$FriendRequestModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _FriendRequestModel &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.requesterId, requesterId) ||
                other.requesterId == requesterId) &&
            (identical(other.recieverId, recieverId) ||
                other.recieverId == recieverId) &&
            (identical(other.createDate, createDate) ||
                other.createDate == createDate) &&
            (identical(other.requestType, requestType) ||
                other.requestType == requestType) &&
            (identical(other.requesterName, requesterName) ||
                other.requesterName == requesterName) &&
            (identical(other.requesterUserName, requesterUserName) ||
                other.requesterUserName == requesterUserName) &&
            (identical(
                    other.requesterProfilePicture, requesterProfilePicture) ||
                other.requesterProfilePicture == requesterProfilePicture) &&
            (identical(other.requesterAge, requesterAge) ||
                other.requesterAge == requesterAge) &&
            (identical(other.requesterGender, requesterGender) ||
                other.requesterGender == requesterGender));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      requesterId,
      recieverId,
      createDate,
      requestType,
      requesterName,
      requesterUserName,
      requesterProfilePicture,
      requesterAge,
      requesterGender);

  @override
  String toString() {
    return 'FriendRequestModel(id: $id, requesterId: $requesterId, recieverId: $recieverId, createDate: $createDate, requestType: $requestType, requesterName: $requesterName, requesterUserName: $requesterUserName, requesterProfilePicture: $requesterProfilePicture, requesterAge: $requesterAge, requesterGender: $requesterGender)';
  }
}

/// @nodoc
abstract mixin class _$FriendRequestModelCopyWith<$Res>
    implements $FriendRequestModelCopyWith<$Res> {
  factory _$FriendRequestModelCopyWith(
          _FriendRequestModel value, $Res Function(_FriendRequestModel) _then) =
      __$FriendRequestModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String requesterId,
      String recieverId,
      DateTime createDate,
      int requestType,
      String requesterName,
      String requesterUserName,
      String requesterProfilePicture,
      int requesterAge,
      String requesterGender});
}

/// @nodoc
class __$FriendRequestModelCopyWithImpl<$Res>
    implements _$FriendRequestModelCopyWith<$Res> {
  __$FriendRequestModelCopyWithImpl(this._self, this._then);

  final _FriendRequestModel _self;
  final $Res Function(_FriendRequestModel) _then;

  /// Create a copy of FriendRequestModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? requesterId = null,
    Object? recieverId = null,
    Object? createDate = null,
    Object? requestType = null,
    Object? requesterName = null,
    Object? requesterUserName = null,
    Object? requesterProfilePicture = null,
    Object? requesterAge = null,
    Object? requesterGender = null,
  }) {
    return _then(_FriendRequestModel(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      requesterId: null == requesterId
          ? _self.requesterId
          : requesterId // ignore: cast_nullable_to_non_nullable
              as String,
      recieverId: null == recieverId
          ? _self.recieverId
          : recieverId // ignore: cast_nullable_to_non_nullable
              as String,
      createDate: null == createDate
          ? _self.createDate
          : createDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      requestType: null == requestType
          ? _self.requestType
          : requestType // ignore: cast_nullable_to_non_nullable
              as int,
      requesterName: null == requesterName
          ? _self.requesterName
          : requesterName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterUserName: null == requesterUserName
          ? _self.requesterUserName
          : requesterUserName // ignore: cast_nullable_to_non_nullable
              as String,
      requesterProfilePicture: null == requesterProfilePicture
          ? _self.requesterProfilePicture
          : requesterProfilePicture // ignore: cast_nullable_to_non_nullable
              as String,
      requesterAge: null == requesterAge
          ? _self.requesterAge
          : requesterAge // ignore: cast_nullable_to_non_nullable
              as int,
      requesterGender: null == requesterGender
          ? _self.requesterGender
          : requesterGender // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$GetPendingFriendsModel {
  List<FriendRequestModel> get data;

  /// Create a copy of GetPendingFriendsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $GetPendingFriendsModelCopyWith<GetPendingFriendsModel> get copyWith =>
      _$GetPendingFriendsModelCopyWithImpl<GetPendingFriendsModel>(
          this as GetPendingFriendsModel, _$identity);

  /// Serializes this GetPendingFriendsModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GetPendingFriendsModel &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'GetPendingFriendsModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class $GetPendingFriendsModelCopyWith<$Res> {
  factory $GetPendingFriendsModelCopyWith(GetPendingFriendsModel value,
          $Res Function(GetPendingFriendsModel) _then) =
      _$GetPendingFriendsModelCopyWithImpl;
  @useResult
  $Res call({List<FriendRequestModel> data});
}

/// @nodoc
class _$GetPendingFriendsModelCopyWithImpl<$Res>
    implements $GetPendingFriendsModelCopyWith<$Res> {
  _$GetPendingFriendsModelCopyWithImpl(this._self, this._then);

  final GetPendingFriendsModel _self;
  final $Res Function(GetPendingFriendsModel) _then;

  /// Create a copy of GetPendingFriendsModel
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
              as List<FriendRequestModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _GetPendingFriendsModel implements GetPendingFriendsModel {
  _GetPendingFriendsModel({required final List<FriendRequestModel> data})
      : _data = data;
  factory _GetPendingFriendsModel.fromJson(Map<String, dynamic> json) =>
      _$GetPendingFriendsModelFromJson(json);

  final List<FriendRequestModel> _data;
  @override
  List<FriendRequestModel> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of GetPendingFriendsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$GetPendingFriendsModelCopyWith<_GetPendingFriendsModel> get copyWith =>
      __$GetPendingFriendsModelCopyWithImpl<_GetPendingFriendsModel>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$GetPendingFriendsModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _GetPendingFriendsModel &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'GetPendingFriendsModel(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$GetPendingFriendsModelCopyWith<$Res>
    implements $GetPendingFriendsModelCopyWith<$Res> {
  factory _$GetPendingFriendsModelCopyWith(_GetPendingFriendsModel value,
          $Res Function(_GetPendingFriendsModel) _then) =
      __$GetPendingFriendsModelCopyWithImpl;
  @override
  @useResult
  $Res call({List<FriendRequestModel> data});
}

/// @nodoc
class __$GetPendingFriendsModelCopyWithImpl<$Res>
    implements _$GetPendingFriendsModelCopyWith<$Res> {
  __$GetPendingFriendsModelCopyWithImpl(this._self, this._then);

  final _GetPendingFriendsModel _self;
  final $Res Function(_GetPendingFriendsModel) _then;

  /// Create a copy of GetPendingFriendsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_GetPendingFriendsModel(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<FriendRequestModel>,
    ));
  }
}

// dart format on
