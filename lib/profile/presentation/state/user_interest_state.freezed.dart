// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_interest_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserInterestState {
  State<dynamic> get updateUserInterestState =>
      throw _privateConstructorUsedError;
  State<UserInterestListModel> get getInterestState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserInterestStateCopyWith<UserInterestState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserInterestStateCopyWith<$Res> {
  factory $UserInterestStateCopyWith(
          UserInterestState value, $Res Function(UserInterestState) then) =
      _$UserInterestStateCopyWithImpl<$Res, UserInterestState>;
  @useResult
  $Res call(
      {State<dynamic> updateUserInterestState,
      State<UserInterestListModel> getInterestState});

  $StateCopyWith<dynamic, $Res> get updateUserInterestState;
  $StateCopyWith<UserInterestListModel, $Res> get getInterestState;
}

/// @nodoc
class _$UserInterestStateCopyWithImpl<$Res, $Val extends UserInterestState>
    implements $UserInterestStateCopyWith<$Res> {
  _$UserInterestStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserInterestState = null,
    Object? getInterestState = null,
  }) {
    return _then(_value.copyWith(
      updateUserInterestState: null == updateUserInterestState
          ? _value.updateUserInterestState
          : updateUserInterestState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      getInterestState: null == getInterestState
          ? _value.getInterestState
          : getInterestState // ignore: cast_nullable_to_non_nullable
              as State<UserInterestListModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get updateUserInterestState {
    return $StateCopyWith<dynamic, $Res>(_value.updateUserInterestState,
        (value) {
      return _then(_value.copyWith(updateUserInterestState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<UserInterestListModel, $Res> get getInterestState {
    return $StateCopyWith<UserInterestListModel, $Res>(_value.getInterestState,
        (value) {
      return _then(_value.copyWith(getInterestState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserInterestStateImplCopyWith<$Res>
    implements $UserInterestStateCopyWith<$Res> {
  factory _$$UserInterestStateImplCopyWith(_$UserInterestStateImpl value,
          $Res Function(_$UserInterestStateImpl) then) =
      __$$UserInterestStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {State<dynamic> updateUserInterestState,
      State<UserInterestListModel> getInterestState});

  @override
  $StateCopyWith<dynamic, $Res> get updateUserInterestState;
  @override
  $StateCopyWith<UserInterestListModel, $Res> get getInterestState;
}

/// @nodoc
class __$$UserInterestStateImplCopyWithImpl<$Res>
    extends _$UserInterestStateCopyWithImpl<$Res, _$UserInterestStateImpl>
    implements _$$UserInterestStateImplCopyWith<$Res> {
  __$$UserInterestStateImplCopyWithImpl(_$UserInterestStateImpl _value,
      $Res Function(_$UserInterestStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? updateUserInterestState = null,
    Object? getInterestState = null,
  }) {
    return _then(_$UserInterestStateImpl(
      updateUserInterestState: null == updateUserInterestState
          ? _value.updateUserInterestState
          : updateUserInterestState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      getInterestState: null == getInterestState
          ? _value.getInterestState
          : getInterestState // ignore: cast_nullable_to_non_nullable
              as State<UserInterestListModel>,
    ));
  }
}

/// @nodoc

class _$UserInterestStateImpl extends _UserInterestState {
  _$UserInterestStateImpl(
      {required this.updateUserInterestState, required this.getInterestState})
      : super._();

  @override
  final State<dynamic> updateUserInterestState;
  @override
  final State<UserInterestListModel> getInterestState;

  @override
  String toString() {
    return 'UserInterestState(updateUserInterestState: $updateUserInterestState, getInterestState: $getInterestState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserInterestStateImpl &&
            (identical(
                    other.updateUserInterestState, updateUserInterestState) ||
                other.updateUserInterestState == updateUserInterestState) &&
            (identical(other.getInterestState, getInterestState) ||
                other.getInterestState == getInterestState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, updateUserInterestState, getInterestState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserInterestStateImplCopyWith<_$UserInterestStateImpl> get copyWith =>
      __$$UserInterestStateImplCopyWithImpl<_$UserInterestStateImpl>(
          this, _$identity);
}

abstract class _UserInterestState extends UserInterestState {
  factory _UserInterestState(
          {required final State<dynamic> updateUserInterestState,
          required final State<UserInterestListModel> getInterestState}) =
      _$UserInterestStateImpl;
  _UserInterestState._() : super._();

  @override
  State<dynamic> get updateUserInterestState;
  @override
  State<UserInterestListModel> get getInterestState;
  @override
  @JsonKey(ignore: true)
  _$$UserInterestStateImplCopyWith<_$UserInterestStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
