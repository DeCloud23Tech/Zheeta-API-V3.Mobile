// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'friend_request_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$FriendRequestState {
  State<dynamic> get sendFriendRequestState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $FriendRequestStateCopyWith<FriendRequestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FriendRequestStateCopyWith<$Res> {
  factory $FriendRequestStateCopyWith(
          FriendRequestState value, $Res Function(FriendRequestState) then) =
      _$FriendRequestStateCopyWithImpl<$Res, FriendRequestState>;
  @useResult
  $Res call({State<dynamic> sendFriendRequestState});

  $StateCopyWith<dynamic, $Res> get sendFriendRequestState;
}

/// @nodoc
class _$FriendRequestStateCopyWithImpl<$Res, $Val extends FriendRequestState>
    implements $FriendRequestStateCopyWith<$Res> {
  _$FriendRequestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendFriendRequestState = null,
  }) {
    return _then(_value.copyWith(
      sendFriendRequestState: null == sendFriendRequestState
          ? _value.sendFriendRequestState
          : sendFriendRequestState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get sendFriendRequestState {
    return $StateCopyWith<dynamic, $Res>(_value.sendFriendRequestState,
        (value) {
      return _then(_value.copyWith(sendFriendRequestState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$FriendRequestStateImplCopyWith<$Res>
    implements $FriendRequestStateCopyWith<$Res> {
  factory _$$FriendRequestStateImplCopyWith(_$FriendRequestStateImpl value,
          $Res Function(_$FriendRequestStateImpl) then) =
      __$$FriendRequestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({State<dynamic> sendFriendRequestState});

  @override
  $StateCopyWith<dynamic, $Res> get sendFriendRequestState;
}

/// @nodoc
class __$$FriendRequestStateImplCopyWithImpl<$Res>
    extends _$FriendRequestStateCopyWithImpl<$Res, _$FriendRequestStateImpl>
    implements _$$FriendRequestStateImplCopyWith<$Res> {
  __$$FriendRequestStateImplCopyWithImpl(_$FriendRequestStateImpl _value,
      $Res Function(_$FriendRequestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sendFriendRequestState = null,
  }) {
    return _then(_$FriendRequestStateImpl(
      sendFriendRequestState: null == sendFriendRequestState
          ? _value.sendFriendRequestState
          : sendFriendRequestState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
    ));
  }
}

/// @nodoc

class _$FriendRequestStateImpl extends _FriendRequestState {
  _$FriendRequestStateImpl({required this.sendFriendRequestState}) : super._();

  @override
  final State<dynamic> sendFriendRequestState;

  @override
  String toString() {
    return 'FriendRequestState(sendFriendRequestState: $sendFriendRequestState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FriendRequestStateImpl &&
            (identical(other.sendFriendRequestState, sendFriendRequestState) ||
                other.sendFriendRequestState == sendFriendRequestState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, sendFriendRequestState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FriendRequestStateImplCopyWith<_$FriendRequestStateImpl> get copyWith =>
      __$$FriendRequestStateImplCopyWithImpl<_$FriendRequestStateImpl>(
          this, _$identity);
}

abstract class _FriendRequestState extends FriendRequestState {
  factory _FriendRequestState(
          {required final State<dynamic> sendFriendRequestState}) =
      _$FriendRequestStateImpl;
  _FriendRequestState._() : super._();

  @override
  State<dynamic> get sendFriendRequestState;
  @override
  @JsonKey(ignore: true)
  _$$FriendRequestStateImplCopyWith<_$FriendRequestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
