// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_event_join_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddyEventJoinRequest {
  String get buddyEventId;
  String get buddyEventCreatorId;
  String get userId;
  String get username;
  String get id;
  String get partitionKey;
  DateTime get lastModifiedDate;
  DateTime get createdDate;

  /// Create a copy of BuddyEventJoinRequest
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventJoinRequestCopyWith<BuddyEventJoinRequest> get copyWith =>
      _$BuddyEventJoinRequestCopyWithImpl<BuddyEventJoinRequest>(
          this as BuddyEventJoinRequest, _$identity);

  /// Serializes this BuddyEventJoinRequest to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEventJoinRequest &&
            (identical(other.buddyEventId, buddyEventId) ||
                other.buddyEventId == buddyEventId) &&
            (identical(other.buddyEventCreatorId, buddyEventCreatorId) ||
                other.buddyEventCreatorId == buddyEventCreatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partitionKey, partitionKey) ||
                other.partitionKey == partitionKey) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      buddyEventId,
      buddyEventCreatorId,
      userId,
      username,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'BuddyEventJoinRequest(buddyEventId: $buddyEventId, buddyEventCreatorId: $buddyEventCreatorId, userId: $userId, username: $username, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventJoinRequestCopyWith<$Res> {
  factory $BuddyEventJoinRequestCopyWith(BuddyEventJoinRequest value,
          $Res Function(BuddyEventJoinRequest) _then) =
      _$BuddyEventJoinRequestCopyWithImpl;
  @useResult
  $Res call(
      {String buddyEventId,
      String buddyEventCreatorId,
      String userId,
      String username,
      String id,
      String partitionKey,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class _$BuddyEventJoinRequestCopyWithImpl<$Res>
    implements $BuddyEventJoinRequestCopyWith<$Res> {
  _$BuddyEventJoinRequestCopyWithImpl(this._self, this._then);

  final BuddyEventJoinRequest _self;
  final $Res Function(BuddyEventJoinRequest) _then;

  /// Create a copy of BuddyEventJoinRequest
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buddyEventId = null,
    Object? buddyEventCreatorId = null,
    Object? userId = null,
    Object? username = null,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = null,
    Object? createdDate = null,
  }) {
    return _then(_self.copyWith(
      buddyEventId: null == buddyEventId
          ? _self.buddyEventId
          : buddyEventId // ignore: cast_nullable_to_non_nullable
              as String,
      buddyEventCreatorId: null == buddyEventCreatorId
          ? _self.buddyEventCreatorId
          : buddyEventCreatorId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: null == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddyEventJoinRequest implements BuddyEventJoinRequest {
  const _BuddyEventJoinRequest(
      {required this.buddyEventId,
      required this.buddyEventCreatorId,
      required this.userId,
      required this.username,
      required this.id,
      required this.partitionKey,
      required this.lastModifiedDate,
      required this.createdDate});
  factory _BuddyEventJoinRequest.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventJoinRequestFromJson(json);

  @override
  final String buddyEventId;
  @override
  final String buddyEventCreatorId;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String id;
  @override
  final String partitionKey;
  @override
  final DateTime lastModifiedDate;
  @override
  final DateTime createdDate;

  /// Create a copy of BuddyEventJoinRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventJoinRequestCopyWith<_BuddyEventJoinRequest> get copyWith =>
      __$BuddyEventJoinRequestCopyWithImpl<_BuddyEventJoinRequest>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventJoinRequestToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEventJoinRequest &&
            (identical(other.buddyEventId, buddyEventId) ||
                other.buddyEventId == buddyEventId) &&
            (identical(other.buddyEventCreatorId, buddyEventCreatorId) ||
                other.buddyEventCreatorId == buddyEventCreatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.partitionKey, partitionKey) ||
                other.partitionKey == partitionKey) &&
            (identical(other.lastModifiedDate, lastModifiedDate) ||
                other.lastModifiedDate == lastModifiedDate) &&
            (identical(other.createdDate, createdDate) ||
                other.createdDate == createdDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      buddyEventId,
      buddyEventCreatorId,
      userId,
      username,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'BuddyEventJoinRequest(buddyEventId: $buddyEventId, buddyEventCreatorId: $buddyEventCreatorId, userId: $userId, username: $username, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventJoinRequestCopyWith<$Res>
    implements $BuddyEventJoinRequestCopyWith<$Res> {
  factory _$BuddyEventJoinRequestCopyWith(_BuddyEventJoinRequest value,
          $Res Function(_BuddyEventJoinRequest) _then) =
      __$BuddyEventJoinRequestCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String buddyEventId,
      String buddyEventCreatorId,
      String userId,
      String username,
      String id,
      String partitionKey,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class __$BuddyEventJoinRequestCopyWithImpl<$Res>
    implements _$BuddyEventJoinRequestCopyWith<$Res> {
  __$BuddyEventJoinRequestCopyWithImpl(this._self, this._then);

  final _BuddyEventJoinRequest _self;
  final $Res Function(_BuddyEventJoinRequest) _then;

  /// Create a copy of BuddyEventJoinRequest
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? buddyEventId = null,
    Object? buddyEventCreatorId = null,
    Object? userId = null,
    Object? username = null,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = null,
    Object? createdDate = null,
  }) {
    return _then(_BuddyEventJoinRequest(
      buddyEventId: null == buddyEventId
          ? _self.buddyEventId
          : buddyEventId // ignore: cast_nullable_to_non_nullable
              as String,
      buddyEventCreatorId: null == buddyEventCreatorId
          ? _self.buddyEventCreatorId
          : buddyEventCreatorId // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: null == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      createdDate: null == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

// dart format on
