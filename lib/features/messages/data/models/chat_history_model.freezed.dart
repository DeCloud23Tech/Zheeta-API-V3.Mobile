// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_history_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatHistory {
  List<Message> get data;

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatHistoryCopyWith<ChatHistory> get copyWith =>
      _$ChatHistoryCopyWithImpl<ChatHistory>(this as ChatHistory, _$identity);

  /// Serializes this ChatHistory to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatHistory &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ChatHistory(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ChatHistoryCopyWith<$Res> {
  factory $ChatHistoryCopyWith(
          ChatHistory value, $Res Function(ChatHistory) _then) =
      _$ChatHistoryCopyWithImpl;
  @useResult
  $Res call({List<Message> data});
}

/// @nodoc
class _$ChatHistoryCopyWithImpl<$Res> implements $ChatHistoryCopyWith<$Res> {
  _$ChatHistoryCopyWithImpl(this._self, this._then);

  final ChatHistory _self;
  final $Res Function(ChatHistory) _then;

  /// Create a copy of ChatHistory
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
              as List<Message>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatHistory implements ChatHistory {
  const _ChatHistory({required final List<Message> data}) : _data = data;
  factory _ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);

  final List<Message> _data;
  @override
  List<Message> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatHistoryCopyWith<_ChatHistory> get copyWith =>
      __$ChatHistoryCopyWithImpl<_ChatHistory>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatHistoryToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatHistory &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ChatHistory(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ChatHistoryCopyWith<$Res>
    implements $ChatHistoryCopyWith<$Res> {
  factory _$ChatHistoryCopyWith(
          _ChatHistory value, $Res Function(_ChatHistory) _then) =
      __$ChatHistoryCopyWithImpl;
  @override
  @useResult
  $Res call({List<Message> data});
}

/// @nodoc
class __$ChatHistoryCopyWithImpl<$Res> implements _$ChatHistoryCopyWith<$Res> {
  __$ChatHistoryCopyWithImpl(this._self, this._then);

  final _ChatHistory _self;
  final $Res Function(_ChatHistory) _then;

  /// Create a copy of ChatHistory
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_ChatHistory(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Message>,
    ));
  }
}

/// @nodoc
mixin _$Message {
  String get message;
  String get recipientId;
  String get senderId;
  String get mediaUrl;
  String get timestamp;
  bool get isRead;
  String get id;
  String get partitionKey;
  String? get lastModifiedDate;
  String? get createdDate;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $MessageCopyWith<Message> get copyWith =>
      _$MessageCopyWithImpl<Message>(this as Message, _$identity);

  /// Serializes this Message to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Message &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
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
      message,
      recipientId,
      senderId,
      mediaUrl,
      timestamp,
      isRead,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'Message(message: $message, recipientId: $recipientId, senderId: $senderId, mediaUrl: $mediaUrl, timestamp: $timestamp, isRead: $isRead, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $MessageCopyWith<$Res> {
  factory $MessageCopyWith(Message value, $Res Function(Message) _then) =
      _$MessageCopyWithImpl;
  @useResult
  $Res call(
      {String message,
      String recipientId,
      String senderId,
      String mediaUrl,
      String timestamp,
      bool isRead,
      String id,
      String partitionKey,
      String? lastModifiedDate,
      String? createdDate});
}

/// @nodoc
class _$MessageCopyWithImpl<$Res> implements $MessageCopyWith<$Res> {
  _$MessageCopyWithImpl(this._self, this._then);

  final Message _self;
  final $Res Function(Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? message = null,
    Object? recipientId = null,
    Object? senderId = null,
    Object? mediaUrl = null,
    Object? timestamp = null,
    Object? isRead = null,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _Message implements Message {
  const _Message(
      {required this.message,
      required this.recipientId,
      required this.senderId,
      required this.mediaUrl,
      required this.timestamp,
      required this.isRead,
      required this.id,
      required this.partitionKey,
      this.lastModifiedDate,
      this.createdDate});
  factory _Message.fromJson(Map<String, dynamic> json) =>
      _$MessageFromJson(json);

  @override
  final String message;
  @override
  final String recipientId;
  @override
  final String senderId;
  @override
  final String mediaUrl;
  @override
  final String timestamp;
  @override
  final bool isRead;
  @override
  final String id;
  @override
  final String partitionKey;
  @override
  final String? lastModifiedDate;
  @override
  final String? createdDate;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$MessageCopyWith<_Message> get copyWith =>
      __$MessageCopyWithImpl<_Message>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$MessageToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Message &&
            (identical(other.message, message) || other.message == message) &&
            (identical(other.recipientId, recipientId) ||
                other.recipientId == recipientId) &&
            (identical(other.senderId, senderId) ||
                other.senderId == senderId) &&
            (identical(other.mediaUrl, mediaUrl) ||
                other.mediaUrl == mediaUrl) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
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
      message,
      recipientId,
      senderId,
      mediaUrl,
      timestamp,
      isRead,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'Message(message: $message, recipientId: $recipientId, senderId: $senderId, mediaUrl: $mediaUrl, timestamp: $timestamp, isRead: $isRead, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$MessageCopyWith<$Res> implements $MessageCopyWith<$Res> {
  factory _$MessageCopyWith(_Message value, $Res Function(_Message) _then) =
      __$MessageCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String message,
      String recipientId,
      String senderId,
      String mediaUrl,
      String timestamp,
      bool isRead,
      String id,
      String partitionKey,
      String? lastModifiedDate,
      String? createdDate});
}

/// @nodoc
class __$MessageCopyWithImpl<$Res> implements _$MessageCopyWith<$Res> {
  __$MessageCopyWithImpl(this._self, this._then);

  final _Message _self;
  final $Res Function(_Message) _then;

  /// Create a copy of Message
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? message = null,
    Object? recipientId = null,
    Object? senderId = null,
    Object? mediaUrl = null,
    Object? timestamp = null,
    Object? isRead = null,
    Object? id = null,
    Object? partitionKey = null,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_Message(
      message: null == message
          ? _self.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
      recipientId: null == recipientId
          ? _self.recipientId
          : recipientId // ignore: cast_nullable_to_non_nullable
              as String,
      senderId: null == senderId
          ? _self.senderId
          : senderId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaUrl: null == mediaUrl
          ? _self.mediaUrl
          : mediaUrl // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _self.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as String,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: null == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as String?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
