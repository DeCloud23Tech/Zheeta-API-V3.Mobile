// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PaymentAccount _$PaymentAccountFromJson(Map<String, dynamic> json) {
  return _PaymentAccount.fromJson(json);
}

/// @nodoc
mixin _$PaymentAccount {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get countryIso2Code => throw _privateConstructorUsedError;
  int get payOutType => throw _privateConstructorUsedError;
  String get currency => throw _privateConstructorUsedError;
  String? get bankId => throw _privateConstructorUsedError;
  String get bankName => throw _privateConstructorUsedError;
  String? get bankCode => throw _privateConstructorUsedError;
  String? get branchCode => throw _privateConstructorUsedError;
  String? get accountNumber => throw _privateConstructorUsedError;
  String? get routingNumber => throw _privateConstructorUsedError;
  String? get swiftCode => throw _privateConstructorUsedError;
  String? get mobileMoneyAccount => throw _privateConstructorUsedError;
  String? get paypalAddress => throw _privateConstructorUsedError;
  String? get cryptoCoinName => throw _privateConstructorUsedError;
  String? get cryptoCoinAddress => throw _privateConstructorUsedError;

  /// Serializes this PaymentAccount to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PaymentAccountCopyWith<PaymentAccount> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentAccountCopyWith<$Res> {
  factory $PaymentAccountCopyWith(
          PaymentAccount value, $Res Function(PaymentAccount) then) =
      _$PaymentAccountCopyWithImpl<$Res, PaymentAccount>;
  @useResult
  $Res call(
      {String id,
      String userId,
      String firstName,
      String lastName,
      String countryIso2Code,
      int payOutType,
      String currency,
      String? bankId,
      String bankName,
      String? bankCode,
      String? branchCode,
      String? accountNumber,
      String? routingNumber,
      String? swiftCode,
      String? mobileMoneyAccount,
      String? paypalAddress,
      String? cryptoCoinName,
      String? cryptoCoinAddress});
}

/// @nodoc
class _$PaymentAccountCopyWithImpl<$Res, $Val extends PaymentAccount>
    implements $PaymentAccountCopyWith<$Res> {
  _$PaymentAccountCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? countryIso2Code = null,
    Object? payOutType = null,
    Object? currency = null,
    Object? bankId = freezed,
    Object? bankName = null,
    Object? bankCode = freezed,
    Object? branchCode = freezed,
    Object? accountNumber = freezed,
    Object? routingNumber = freezed,
    Object? swiftCode = freezed,
    Object? mobileMoneyAccount = freezed,
    Object? paypalAddress = freezed,
    Object? cryptoCoinName = freezed,
    Object? cryptoCoinAddress = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      countryIso2Code: null == countryIso2Code
          ? _value.countryIso2Code
          : countryIso2Code // ignore: cast_nullable_to_non_nullable
              as String,
      payOutType: null == payOutType
          ? _value.payOutType
          : payOutType // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      routingNumber: freezed == routingNumber
          ? _value.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      swiftCode: freezed == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileMoneyAccount: freezed == mobileMoneyAccount
          ? _value.mobileMoneyAccount
          : mobileMoneyAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      paypalAddress: freezed == paypalAddress
          ? _value.paypalAddress
          : paypalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinName: freezed == cryptoCoinName
          ? _value.cryptoCoinName
          : cryptoCoinName // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinAddress: freezed == cryptoCoinAddress
          ? _value.cryptoCoinAddress
          : cryptoCoinAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentAccountImplCopyWith<$Res>
    implements $PaymentAccountCopyWith<$Res> {
  factory _$$PaymentAccountImplCopyWith(_$PaymentAccountImpl value,
          $Res Function(_$PaymentAccountImpl) then) =
      __$$PaymentAccountImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String firstName,
      String lastName,
      String countryIso2Code,
      int payOutType,
      String currency,
      String? bankId,
      String bankName,
      String? bankCode,
      String? branchCode,
      String? accountNumber,
      String? routingNumber,
      String? swiftCode,
      String? mobileMoneyAccount,
      String? paypalAddress,
      String? cryptoCoinName,
      String? cryptoCoinAddress});
}

/// @nodoc
class __$$PaymentAccountImplCopyWithImpl<$Res>
    extends _$PaymentAccountCopyWithImpl<$Res, _$PaymentAccountImpl>
    implements _$$PaymentAccountImplCopyWith<$Res> {
  __$$PaymentAccountImplCopyWithImpl(
      _$PaymentAccountImpl _value, $Res Function(_$PaymentAccountImpl) _then)
      : super(_value, _then);

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? countryIso2Code = null,
    Object? payOutType = null,
    Object? currency = null,
    Object? bankId = freezed,
    Object? bankName = null,
    Object? bankCode = freezed,
    Object? branchCode = freezed,
    Object? accountNumber = freezed,
    Object? routingNumber = freezed,
    Object? swiftCode = freezed,
    Object? mobileMoneyAccount = freezed,
    Object? paypalAddress = freezed,
    Object? cryptoCoinName = freezed,
    Object? cryptoCoinAddress = freezed,
  }) {
    return _then(_$PaymentAccountImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      countryIso2Code: null == countryIso2Code
          ? _value.countryIso2Code
          : countryIso2Code // ignore: cast_nullable_to_non_nullable
              as String,
      payOutType: null == payOutType
          ? _value.payOutType
          : payOutType // ignore: cast_nullable_to_non_nullable
              as int,
      currency: null == currency
          ? _value.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: freezed == bankId
          ? _value.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: null == bankName
          ? _value.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String,
      bankCode: freezed == bankCode
          ? _value.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _value.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _value.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      routingNumber: freezed == routingNumber
          ? _value.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      swiftCode: freezed == swiftCode
          ? _value.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileMoneyAccount: freezed == mobileMoneyAccount
          ? _value.mobileMoneyAccount
          : mobileMoneyAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      paypalAddress: freezed == paypalAddress
          ? _value.paypalAddress
          : paypalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinName: freezed == cryptoCoinName
          ? _value.cryptoCoinName
          : cryptoCoinName // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinAddress: freezed == cryptoCoinAddress
          ? _value.cryptoCoinAddress
          : cryptoCoinAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PaymentAccountImpl implements _PaymentAccount {
  _$PaymentAccountImpl(
      {required this.id,
      required this.userId,
      required this.firstName,
      required this.lastName,
      required this.countryIso2Code,
      required this.payOutType,
      required this.currency,
      this.bankId,
      required this.bankName,
      this.bankCode,
      this.branchCode,
      this.accountNumber,
      this.routingNumber,
      this.swiftCode,
      this.mobileMoneyAccount,
      this.paypalAddress,
      this.cryptoCoinName,
      this.cryptoCoinAddress});

  factory _$PaymentAccountImpl.fromJson(Map<String, dynamic> json) =>
      _$$PaymentAccountImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String countryIso2Code;
  @override
  final int payOutType;
  @override
  final String currency;
  @override
  final String? bankId;
  @override
  final String bankName;
  @override
  final String? bankCode;
  @override
  final String? branchCode;
  @override
  final String? accountNumber;
  @override
  final String? routingNumber;
  @override
  final String? swiftCode;
  @override
  final String? mobileMoneyAccount;
  @override
  final String? paypalAddress;
  @override
  final String? cryptoCoinName;
  @override
  final String? cryptoCoinAddress;

  @override
  String toString() {
    return 'PaymentAccount(id: $id, userId: $userId, firstName: $firstName, lastName: $lastName, countryIso2Code: $countryIso2Code, payOutType: $payOutType, currency: $currency, bankId: $bankId, bankName: $bankName, bankCode: $bankCode, branchCode: $branchCode, accountNumber: $accountNumber, routingNumber: $routingNumber, swiftCode: $swiftCode, mobileMoneyAccount: $mobileMoneyAccount, paypalAddress: $paypalAddress, cryptoCoinName: $cryptoCoinName, cryptoCoinAddress: $cryptoCoinAddress)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentAccountImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.countryIso2Code, countryIso2Code) ||
                other.countryIso2Code == countryIso2Code) &&
            (identical(other.payOutType, payOutType) ||
                other.payOutType == payOutType) &&
            (identical(other.currency, currency) ||
                other.currency == currency) &&
            (identical(other.bankId, bankId) || other.bankId == bankId) &&
            (identical(other.bankName, bankName) ||
                other.bankName == bankName) &&
            (identical(other.bankCode, bankCode) ||
                other.bankCode == bankCode) &&
            (identical(other.branchCode, branchCode) ||
                other.branchCode == branchCode) &&
            (identical(other.accountNumber, accountNumber) ||
                other.accountNumber == accountNumber) &&
            (identical(other.routingNumber, routingNumber) ||
                other.routingNumber == routingNumber) &&
            (identical(other.swiftCode, swiftCode) ||
                other.swiftCode == swiftCode) &&
            (identical(other.mobileMoneyAccount, mobileMoneyAccount) ||
                other.mobileMoneyAccount == mobileMoneyAccount) &&
            (identical(other.paypalAddress, paypalAddress) ||
                other.paypalAddress == paypalAddress) &&
            (identical(other.cryptoCoinName, cryptoCoinName) ||
                other.cryptoCoinName == cryptoCoinName) &&
            (identical(other.cryptoCoinAddress, cryptoCoinAddress) ||
                other.cryptoCoinAddress == cryptoCoinAddress));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      userId,
      firstName,
      lastName,
      countryIso2Code,
      payOutType,
      currency,
      bankId,
      bankName,
      bankCode,
      branchCode,
      accountNumber,
      routingNumber,
      swiftCode,
      mobileMoneyAccount,
      paypalAddress,
      cryptoCoinName,
      cryptoCoinAddress);

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentAccountImplCopyWith<_$PaymentAccountImpl> get copyWith =>
      __$$PaymentAccountImplCopyWithImpl<_$PaymentAccountImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PaymentAccountImplToJson(
      this,
    );
  }
}

abstract class _PaymentAccount implements PaymentAccount {
  factory _PaymentAccount(
      {required final String id,
      required final String userId,
      required final String firstName,
      required final String lastName,
      required final String countryIso2Code,
      required final int payOutType,
      required final String currency,
      final String? bankId,
      required final String bankName,
      final String? bankCode,
      final String? branchCode,
      final String? accountNumber,
      final String? routingNumber,
      final String? swiftCode,
      final String? mobileMoneyAccount,
      final String? paypalAddress,
      final String? cryptoCoinName,
      final String? cryptoCoinAddress}) = _$PaymentAccountImpl;

  factory _PaymentAccount.fromJson(Map<String, dynamic> json) =
      _$PaymentAccountImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get countryIso2Code;
  @override
  int get payOutType;
  @override
  String get currency;
  @override
  String? get bankId;
  @override
  String get bankName;
  @override
  String? get bankCode;
  @override
  String? get branchCode;
  @override
  String? get accountNumber;
  @override
  String? get routingNumber;
  @override
  String? get swiftCode;
  @override
  String? get mobileMoneyAccount;
  @override
  String? get paypalAddress;
  @override
  String? get cryptoCoinName;
  @override
  String? get cryptoCoinAddress;

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PaymentAccountImplCopyWith<_$PaymentAccountImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
