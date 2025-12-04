// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'chat_recipients_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ChatRecipients {
  List<Recipient> get data;

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ChatRecipientsCopyWith<ChatRecipients> get copyWith =>
      _$ChatRecipientsCopyWithImpl<ChatRecipients>(
          this as ChatRecipients, _$identity);

  /// Serializes this ChatRecipients to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ChatRecipients &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @override
  String toString() {
    return 'ChatRecipients(data: $data)';
  }
}

/// @nodoc
abstract mixin class $ChatRecipientsCopyWith<$Res> {
  factory $ChatRecipientsCopyWith(
          ChatRecipients value, $Res Function(ChatRecipients) _then) =
      _$ChatRecipientsCopyWithImpl;
  @useResult
  $Res call({List<Recipient> data});
}

/// @nodoc
class _$ChatRecipientsCopyWithImpl<$Res>
    implements $ChatRecipientsCopyWith<$Res> {
  _$ChatRecipientsCopyWithImpl(this._self, this._then);

  final ChatRecipients _self;
  final $Res Function(ChatRecipients) _then;

  /// Create a copy of ChatRecipients
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
              as List<Recipient>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _ChatRecipients implements ChatRecipients {
  const _ChatRecipients({required final List<Recipient> data}) : _data = data;
  factory _ChatRecipients.fromJson(Map<String, dynamic> json) =>
      _$ChatRecipientsFromJson(json);

  final List<Recipient> _data;
  @override
  List<Recipient> get data {
    if (_data is EqualUnmodifiableListView) return _data;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_data);
  }

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ChatRecipientsCopyWith<_ChatRecipients> get copyWith =>
      __$ChatRecipientsCopyWithImpl<_ChatRecipients>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ChatRecipientsToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ChatRecipients &&
            const DeepCollectionEquality().equals(other._data, _data));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_data));

  @override
  String toString() {
    return 'ChatRecipients(data: $data)';
  }
}

/// @nodoc
abstract mixin class _$ChatRecipientsCopyWith<$Res>
    implements $ChatRecipientsCopyWith<$Res> {
  factory _$ChatRecipientsCopyWith(
          _ChatRecipients value, $Res Function(_ChatRecipients) _then) =
      __$ChatRecipientsCopyWithImpl;
  @override
  @useResult
  $Res call({List<Recipient> data});
}

/// @nodoc
class __$ChatRecipientsCopyWithImpl<$Res>
    implements _$ChatRecipientsCopyWith<$Res> {
  __$ChatRecipientsCopyWithImpl(this._self, this._then);

  final _ChatRecipients _self;
  final $Res Function(_ChatRecipients) _then;

  /// Create a copy of ChatRecipients
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? data = null,
  }) {
    return _then(_ChatRecipients(
      data: null == data
          ? _self._data
          : data // ignore: cast_nullable_to_non_nullable
              as List<Recipient>,
    ));
  }
}

/// @nodoc
mixin _$Recipient {
  UserProfile get userProfile;
  String get lastUnreadMessage;
  DateTime get lastUnreadMessageTime;
  int get unreadMessageCount;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $RecipientCopyWith<Recipient> get copyWith =>
      _$RecipientCopyWithImpl<Recipient>(this as Recipient, _$identity);

  /// Serializes this Recipient to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Recipient &&
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

  @override
  String toString() {
    return 'Recipient(userProfile: $userProfile, lastUnreadMessage: $lastUnreadMessage, lastUnreadMessageTime: $lastUnreadMessageTime, unreadMessageCount: $unreadMessageCount)';
  }
}

/// @nodoc
abstract mixin class $RecipientCopyWith<$Res> {
  factory $RecipientCopyWith(Recipient value, $Res Function(Recipient) _then) =
      _$RecipientCopyWithImpl;
  @useResult
  $Res call(
      {UserProfile userProfile,
      String lastUnreadMessage,
      DateTime lastUnreadMessageTime,
      int unreadMessageCount});

  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class _$RecipientCopyWithImpl<$Res> implements $RecipientCopyWith<$Res> {
  _$RecipientCopyWithImpl(this._self, this._then);

  final Recipient _self;
  final $Res Function(Recipient) _then;

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
    return _then(_self.copyWith(
      userProfile: null == userProfile
          ? _self.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      lastUnreadMessage: null == lastUnreadMessage
          ? _self.lastUnreadMessage
          : lastUnreadMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastUnreadMessageTime: null == lastUnreadMessageTime
          ? _self.lastUnreadMessageTime
          : lastUnreadMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unreadMessageCount: null == unreadMessageCount
          ? _self.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_self.userProfile, (value) {
      return _then(_self.copyWith(userProfile: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class _Recipient implements Recipient {
  const _Recipient(
      {required this.userProfile,
      required this.lastUnreadMessage,
      required this.lastUnreadMessageTime,
      required this.unreadMessageCount});
  factory _Recipient.fromJson(Map<String, dynamic> json) =>
      _$RecipientFromJson(json);

  @override
  final UserProfile userProfile;
  @override
  final String lastUnreadMessage;
  @override
  final DateTime lastUnreadMessageTime;
  @override
  final int unreadMessageCount;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$RecipientCopyWith<_Recipient> get copyWith =>
      __$RecipientCopyWithImpl<_Recipient>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$RecipientToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Recipient &&
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

  @override
  String toString() {
    return 'Recipient(userProfile: $userProfile, lastUnreadMessage: $lastUnreadMessage, lastUnreadMessageTime: $lastUnreadMessageTime, unreadMessageCount: $unreadMessageCount)';
  }
}

/// @nodoc
abstract mixin class _$RecipientCopyWith<$Res>
    implements $RecipientCopyWith<$Res> {
  factory _$RecipientCopyWith(
          _Recipient value, $Res Function(_Recipient) _then) =
      __$RecipientCopyWithImpl;
  @override
  @useResult
  $Res call(
      {UserProfile userProfile,
      String lastUnreadMessage,
      DateTime lastUnreadMessageTime,
      int unreadMessageCount});

  @override
  $UserProfileCopyWith<$Res> get userProfile;
}

/// @nodoc
class __$RecipientCopyWithImpl<$Res> implements _$RecipientCopyWith<$Res> {
  __$RecipientCopyWithImpl(this._self, this._then);

  final _Recipient _self;
  final $Res Function(_Recipient) _then;

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userProfile = null,
    Object? lastUnreadMessage = null,
    Object? lastUnreadMessageTime = null,
    Object? unreadMessageCount = null,
  }) {
    return _then(_Recipient(
      userProfile: null == userProfile
          ? _self.userProfile
          : userProfile // ignore: cast_nullable_to_non_nullable
              as UserProfile,
      lastUnreadMessage: null == lastUnreadMessage
          ? _self.lastUnreadMessage
          : lastUnreadMessage // ignore: cast_nullable_to_non_nullable
              as String,
      lastUnreadMessageTime: null == lastUnreadMessageTime
          ? _self.lastUnreadMessageTime
          : lastUnreadMessageTime // ignore: cast_nullable_to_non_nullable
              as DateTime,
      unreadMessageCount: null == unreadMessageCount
          ? _self.unreadMessageCount
          : unreadMessageCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }

  /// Create a copy of Recipient
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<$Res> get userProfile {
    return $UserProfileCopyWith<$Res>(_self.userProfile, (value) {
      return _then(_self.copyWith(userProfile: value));
    });
  }
}

/// @nodoc
mixin _$UserProfile {
  String get id;
  String get firstName;
  String get lastName;
  String get profilePhotoURL;
  int get profileStatus;
  String get lastSeenTime;
  bool get isOnline;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $UserProfileCopyWith<UserProfile> get copyWith =>
      _$UserProfileCopyWithImpl<UserProfile>(this as UserProfile, _$identity);

  /// Serializes this UserProfile to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UserProfile &&
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

  @override
  String toString() {
    return 'UserProfile(id: $id, firstName: $firstName, lastName: $lastName, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus, lastSeenTime: $lastSeenTime, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class $UserProfileCopyWith<$Res> {
  factory $UserProfileCopyWith(
          UserProfile value, $Res Function(UserProfile) _then) =
      _$UserProfileCopyWithImpl;
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
class _$UserProfileCopyWithImpl<$Res> implements $UserProfileCopyWith<$Res> {
  _$UserProfileCopyWithImpl(this._self, this._then);

  final UserProfile _self;
  final $Res Function(UserProfile) _then;

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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      profileStatus: null == profileStatus
          ? _self.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as int,
      lastSeenTime: null == lastSeenTime
          ? _self.lastSeenTime
          : lastSeenTime // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _UserProfile implements UserProfile {
  const _UserProfile(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.profilePhotoURL,
      required this.profileStatus,
      required this.lastSeenTime,
      required this.isOnline});
  factory _UserProfile.fromJson(Map<String, dynamic> json) =>
      _$UserProfileFromJson(json);

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

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$UserProfileCopyWith<_UserProfile> get copyWith =>
      __$UserProfileCopyWithImpl<_UserProfile>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$UserProfileToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _UserProfile &&
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

  @override
  String toString() {
    return 'UserProfile(id: $id, firstName: $firstName, lastName: $lastName, profilePhotoURL: $profilePhotoURL, profileStatus: $profileStatus, lastSeenTime: $lastSeenTime, isOnline: $isOnline)';
  }
}

/// @nodoc
abstract mixin class _$UserProfileCopyWith<$Res>
    implements $UserProfileCopyWith<$Res> {
  factory _$UserProfileCopyWith(
          _UserProfile value, $Res Function(_UserProfile) _then) =
      __$UserProfileCopyWithImpl;
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
class __$UserProfileCopyWithImpl<$Res> implements _$UserProfileCopyWith<$Res> {
  __$UserProfileCopyWithImpl(this._self, this._then);

  final _UserProfile _self;
  final $Res Function(_UserProfile) _then;

  /// Create a copy of UserProfile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? profilePhotoURL = null,
    Object? profileStatus = null,
    Object? lastSeenTime = null,
    Object? isOnline = null,
  }) {
    return _then(_UserProfile(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      profilePhotoURL: null == profilePhotoURL
          ? _self.profilePhotoURL
          : profilePhotoURL // ignore: cast_nullable_to_non_nullable
              as String,
      profileStatus: null == profileStatus
          ? _self.profileStatus
          : profileStatus // ignore: cast_nullable_to_non_nullable
              as int,
      lastSeenTime: null == lastSeenTime
          ? _self.lastSeenTime
          : lastSeenTime // ignore: cast_nullable_to_non_nullable
              as String,
      isOnline: null == isOnline
          ? _self.isOnline
          : isOnline // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
