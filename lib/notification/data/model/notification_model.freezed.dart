// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'notification_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) {
  return _NotificationModel.fromJson(json);
}

/// @nodoc
mixin _$NotificationModel {
  String get userId => throw _privateConstructorUsedError;
  String? get notificationType =>
      throw _privateConstructorUsedError; // Use String since "Transaction" is a string in JSON
  String get content => throw _privateConstructorUsedError;
  String? get userProfilePicUrl => throw _privateConstructorUsedError;
  bool get isRead => throw _privateConstructorUsedError;
  String? get notificationTypeValueId => throw _privateConstructorUsedError;
  String get id => throw _privateConstructorUsedError;
  String? get partitionKey => throw _privateConstructorUsedError;
  DateTime? get lastModifiedDate => throw _privateConstructorUsedError;
  DateTime? get createdDate => throw _privateConstructorUsedError;

  /// Serializes this NotificationModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $NotificationModelCopyWith<NotificationModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $NotificationModelCopyWith<$Res> {
  factory $NotificationModelCopyWith(
          NotificationModel value, $Res Function(NotificationModel) then) =
      _$NotificationModelCopyWithImpl<$Res, NotificationModel>;
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
class _$NotificationModelCopyWithImpl<$Res, $Val extends NotificationModel>
    implements $NotificationModelCopyWith<$Res> {
  _$NotificationModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

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
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: freezed == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePicUrl: freezed == userProfilePicUrl
          ? _value.userProfilePicUrl
          : userProfilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTypeValueId: freezed == notificationTypeValueId
          ? _value.notificationTypeValueId
          : notificationTypeValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: freezed == partitionKey
          ? _value.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$NotificationModelImplCopyWith<$Res>
    implements $NotificationModelCopyWith<$Res> {
  factory _$$NotificationModelImplCopyWith(_$NotificationModelImpl value,
          $Res Function(_$NotificationModelImpl) then) =
      __$$NotificationModelImplCopyWithImpl<$Res>;
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
class __$$NotificationModelImplCopyWithImpl<$Res>
    extends _$NotificationModelCopyWithImpl<$Res, _$NotificationModelImpl>
    implements _$$NotificationModelImplCopyWith<$Res> {
  __$$NotificationModelImplCopyWithImpl(_$NotificationModelImpl _value,
      $Res Function(_$NotificationModelImpl) _then)
      : super(_value, _then);

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
    return _then(_$NotificationModelImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      notificationType: freezed == notificationType
          ? _value.notificationType
          : notificationType // ignore: cast_nullable_to_non_nullable
              as String?,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      userProfilePicUrl: freezed == userProfilePicUrl
          ? _value.userProfilePicUrl
          : userProfilePicUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isRead: null == isRead
          ? _value.isRead
          : isRead // ignore: cast_nullable_to_non_nullable
              as bool,
      notificationTypeValueId: freezed == notificationTypeValueId
          ? _value.notificationTypeValueId
          : notificationTypeValueId // ignore: cast_nullable_to_non_nullable
              as String?,
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      partitionKey: freezed == partitionKey
          ? _value.partitionKey
          : partitionKey // ignore: cast_nullable_to_non_nullable
              as String?,
      lastModifiedDate: freezed == lastModifiedDate
          ? _value.lastModifiedDate
          : lastModifiedDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
      createdDate: freezed == createdDate
          ? _value.createdDate
          : createdDate // ignore: cast_nullable_to_non_nullable
              as DateTime?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$NotificationModelImpl implements _NotificationModel {
  _$NotificationModelImpl(
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

  factory _$NotificationModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$NotificationModelImplFromJson(json);

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

  @override
  String toString() {
    return 'NotificationModel(userId: $userId, notificationType: $notificationType, content: $content, userProfilePicUrl: $userProfilePicUrl, isRead: $isRead, notificationTypeValueId: $notificationTypeValueId, id: $id, partitionKey: $partitionKey, lastModifiedDate: $lastModifiedDate, createdDate: $createdDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$NotificationModelImpl &&
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

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      __$$NotificationModelImplCopyWithImpl<_$NotificationModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$NotificationModelImplToJson(
      this,
    );
  }
}

abstract class _NotificationModel implements NotificationModel {
  factory _NotificationModel(
      {required final String userId,
      final String? notificationType,
      required final String content,
      final String? userProfilePicUrl,
      required final bool isRead,
      final String? notificationTypeValueId,
      required final String id,
      final String? partitionKey,
      final DateTime? lastModifiedDate,
      final DateTime? createdDate}) = _$NotificationModelImpl;

  factory _NotificationModel.fromJson(Map<String, dynamic> json) =
      _$NotificationModelImpl.fromJson;

  @override
  String get userId;
  @override
  String?
      get notificationType; // Use String since "Transaction" is a string in JSON
  @override
  String get content;
  @override
  String? get userProfilePicUrl;
  @override
  bool get isRead;
  @override
  String? get notificationTypeValueId;
  @override
  String get id;
  @override
  String? get partitionKey;
  @override
  DateTime? get lastModifiedDate;
  @override
  DateTime? get createdDate;

  /// Create a copy of NotificationModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$NotificationModelImplCopyWith<_$NotificationModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
