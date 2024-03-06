// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_profile_access_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserProfileAccessState {
  State<dynamic> get blockAccountState => throw _privateConstructorUsedError;
  State<dynamic> get unblockAccountState => throw _privateConstructorUsedError;
  State<dynamic> get getBlockedUsersState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserProfileAccessStateCopyWith<UserProfileAccessState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserProfileAccessStateCopyWith<$Res> {
  factory $UserProfileAccessStateCopyWith(UserProfileAccessState value,
          $Res Function(UserProfileAccessState) then) =
      _$UserProfileAccessStateCopyWithImpl<$Res, UserProfileAccessState>;
  @useResult
  $Res call(
      {State<dynamic> blockAccountState,
      State<dynamic> unblockAccountState,
      State<dynamic> getBlockedUsersState});

  $StateCopyWith<dynamic, $Res> get blockAccountState;
  $StateCopyWith<dynamic, $Res> get unblockAccountState;
  $StateCopyWith<dynamic, $Res> get getBlockedUsersState;
}

/// @nodoc
class _$UserProfileAccessStateCopyWithImpl<$Res,
        $Val extends UserProfileAccessState>
    implements $UserProfileAccessStateCopyWith<$Res> {
  _$UserProfileAccessStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockAccountState = null,
    Object? unblockAccountState = null,
    Object? getBlockedUsersState = null,
  }) {
    return _then(_value.copyWith(
      blockAccountState: null == blockAccountState
          ? _value.blockAccountState
          : blockAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      unblockAccountState: null == unblockAccountState
          ? _value.unblockAccountState
          : unblockAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      getBlockedUsersState: null == getBlockedUsersState
          ? _value.getBlockedUsersState
          : getBlockedUsersState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get blockAccountState {
    return $StateCopyWith<dynamic, $Res>(_value.blockAccountState, (value) {
      return _then(_value.copyWith(blockAccountState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get unblockAccountState {
    return $StateCopyWith<dynamic, $Res>(_value.unblockAccountState, (value) {
      return _then(_value.copyWith(unblockAccountState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get getBlockedUsersState {
    return $StateCopyWith<dynamic, $Res>(_value.getBlockedUsersState, (value) {
      return _then(_value.copyWith(getBlockedUsersState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserProfileAccessStateImplCopyWith<$Res>
    implements $UserProfileAccessStateCopyWith<$Res> {
  factory _$$UserProfileAccessStateImplCopyWith(
          _$UserProfileAccessStateImpl value,
          $Res Function(_$UserProfileAccessStateImpl) then) =
      __$$UserProfileAccessStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {State<dynamic> blockAccountState,
      State<dynamic> unblockAccountState,
      State<dynamic> getBlockedUsersState});

  @override
  $StateCopyWith<dynamic, $Res> get blockAccountState;
  @override
  $StateCopyWith<dynamic, $Res> get unblockAccountState;
  @override
  $StateCopyWith<dynamic, $Res> get getBlockedUsersState;
}

/// @nodoc
class __$$UserProfileAccessStateImplCopyWithImpl<$Res>
    extends _$UserProfileAccessStateCopyWithImpl<$Res,
        _$UserProfileAccessStateImpl>
    implements _$$UserProfileAccessStateImplCopyWith<$Res> {
  __$$UserProfileAccessStateImplCopyWithImpl(
      _$UserProfileAccessStateImpl _value,
      $Res Function(_$UserProfileAccessStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? blockAccountState = null,
    Object? unblockAccountState = null,
    Object? getBlockedUsersState = null,
  }) {
    return _then(_$UserProfileAccessStateImpl(
      blockAccountState: null == blockAccountState
          ? _value.blockAccountState
          : blockAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      unblockAccountState: null == unblockAccountState
          ? _value.unblockAccountState
          : unblockAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      getBlockedUsersState: null == getBlockedUsersState
          ? _value.getBlockedUsersState
          : getBlockedUsersState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
    ));
  }
}

/// @nodoc

class _$UserProfileAccessStateImpl extends _UserProfileAccessState {
  _$UserProfileAccessStateImpl(
      {required this.blockAccountState,
      required this.unblockAccountState,
      required this.getBlockedUsersState})
      : super._();

  @override
  final State<dynamic> blockAccountState;
  @override
  final State<dynamic> unblockAccountState;
  @override
  final State<dynamic> getBlockedUsersState;

  @override
  String toString() {
    return 'UserProfileAccessState(blockAccountState: $blockAccountState, unblockAccountState: $unblockAccountState, getBlockedUsersState: $getBlockedUsersState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserProfileAccessStateImpl &&
            (identical(other.blockAccountState, blockAccountState) ||
                other.blockAccountState == blockAccountState) &&
            (identical(other.unblockAccountState, unblockAccountState) ||
                other.unblockAccountState == unblockAccountState) &&
            (identical(other.getBlockedUsersState, getBlockedUsersState) ||
                other.getBlockedUsersState == getBlockedUsersState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, blockAccountState,
      unblockAccountState, getBlockedUsersState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserProfileAccessStateImplCopyWith<_$UserProfileAccessStateImpl>
      get copyWith => __$$UserProfileAccessStateImplCopyWithImpl<
          _$UserProfileAccessStateImpl>(this, _$identity);
}

abstract class _UserProfileAccessState extends UserProfileAccessState {
  factory _UserProfileAccessState(
          {required final State<dynamic> blockAccountState,
          required final State<dynamic> unblockAccountState,
          required final State<dynamic> getBlockedUsersState}) =
      _$UserProfileAccessStateImpl;
  _UserProfileAccessState._() : super._();

  @override
  State<dynamic> get blockAccountState;
  @override
  State<dynamic> get unblockAccountState;
  @override
  State<dynamic> get getBlockedUsersState;
  @override
  @JsonKey(ignore: true)
  _$$UserProfileAccessStateImplCopyWith<_$UserProfileAccessStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
