// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_recipients_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

ChatRecipients _$ChatRecipientsFromJson(Map<String, dynamic> json) {
  return _ChatRecipients.fromJson(json);
}

/// @nodoc
mixin _$ChatRecipients {
  List<Recipient> get data => throw _privateConstructorUsedError;

  /// Serializes this ChatRecipients to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ChatRecipientsCopyWith<ChatRecipients> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ChatRecipientsCopyWith<$Res> {
  factory $ChatRecipientsCopyWith(
          ChatRecipients value, $Res Function(ChatRecipients) then) =
      _$ChatRecipientsCopyWithImpl<$Res, ChatRecipients>;
  @useResult
  $Res call({List<Recipient> data});
}

/// @nodoc
class _$ChatRecipientsCopyWithImpl<$Res, $Val extends ChatRecipients>
    implements $ChatRecipientsCopyWith<$Res> {
  _$ChatRecipientsCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_value.copyWith(
      data: null == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ChatRecipientsImplCopyWith<$Res>
    implements $ChatRecipientsCopyWith<$Res> {
  factory _$$ChatRecipientsImplCopyWith(_$ChatRecipientsImpl value,
          $Res Function(_$ChatRecipientsImpl) then) =
      __$$ChatRecipientsImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Recipient> data});
}

/// @nodoc
class __$$ChatRecipientsImplCopyWithImpl<$Res>
    extends _$ChatRecipientsCopyWithImpl<$Res, _$ChatRecipientsImpl>
    implements _$$ChatRecipientsImplCopyWith<$Res> {
  __$$ChatRecipientsImplCopyWithImpl(
      _$ChatRecipientsImpl _value, $Res Function(_$ChatRecipientsImpl) _then)
      : super(_value, _then);

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$ChatRecipientsImpl(
      data: null == data
          ? _value._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ChatRecipientsImpl implements _ChatRecipients {
  const _$ChatRecipientsImpl({required final List<Recipient> data})
      : _data = data;

  factory _$ChatRecipientsImpl.fromJson(Map<String, dynamic> json) =>
      _$$ChatRecipientsImplFromJson(json);

  final List<Recipient> _data;
  @override
  List<Recipient> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  @override
  String toString() {
    return 'ChatRecipients(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ChatRecipientsImpl &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ChatRecipientsImplCopyWith<_$ChatRecipientsImpl> get copyWith =>
      __$$ChatRecipientsImplCopyWithImpl<_$ChatRecipientsImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ChatRecipientsImplToJson(
      this,
    );
  }
}

abstract class _ChatRecipients implements ChatRecipients {
  const factory _ChatRecipients({required final List<Recipient> data}) =
      _$ChatRecipientsImpl;

  factory _ChatRecipients.fromJson(Map<String, dynamic> json) =
      _$ChatRecipientsImpl.fromJson;

  @override
  List<Recipient> get data;

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ChatRecipientsImplCopyWith<_$ChatRecipientsImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

Recipient _$RecipientFromJson(Map<String, dynamic> json) {
  return _Recipient.fromJson(json);
}

/// @nodoc
mixin _$Recipient {
  UserProfile get userProfile => throw _privateConstructorUsedError;
  String get lastUnreadMessage => throw _privateConstructorUsedError;
  String get lastUnreadMessageTime => throw _privateConstructorUsedError;
  int get unreadMessageCount => throw _privateConstructorUsedError;

  /// Serializes this Recipient to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $RecipientCopyWith<Recipient> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecipientCopyWith<$Res> {
  factory $RecipientCopyWith(Recipient value, $Res Function(Recipient) then) =
      _$RecipientCopyWithImpl<$Res, Recipient>;
  @useResult
  $Res call(
      {UserProfile userProfile,
      String lastUnreadMessage,
      String lastUnreadMessageTime,
      int unreadMessageCount});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$RecipientCopyWithImpl<$Res, $Val extends Recipient>
    implements $RecipientCopyWith<$Res> {
  _$RecipientCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? lastUnreadMessage = null,
    Object? lastUnreadMessageTime = null,
    Object? unreadMessageCount = null,
  }) {
    return _then(_value.copyWith(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      lastUnreadMessage: null == lastUnreadMessage
          ? _value.lastUnreadMessage
          : lastUnreadMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastUnreadMessageTime: null == lastUnreadMessageTime
          ? _value.lastUnreadMessageTime
          : lastUnreadMessageTime // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_value.userProfile, (value) {
      return _then(_value.copyWith(userProfile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$RecipientImplCopyWith<$Res>
    implements $RecipientCopyWith<$Res> {
  factory _$$RecipientImplCopyWith(
          _$RecipientImpl value, $Res Function(_$RecipientImpl) then) =
      __$$RecipientImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserProfile userProfile,
      String lastUnreadMessage,
      String lastUnreadMessageTime,
      int unreadMessageCount});

  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$$RecipientImplCopyWithImpl<$Res>
    extends _$RecipientCopyWithImpl<$Res, _$RecipientImpl>
    implements _$$RecipientImplCopyWith<$Res> {
  __$$RecipientImplCopyWithImpl(
      _$RecipientImpl _value, $Res Function(_$RecipientImpl) _then)
      : super(_value, _then);

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userProfile = null,
    Object? lastUnreadMessage = null,
    Object? lastUnreadMessageTime = null,
    Object? unreadMessageCount = null,
  }) {
    return _then(_$RecipientImpl(
      userProfile: null == userProfile
          ? _value.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      lastUnreadMessage: null == lastUnreadMessage
          ? _value.lastUnreadMessage
          : lastUnreadMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastUnreadMessageTime: null == lastUnreadMessageTime
          ? _value.lastUnreadMessageTime
          : lastUnreadMessageTime // ignore: cast_nullable_to_non_nullable
              as String,
      unreadMessageCount: null == unreadMessageCount
          ? _value.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecipientImpl implements _Recipient {
  const _$RecipientImpl(
      {required this.userProfile,
      required this.lastUnreadMessage,
      required this.lastUnreadMessageTime,
      required this.unreadMessageCount});

  factory _$RecipientImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecipientImplFromJson(json);

  @override
  final UserProfile userProfile;
  @override
  final String lastUnreadMessage;
  @override
  final String lastUnreadMessageTime;
  @override
  final int unreadMessageCount;

  @override
  String toString() {
    return 'Recipient(userProfile: $userProfile, lastUnreadMessage: $lastUnreadMessage, lastUnreadMessageTime: $lastUnreadMessageTime, unreadMessageCount: $unreadMessageCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecipientImpl &&
            (identical(other.userProfile, userProfile) ||
                other.userProfile == userProfile) &&
            (identical(other.lastUnreadMessage, lastUnreadMessage) ||
                other.lastUnreadMessage == lastUnreadMessage) &&
            (identical(other.lastUnreadMessageTime, lastUnreadMessageTime) ||
                other.lastUnreadMessageTime == lastUnreadMessageTime) &&
            (identical(other.unreadMessageCount, unreadMessageCount) ||
                other.unreadMessageCount == unreadMessageCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, userProfile, lastUnreadMessage,
      lastUnreadMessageTime, unreadMessageCount);

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$RecipientImplCopyWith<_$RecipientImpl> get copyWith =>
      __$$RecipientImplCopyWithImpl<_$RecipientImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecipientImplToJson(
      this,
    );
  }
}

abstract class _Recipient implements Recipient {
  const factory _Recipient(
      {required final UserProfile userProfile,
      required final String lastUnreadMessage,
      required final String lastUnreadMessageTime,
      required final int unreadMessageCount}) = _$RecipientImpl;

  factory _Recipient.fromJson(Map<String, dynamic> json) =
      _$RecipientImpl.fromJson;

  @override
  UserProfile get userProfile;
  @override
  String get lastUnreadMessage;
  @override
  String get lastUnreadMessageTime;
  @override
  int get unreadMessageCount;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$RecipientImplCopyWith<_$RecipientImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) {
  return _UserProfile.fromJson(json);
}

/// @nodoc
mixin _$UserProfile {
  String get id => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get profilePhotoURL => throw _privateConstructorUsedError;
  int get profileStatus => throw _privateConstructorUsedError;
  String get lastSeenTime => throw _privateConstructorUsedError;
  bool get isOnline => throw _privateConstructorUsedError;

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $UserProfileCopyWith<UserProfile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) then) =
      _$UserProfileCopyWithImpl<$Res, UserProfile>;
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String profilePhotoURL,
      int profileStatus,
      String lastSeenTime,
      bool isOnline});
}

/// @nodoc
class _$UserProfileCopyWithImpl<$Res, $Val extends UserProfile>
    implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profilePhotoURL = null,
    Object? profileStatus = null,
    Object? lastSeenTime = null,
    Object? isOnline = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      profileStatus: null == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as int,
      lastSeenTime: null == lastSeenTime
          ? _value.lastSeenTime
          : lastSeenTime // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserProfileImplCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$$UserProfileImplCopyWith(
          _$UserProfileImpl value, $Res Function(_$UserProfileImpl) then) =
      __$$UserProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String firstName,
      String lastName,
      String profilePhotoURL,
      int profileStatus,
      String lastSeenTime,
      bool isOnline});
}

/// @nodoc
class __$$UserProfileImplCopyWithImpl<$Res>
    extends _$UserProfileCopyWithImpl<$Res, _$UserProfileImpl>
    implements _$$UserProfileImplCopyWith<$Res> {
  __$$UserProfileImplCopyWithImpl(
      _$UserProfileImpl _value, $Res Function(_$UserProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profilePhotoURL = null,
    Object? profileStatus = null,
    Object? lastSeenTime = null,
    Object? isOnline = null,
  }) {
    return _then(_$UserProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _value.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      profileStatus: null == profileStatus
          ? _value.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as int,
      lastSeenTime: null == lastSeenTime
          ? _value.lastSeenTime
          : lastSeenTime // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _value.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserProfileImpl implements _UserProfile {
  const _$UserProfileImpl(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.profilePhotoURL,
      required this.profileStatus,
      required this.lastSeenTime,
      required this.isOnline});

  factory _$UserProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String profilePhotoURL;
  @override
  final int profileStatus;
  @override
  final String lastSeenTime;
  @override
  final bool isOnline;

  @override
  String toString() {
    return 'UserProfile(id: $id, firstName: $firstName, lastName: $lastName, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus, lastSeenTime: $lastSeenTime, isOnline: $isOnline)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.profilePhotoURL, profilePhotoURL) ||
                other.profilePhotoURL == profilePhotoURL) &&
            (identical(other.profileStatus, profileStatus) ||
                other.profileStatus == profileStatus) &&
            (identical(other.lastSeenTime, lastSeenTime) ||
                other.lastSeenTime == lastSeenTime) &&
            (identical(other.isOnline, isOnline) ||
                other.isOnline == isOnline));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, firstName, lastName,
      profilePhotoURL, profileStatus, lastSeenTime, isOnline);

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      __$$UserProfileImplCopyWithImpl<_$UserProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserProfileImplToJson(
      this,
    );
  }
}

abstract class _UserProfile implements UserProfile {
  const factory _UserProfile(
      {required final String id,
      required final String firstName,
      required final String lastName,
      required final String profilePhotoURL,
      required final int profileStatus,
      required final String lastSeenTime,
      required final bool isOnline}) = _$UserProfileImpl;

  factory _UserProfile.fromJson(Map<String, dynamic> json) =
      _$UserProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get profilePhotoURL;
  @override
  int get profileStatus;
  @override
  String get lastSeenTime;
  @override
  bool get isOnline;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$UserProfileImplCopyWith<_$UserProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
