// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_event_message.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddyEventMessage {
  String get buddyEventId;
  String get buddyEventCreatorId;
  String get userId;
  String get username;
  String get message;
  String? get messageParentId;
  String get id;
  String get partitionKey;
  DateTime get lastModifiedDate;
  DateTime get createdDate;

  /// Create a copy of BuddyEventMessage
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventMessageCopyWith<BuddyEventMessage> get copyWith =>
      _$BuddyEventMessageCopyWithImpl<BuddyEventMessage>(
          this as BuddyEventMessage, _$identity);

  /// Serializes this BuddyEventMessage to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEventMessage &&
            (identical(other.buddyEventId, buddyEventId) ||
                other.buddyEventId == buddyEventId) &&
            (identical(other.buddyEventCreatorId, buddyEventCreatorId) ||
                other.buddyEventCreatorId == buddyEventCreatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageParentId, messageParentId) ||
                other.messageParentId == messageParentId) &&
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
      message,
      messageParentId,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'BuddyEventMessage(buddyEventId: $buddyEventId, buddyEventCreatorId: $buddyEventCreatorId, userId: $userId, username: $username, message: $message, messageParentId: $messageParentId, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventMessageCopyWith<$Res> {
  factory $BuddyEventMessageCopyWith(
          BuddyEventMessage value, $Res Function(BuddyEventMessage) _then) =
      _$BuddyEventMessageCopyWithImpl;
  @useResult
  $Res call(
      {String buddyEventId,
      String buddyEventCreatorId,
      String userId,
      String username,
      String message,
      String? messageParentId,
      String id,
      String partitionKey,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class _$BuddyEventMessageCopyWithImpl<$Res>
    implements $BuddyEventMessageCopyWith<$Res> {
  _$BuddyEventMessageCopyWithImpl(this._self, this._then);

  final BuddyEventMessage _self;
  final $Res Function(BuddyEventMessage) _then;

  /// Create a copy of BuddyEventMessage
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? buddyEventId = null,
    Object? buddyEventCreatorId = null,
    Object? userId = null,
    Object? username = null,
    Object? message = null,
    Object? messageParentId = freezed,
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
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageParentId: freezed == messageParentId
          ? _self.messageParentId
          : messageParentId // ignore: cast_nullable_to_non_nullable
              as String?,
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
class _BuddyEventMessage implements BuddyEventMessage {
  const _BuddyEventMessage(
      {required this.buddyEventId,
      required this.buddyEventCreatorId,
      required this.userId,
      required this.username,
      required this.message,
      this.messageParentId,
      required this.id,
      required this.partitionKey,
      required this.lastModifiedDate,
      required this.createdDate});
  factory _BuddyEventMessage.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventMessageFromJson(json);

  @override
  final String buddyEventId;
  @override
  final String buddyEventCreatorId;
  @override
  final String userId;
  @override
  final String username;
  @override
  final String message;
  @override
  final String? messageParentId;
  @override
  final String id;
  @override
  final String partitionKey;
  @override
  final DateTime lastModifiedDate;
  @override
  final DateTime createdDate;

  /// Create a copy of BuddyEventMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventMessageCopyWith<_BuddyEventMessage> get copyWith =>
      __$BuddyEventMessageCopyWithImpl<_BuddyEventMessage>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventMessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEventMessage &&
            (identical(other.buddyEventId, buddyEventId) ||
                other.buddyEventId == buddyEventId) &&
            (identical(other.buddyEventCreatorId, buddyEventCreatorId) ||
                other.buddyEventCreatorId == buddyEventCreatorId) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.messageParentId, messageParentId) ||
                other.messageParentId == messageParentId) &&
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
      message,
      messageParentId,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'BuddyEventMessage(buddyEventId: $buddyEventId, buddyEventCreatorId: $buddyEventCreatorId, userId: $userId, username: $username, message: $message, messageParentId: $messageParentId, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventMessageCopyWith<$Res>
    implements $BuddyEventMessageCopyWith<$Res> {
  factory _$BuddyEventMessageCopyWith(
          _BuddyEventMessage value, $Res Function(_BuddyEventMessage) _then) =
      __$BuddyEventMessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String buddyEventId,
      String buddyEventCreatorId,
      String userId,
      String username,
      String message,
      String? messageParentId,
      String id,
      String partitionKey,
      DateTime lastModifiedDate,
      DateTime createdDate});
}

/// @nodoc
class __$BuddyEventMessageCopyWithImpl<$Res>
    implements _$BuddyEventMessageCopyWith<$Res> {
  __$BuddyEventMessageCopyWithImpl(this._self, this._then);

  final _BuddyEventMessage _self;
  final $Res Function(_BuddyEventMessage) _then;

  /// Create a copy of BuddyEventMessage
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? buddyEventId = null,
    Object? buddyEventCreatorId = null,
    Object? userId = null,
    Object? username = null,
    Object? message = null,
    Object? messageParentId = freezed,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = null,
    Object? createdDate = null,
  }) {
    return _then(_BuddyEventMessage(
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
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      messageParentId: freezed == messageParentId
          ? _self.messageParentId
          : messageParentId // ignore: cast_nullable_to_non_nullable
              as String?,
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
