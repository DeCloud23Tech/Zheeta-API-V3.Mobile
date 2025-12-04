// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'wallet_counters_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$WalletCounters {
  String get userId;
  double get balance;
  int get regularCount;
  int get silverCount;
  int get goldCount;

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $WalletCountersCopyWith<WalletCounters> get copyWith =>
      _$WalletCountersCopyWithImpl<WalletCounters>(
          this as WalletCounters, _$identity);

  /// Serializes this WalletCounters to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is WalletCounters &&
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

  @override
  String toString() {
    return 'WalletCounters(userId: $userId, balance: $balance, regularCount: $regularCount, silverCount: $silverCount, goldCount: $goldCount)';
  }
}

/// @nodoc
abstract mixin class $WalletCountersCopyWith<$Res> {
  factory $WalletCountersCopyWith(
          WalletCounters value, $Res Function(WalletCounters) _then) =
      _$WalletCountersCopyWithImpl;
  @useResult
  $Res call(
      {String userId,
      double balance,
      int regularCount,
      int silverCount,
      int goldCount});
}

/// @nodoc
class _$WalletCountersCopyWithImpl<$Res>
    implements $WalletCountersCopyWith<$Res> {
  _$WalletCountersCopyWithImpl(this._self, this._then);

  final WalletCounters _self;
  final $Res Function(WalletCounters) _then;

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
    return _then(_self.copyWith(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      regularCount: null == regularCount
          ? _self.regularCount
          : regularCount // ignore: cast_nullable_to_non_nullable
              as int,
      silverCount: null == silverCount
          ? _self.silverCount
          : silverCount // ignore: cast_nullable_to_non_nullable
              as int,
      goldCount: null == goldCount
          ? _self.goldCount
          : goldCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _WalletCounters implements WalletCounters {
  const _WalletCounters(
      {required this.userId,
      required this.balance,
      required this.regularCount,
      required this.silverCount,
      required this.goldCount});
  factory _WalletCounters.fromJson(Map<String, dynamic> json) =>
      _$WalletCountersFromJson(json);

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

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$WalletCountersCopyWith<_WalletCounters> get copyWith =>
      __$WalletCountersCopyWithImpl<_WalletCounters>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$WalletCountersToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _WalletCounters &&
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

  @override
  String toString() {
    return 'WalletCounters(userId: $userId, balance: $balance, regularCount: $regularCount, silverCount: $silverCount, goldCount: $goldCount)';
  }
}

/// @nodoc
abstract mixin class _$WalletCountersCopyWith<$Res>
    implements $WalletCountersCopyWith<$Res> {
  factory _$WalletCountersCopyWith(
          _WalletCounters value, $Res Function(_WalletCounters) _then) =
      __$WalletCountersCopyWithImpl;
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
class __$WalletCountersCopyWithImpl<$Res>
    implements _$WalletCountersCopyWith<$Res> {
  __$WalletCountersCopyWithImpl(this._self, this._then);

  final _WalletCounters _self;
  final $Res Function(_WalletCounters) _then;

  /// Create a copy of WalletCounters
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? userId = null,
    Object? balance = null,
    Object? regularCount = null,
    Object? silverCount = null,
    Object? goldCount = null,
  }) {
    return _then(_WalletCounters(
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      balance: null == balance
          ? _self.balance
          : balance // ignore: cast_nullable_to_non_nullable
              as double,
      regularCount: null == regularCount
          ? _self.regularCount
          : regularCount // ignore: cast_nullable_to_non_nullable
              as int,
      silverCount: null == silverCount
          ? _self.silverCount
          : silverCount // ignore: cast_nullable_to_non_nullable
              as int,
      goldCount: null == goldCount
          ? _self.goldCount
          : goldCount // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

// dart format on
