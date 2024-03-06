// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'access_restriction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AccessRestrictionState {
  State<dynamic> get enableAccountState => throw _privateConstructorUsedError;
  State<dynamic> get disableAccountState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AccessRestrictionStateCopyWith<AccessRestrictionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AccessRestrictionStateCopyWith<$Res> {
  factory $AccessRestrictionStateCopyWith(AccessRestrictionState value,
          $Res Function(AccessRestrictionState) then) =
      _$AccessRestrictionStateCopyWithImpl<$Res, AccessRestrictionState>;
  @useResult
  $Res call(
      {State<dynamic> enableAccountState, State<dynamic> disableAccountState});

  $StateCopyWith<dynamic, $Res> get enableAccountState;
  $StateCopyWith<dynamic, $Res> get disableAccountState;
}

/// @nodoc
class _$AccessRestrictionStateCopyWithImpl<$Res,
        $Val extends AccessRestrictionState>
    implements $AccessRestrictionStateCopyWith<$Res> {
  _$AccessRestrictionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableAccountState = null,
    Object? disableAccountState = null,
  }) {
    return _then(_value.copyWith(
      enableAccountState: null == enableAccountState
          ? _value.enableAccountState
          : enableAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      disableAccountState: null == disableAccountState
          ? _value.disableAccountState
          : disableAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get enableAccountState {
    return $StateCopyWith<dynamic, $Res>(_value.enableAccountState, (value) {
      return _then(_value.copyWith(enableAccountState: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<dynamic, $Res> get disableAccountState {
    return $StateCopyWith<dynamic, $Res>(_value.disableAccountState, (value) {
      return _then(_value.copyWith(disableAccountState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AccessRestrictionStateImplCopyWith<$Res>
    implements $AccessRestrictionStateCopyWith<$Res> {
  factory _$$AccessRestrictionStateImplCopyWith(
          _$AccessRestrictionStateImpl value,
          $Res Function(_$AccessRestrictionStateImpl) then) =
      __$$AccessRestrictionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {State<dynamic> enableAccountState, State<dynamic> disableAccountState});

  @override
  $StateCopyWith<dynamic, $Res> get enableAccountState;
  @override
  $StateCopyWith<dynamic, $Res> get disableAccountState;
}

/// @nodoc
class __$$AccessRestrictionStateImplCopyWithImpl<$Res>
    extends _$AccessRestrictionStateCopyWithImpl<$Res,
        _$AccessRestrictionStateImpl>
    implements _$$AccessRestrictionStateImplCopyWith<$Res> {
  __$$AccessRestrictionStateImplCopyWithImpl(
      _$AccessRestrictionStateImpl _value,
      $Res Function(_$AccessRestrictionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? enableAccountState = null,
    Object? disableAccountState = null,
  }) {
    return _then(_$AccessRestrictionStateImpl(
      enableAccountState: null == enableAccountState
          ? _value.enableAccountState
          : enableAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
      disableAccountState: null == disableAccountState
          ? _value.disableAccountState
          : disableAccountState // ignore: cast_nullable_to_non_nullable
              as State<dynamic>,
    ));
  }
}

/// @nodoc

class _$AccessRestrictionStateImpl extends _AccessRestrictionState {
  _$AccessRestrictionStateImpl(
      {required this.enableAccountState, required this.disableAccountState})
      : super._();

  @override
  final State<dynamic> enableAccountState;
  @override
  final State<dynamic> disableAccountState;

  @override
  String toString() {
    return 'AccessRestrictionState(enableAccountState: $enableAccountState, disableAccountState: $disableAccountState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AccessRestrictionStateImpl &&
            (identical(other.enableAccountState, enableAccountState) ||
                other.enableAccountState == enableAccountState) &&
            (identical(other.disableAccountState, disableAccountState) ||
                other.disableAccountState == disableAccountState));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, enableAccountState, disableAccountState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AccessRestrictionStateImplCopyWith<_$AccessRestrictionStateImpl>
      get copyWith => __$$AccessRestrictionStateImplCopyWithImpl<
          _$AccessRestrictionStateImpl>(this, _$identity);
}

abstract class _AccessRestrictionState extends AccessRestrictionState {
  factory _AccessRestrictionState(
          {required final State<dynamic> enableAccountState,
          required final State<dynamic> disableAccountState}) =
      _$AccessRestrictionStateImpl;
  _AccessRestrictionState._() : super._();

  @override
  State<dynamic> get enableAccountState;
  @override
  State<dynamic> get disableAccountState;
  @override
  @JsonKey(ignore: true)
  _$$AccessRestrictionStateImplCopyWith<_$AccessRestrictionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
