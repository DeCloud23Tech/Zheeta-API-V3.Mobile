// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'buddy_event_members.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BuddyEventMember _$BuddyEventMemberFromJson(Map<String, dynamic> json) {
  return _BuddyEventMember.fromJson(json);
}

/// @nodoc
mixin _$BuddyEventMember {
  String get userId => throw _privateConstructorUsedError;
  String get username => throw _privateConstructorUsedError;
  String get profilePicture => throw _privateConstructorUsedError;

  /// Serializes this BuddyEventMember to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $BuddyEventMemberCopyWith<BuddyEventMember> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BuddyEventMemberCopyWith<$Res> {
  factory $BuddyEventMemberCopyWith(
          BuddyEventMember value, $Res Function(BuddyEventMember) then) =
      _$BuddyEventMemberCopyWithImpl<$Res, BuddyEventMember>;
  @useResult
  $Res call({String userId, String username, String profilePicture});
}

/// @nodoc
class _$BuddyEventMemberCopyWithImpl<$Res, $Val extends BuddyEventMember>
    implements $BuddyEventMemberCopyWith<$Res> {
  _$BuddyEventMemberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? profilePicture = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BuddyEventMemberImplCopyWith<$Res>
    implements $BuddyEventMemberCopyWith<$Res> {
  factory _$$BuddyEventMemberImplCopyWith(_$BuddyEventMemberImpl value,
          $Res Function(_$BuddyEventMemberImpl) then) =
      __$$BuddyEventMemberImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String userId, String username, String profilePicture});
}

/// @nodoc
class __$$BuddyEventMemberImplCopyWithImpl<$Res>
    extends _$BuddyEventMemberCopyWithImpl<$Res, _$BuddyEventMemberImpl>
    implements _$$BuddyEventMemberImplCopyWith<$Res> {
  __$$BuddyEventMemberImplCopyWithImpl(_$BuddyEventMemberImpl _value,
      $Res Function(_$BuddyEventMemberImpl) _then)
      : super(_value, _then);

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? username = null,
    Object? profilePicture = null,
  }) {
    return _then(_$BuddyEventMemberImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      profilePicture: null == profilePicture
          ? _value.profilePicture
          : profilePicture // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BuddyEventMemberImpl implements _BuddyEventMember {
  _$BuddyEventMemberImpl(
      {required this.userId,
      required this.username,
      required this.profilePicture});

  factory _$BuddyEventMemberImpl.fromJson(Map<String, dynamic> json) =>
      _$$BuddyEventMemberImplFromJson(json);

  @override
  final String userId;
  @override
  final String username;
  @override
  final String profilePicture;

  @override
  String toString() {
    return 'BuddyEventMember(userId: $userId, username: $username, profilePicture: $profilePicture)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BuddyEventMemberImpl &&
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

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$BuddyEventMemberImplCopyWith<_$BuddyEventMemberImpl> get copyWith =>
      __$$BuddyEventMemberImplCopyWithImpl<_$BuddyEventMemberImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BuddyEventMemberImplToJson(
      this,
    );
  }
}

abstract class _BuddyEventMember implements BuddyEventMember {
  factory _BuddyEventMember(
      {required final String userId,
      required final String username,
      required final String profilePicture}) = _$BuddyEventMemberImpl;

  factory _BuddyEventMember.fromJson(Map<String, dynamic> json) =
      _$BuddyEventMemberImpl.fromJson;

  @override
  String get userId;
  @override
  String get username;
  @override
  String get profilePicture;

  /// Create a copy of BuddyEventMember
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$BuddyEventMemberImplCopyWith<_$BuddyEventMemberImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
