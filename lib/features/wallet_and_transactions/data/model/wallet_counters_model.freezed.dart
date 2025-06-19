// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_counters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

WalletCounters _$WalletCountersFromJson(Map<String, dynamic> json) {
  return _WalletCounters.fromJson(json);
}

/// @nodoc
mixin _$WalletCounters {
  String get userId => throw _privateConstructorUsedError;
  double get balance => throw _privateConstructorUsedError;
  int get regularCount => throw _privateConstructorUsedError;
  int get silverCount => throw _privateConstructorUsedError;
  int get goldCount => throw _privateConstructorUsedError;

  /// Serializes this WalletCounters to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $WalletCountersCopyWith<WalletCounters> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $WalletCountersCopyWith<$Res> {
  factory $WalletCountersCopyWith(
          WalletCounters value, $Res Function(WalletCounters) then) =
      _$WalletCountersCopyWithImpl<$Res, WalletCounters>;
  @useResult
  $Res call(
      {String userId,
      double balance,
      int regularCount,
      int silverCount,
      int goldCount});
}

/// @nodoc
class _$WalletCountersCopyWithImpl<$Res, $Val extends WalletCounters>
    implements $WalletCountersCopyWith<$Res> {
  _$WalletCountersCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? regularCount = null,
    Object? silverCount = null,
    Object? goldCount = null,
  }) {
    return _then(_value.copyWith(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      regularCount: null == regularCount
          ? _value.regularCount
          : regularCount // ignore: cast_nullable_to_non_nullable
              as int,
      silverCount: null == silverCount
          ? _value.silverCount
          : silverCount // ignore: cast_nullable_to_non_nullable
              as int,
      goldCount: null == goldCount
          ? _value.goldCount
          : goldCount // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$WalletCountersImplCopyWith<$Res>
    implements $WalletCountersCopyWith<$Res> {
  factory _$$WalletCountersImplCopyWith(_$WalletCountersImpl value,
          $Res Function(_$WalletCountersImpl) then) =
      __$$WalletCountersImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userId,
      double balance,
      int regularCount,
      int silverCount,
      int goldCount});
}

/// @nodoc
class __$$WalletCountersImplCopyWithImpl<$Res>
    extends _$WalletCountersCopyWithImpl<$Res, _$WalletCountersImpl>
    implements _$$WalletCountersImplCopyWith<$Res> {
  __$$WalletCountersImplCopyWithImpl(
      _$WalletCountersImpl _value, $Res Function(_$WalletCountersImpl) _then)
      : super(_value, _then);

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? regularCount = null,
    Object? silverCount = null,
    Object? goldCount = null,
  }) {
    return _then(_$WalletCountersImpl(
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _value.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      regularCount: null == regularCount
          ? _value.regularCount
          : regularCount // ignore: cast_nullable_to_non_nullable
              as int,
      silverCount: null == silverCount
          ? _value.silverCount
          : silverCount // ignore: cast_nullable_to_non_nullable
              as int,
      goldCount: null == goldCount
          ? _value.goldCount
          : goldCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$WalletCountersImpl implements _WalletCounters {
  const _$WalletCountersImpl(
      {required this.userId,
      required this.balance,
      required this.regularCount,
      required this.silverCount,
      required this.goldCount});

  factory _$WalletCountersImpl.fromJson(Map<String, dynamic> json) =>
      _$$WalletCountersImplFromJson(json);

  @override
  final String userId;
  @override
  final double balance;
  @override
  final int regularCount;
  @override
  final int silverCount;
  @override
  final int goldCount;

  @override
  String toString() {
    return 'WalletCounters(userId: $userId, balance: $balance, regularCount: $regularCount, silverCount: $silverCount, goldCount: $goldCount)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$WalletCountersImpl &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.balance, balance) || other.balance == balance) &&
            (identical(other.regularCount, regularCount) ||
                other.regularCount == regularCount) &&
            (identical(other.silverCount, silverCount) ||
                other.silverCount == silverCount) &&
            (identical(other.goldCount, goldCount) ||
                other.goldCount == goldCount));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, userId, balance, regularCount, silverCount, goldCount);

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$WalletCountersImplCopyWith<_$WalletCountersImpl> get copyWith =>
      __$$WalletCountersImplCopyWithImpl<_$WalletCountersImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$WalletCountersImplToJson(
      this,
    );
  }
}

abstract class _WalletCounters implements WalletCounters {
  const factory _WalletCounters(
      {required final String userId,
      required final double balance,
      required final int regularCount,
      required final int silverCount,
      required final int goldCount}) = _$WalletCountersImpl;

  factory _WalletCounters.fromJson(Map<String, dynamic> json) =
      _$WalletCountersImpl.fromJson;

  @override
  String get userId;
  @override
  double get balance;
  @override
  int get regularCount;
  @override
  int get silverCount;
  @override
  int get goldCount;

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$WalletCountersImplCopyWith<_$WalletCountersImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
