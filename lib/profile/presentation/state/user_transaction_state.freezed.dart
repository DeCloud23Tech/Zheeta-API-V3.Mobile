// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_transaction_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UserTransactionState {
  State<UserTransactionListModel> get getUserTransactionsState =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserTransactionStateCopyWith<UserTransactionState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserTransactionStateCopyWith<$Res> {
  factory $UserTransactionStateCopyWith(UserTransactionState value,
          $Res Function(UserTransactionState) then) =
      _$UserTransactionStateCopyWithImpl<$Res, UserTransactionState>;
  @useResult
  $Res call({State<UserTransactionListModel> getUserTransactionsState});

  $StateCopyWith<UserTransactionListModel, $Res> get getUserTransactionsState;
}

/// @nodoc
class _$UserTransactionStateCopyWithImpl<$Res,
        $Val extends UserTransactionState>
    implements $UserTransactionStateCopyWith<$Res> {
  _$UserTransactionStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUserTransactionsState = null,
  }) {
    return _then(_value.copyWith(
      getUserTransactionsState: null == getUserTransactionsState
          ? _value.getUserTransactionsState
          : getUserTransactionsState // ignore: cast_nullable_to_non_nullable
              as State<UserTransactionListModel>,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $StateCopyWith<UserTransactionListModel, $Res> get getUserTransactionsState {
    return $StateCopyWith<UserTransactionListModel, $Res>(
        _value.getUserTransactionsState, (value) {
      return _then(_value.copyWith(getUserTransactionsState: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserTransactionStateImplCopyWith<$Res>
    implements $UserTransactionStateCopyWith<$Res> {
  factory _$$UserTransactionStateImplCopyWith(_$UserTransactionStateImpl value,
          $Res Function(_$UserTransactionStateImpl) then) =
      __$$UserTransactionStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({State<UserTransactionListModel> getUserTransactionsState});

  @override
  $StateCopyWith<UserTransactionListModel, $Res> get getUserTransactionsState;
}

/// @nodoc
class __$$UserTransactionStateImplCopyWithImpl<$Res>
    extends _$UserTransactionStateCopyWithImpl<$Res, _$UserTransactionStateImpl>
    implements _$$UserTransactionStateImplCopyWith<$Res> {
  __$$UserTransactionStateImplCopyWithImpl(_$UserTransactionStateImpl _value,
      $Res Function(_$UserTransactionStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getUserTransactionsState = null,
  }) {
    return _then(_$UserTransactionStateImpl(
      getUserTransactionsState: null == getUserTransactionsState
          ? _value.getUserTransactionsState
          : getUserTransactionsState // ignore: cast_nullable_to_non_nullable
              as State<UserTransactionListModel>,
    ));
  }
}

/// @nodoc

class _$UserTransactionStateImpl extends _UserTransactionState {
  _$UserTransactionStateImpl({required this.getUserTransactionsState})
      : super._();

  @override
  final State<UserTransactionListModel> getUserTransactionsState;

  @override
  String toString() {
    return 'UserTransactionState(getUserTransactionsState: $getUserTransactionsState)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserTransactionStateImpl &&
            (identical(
                    other.getUserTransactionsState, getUserTransactionsState) ||
                other.getUserTransactionsState == getUserTransactionsState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, getUserTransactionsState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserTransactionStateImplCopyWith<_$UserTransactionStateImpl>
      get copyWith =>
          __$$UserTransactionStateImplCopyWithImpl<_$UserTransactionStateImpl>(
              this, _$identity);
}

abstract class _UserTransactionState extends UserTransactionState {
  factory _UserTransactionState(
      {required final State<UserTransactionListModel>
          getUserTransactionsState}) = _$UserTransactionStateImpl;
  _UserTransactionState._() : super._();

  @override
  State<UserTransactionListModel> get getUserTransactionsState;
  @override
  @JsonKey(ignore: true)
  _$$UserTransactionStateImplCopyWith<_$UserTransactionStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
