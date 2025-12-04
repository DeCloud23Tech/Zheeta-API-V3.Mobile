// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$NotificationModel {
  String get userId;
  String?
      get notificationType; // Use String since "Transaction" is a string in JSON
  String get content;
  String? get userProfilePicUrl;
  bool get isRead;
  String? get notificationTypeValueId;
  String get id;
  String? get partitionKey;
  DateTime? get lastModifiedDate;
  DateTime? get createdDate;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      _$NotificationModelCopyWithImpl<NotificationModel>(
          this as NotificationModel, _$identity);

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is NotificationModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userProfilePicUrl, userProfilePicUrl) ||
                other.userProfilePicUrl == userProfilePicUrl) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(
                    other.notificationTypeValueId, notificationTypeValueId) ||
                other.notificationTypeValueId == notificationTypeValueId) &&
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
      userId,
      notificationType,
      content,
      userProfilePicUrl,
      isRead,
      notificationTypeValueId,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'NotificationModel(userId: $userId, notificationType: $notificationType, content: $content, userProfilePicUrl: $userProfilePicUrl, isRead: $isRead, notificationTypeValueId: $notificationTypeValueId, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) _then) =
      _$NotificationModelCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      String? notificationType,
      String content,
      String? userProfilePicUrl,
      bool isRead,
      String? notificationTypeValueId,
      String id,
      String? partitionKey,
      DateTime? lastModifiedDate,
      DateTime? createdDate});
}

/// @nodoc
class _$NotificationModelCopyWithImpl<$Res>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._self, this._then);

  final NotificationModel _self;
  final $Res Function(NotificationModel) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? notificationType = freezed,
    Object? content = null,
    Object? userProfilePicUrl = freezed,
    Object? isRead = null,
    Object? notificationTypeValueId = freezed,
    Object? id = null,
    Object? partitionKey = freezed,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: freezed == notificationType
          ? _self.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePicUrl: freezed == userProfilePicUrl
          ? _self.userProfilePicUrl
          : userProfilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTypeValueId: freezed == notificationTypeValueId
          ? _self.notificationTypeValueId
          : notificationTypeValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: freezed == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _NotificationModel implements NotificationModel {
  _NotificationModel(
      {required this.userId,
      this.notificationType,
      required this.content,
      this.userProfilePicUrl,
      required this.isRead,
      this.notificationTypeValueId,
      required this.id,
      this.partitionKey,
      this.lastModifiedDate,
      this.createdDate});
  factory _NotificationModel.fromJson(Map<String, dynamic> json) =>
      _$NotificationModelFromJson(json);

  @override
  final String userId;
  @override
  final String? notificationType;
// Use String since "Transaction" is a string in JSON
  @override
  final String content;
  @override
  final String? userProfilePicUrl;
  @override
  final bool isRead;
  @override
  final String? notificationTypeValueId;
  @override
  final String id;
  @override
  final String? partitionKey;
  @override
  final DateTime? lastModifiedDate;
  @override
  final DateTime? createdDate;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$NotificationModelCopyWith<_NotificationModel> get copyWith =>
      __$NotificationModelCopyWithImpl<_NotificationModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$NotificationModelToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _NotificationModel &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.notificationType, notificationType) ||
                other.notificationType == notificationType) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.userProfilePicUrl, userProfilePicUrl) ||
                other.userProfilePicUrl == userProfilePicUrl) &&
            (identical(other.isRead, isRead) || other.isRead == isRead) &&
            (identical(
                    other.notificationTypeValueId, notificationTypeValueId) ||
                other.notificationTypeValueId == notificationTypeValueId) &&
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
      userId,
      notificationType,
      content,
      userProfilePicUrl,
      isRead,
      notificationTypeValueId,
      id,
      partitionKey,
      lastModifiedDate,
      createdDate);

  @override
  String toString() {
    return 'NotificationModel(userId: $userId, notificationType: $notificationType, content: $content, userProfilePicUrl: $userProfilePicUrl, isRead: $isRead, notificationTypeValueId: $notificationTypeValueId, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }
}

/// @nodoc
abstract mixin class _$NotificationModelCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$NotificationModelCopyWith(
          _NotificationModel value, $Res Function(_NotificationModel) _then) =
      __$NotificationModelCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String userId,
      String? notificationType,
      String content,
      String? userProfilePicUrl,
      bool isRead,
      String? notificationTypeValueId,
      String id,
      String? partitionKey,
      DateTime? lastModifiedDate,
      DateTime? createdDate});
}

/// @nodoc
class __$NotificationModelCopyWithImpl<$Res>
    implements _$NotificationModelCopyWith<$Res> {
  __$NotificationModelCopyWithImpl(this._self, this._then);

  final _NotificationModel _self;
  final $Res Function(_NotificationModel) _then;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? notificationType = freezed,
    Object? content = null,
    Object? userProfilePicUrl = freezed,
    Object? isRead = null,
    Object? notificationTypeValueId = freezed,
    Object? id = null,
    Object? partitionKey = freezed,
    Object? lastModifiedDate = freezed,
    Object? createdDate = freezed,
  }) {
    return _then(_NotificationModel(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: freezed == notificationType
          ? _self.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _self.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePicUrl: freezed == userProfilePicUrl
          ? _self.userProfilePicUrl
          : userProfilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _self.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTypeValueId: freezed == notificationTypeValueId
          ? _self.notificationTypeValueId
          : notificationTypeValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: freezed == partitionKey
          ? _self.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _self.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _self.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

// dart format on
