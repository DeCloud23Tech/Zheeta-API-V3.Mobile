// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_event_members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BuddyEventMember {
  String get userId;
  String get username;
  String get profilePicture;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BuddyEventMemberCopyWith<BuddyEventMember> get copyWith =>
      _$BuddyEventMemberCopyWithImpl<BuddyEventMember>(
          this as BuddyEventMember, _$identity);

  /// Serializes this BuddyEventMember to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BuddyEventMember &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, username, profilePicture);

  @override
  String toString() {
    return 'BuddyEventMember(userId: $userId, username: $username, profilePicture: $profilePicture)';
  }
}

/// @nodoc
abstract mixin class $BuddyEventMemberCopyWith<$Res> {
  factory $BuddyEventMemberCopyWith(
          BuddyEventMember value, $Res Function(BuddyEventMember) _then) =
      _$BuddyEventMemberCopyWithImpl;
  @useResult
  $Res call({String userId, String username, String profilePicture});
}

/// @nodoc
class _$BuddyEventMemberCopyWithImpl<$Res>
    implements $BuddyEventMemberCopyWith<$Res> {
  _$BuddyEventMemberCopyWithImpl(this._self, this._then);

  final BuddyEventMember _self;
  final $Res Function(BuddyEventMember) _then;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? profilePicture = null,
  }) {
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _BuddyEventMember implements BuddyEventMember {
  _BuddyEventMember(
      {required this.userId,
      required this.username,
      required this.profilePicture});
  factory _BuddyEventMember.fromJson(Map<String, dynamic> json) =>
      _$BuddyEventMemberFromJson(json);

  @override
  final String userId;
  @override
  final String username;
  @override
  final String profilePicture;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BuddyEventMemberCopyWith<_BuddyEventMember> get copyWith =>
      __$BuddyEventMemberCopyWithImpl<_BuddyEventMember>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$BuddyEventMemberToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BuddyEventMember &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.profilePicture, profilePicture) ||
                other.profilePicture == profilePicture));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, userId, username, profilePicture);

  @override
  String toString() {
    return 'BuddyEventMember(userId: $userId, username: $username, profilePicture: $profilePicture)';
  }
}

/// @nodoc
abstract mixin class _$BuddyEventMemberCopyWith<$Res>
    implements $BuddyEventMemberCopyWith<$Res> {
  factory _$BuddyEventMemberCopyWith(
          _BuddyEventMember value, $Res Function(_BuddyEventMember) _then) =
      __$BuddyEventMemberCopyWithImpl;
  @override
  @useResult
  $Res call({String userId, String username, String profilePicture});
}

/// @nodoc
class __$BuddyEventMemberCopyWithImpl<$Res>
    implements _$BuddyEventMemberCopyWith<$Res> {
  __$BuddyEventMemberCopyWithImpl(this._self, this._then);

  final _BuddyEventMember _self;
  final $Res Function(_BuddyEventMember) _then;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? profilePicture = null,
  }) {
    return _then(_BuddyEventMember(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _self.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _self.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
