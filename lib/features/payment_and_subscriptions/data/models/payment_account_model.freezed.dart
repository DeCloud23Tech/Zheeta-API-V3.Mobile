// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_account_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PaymentAccount {
  String get id;
  String get userId;
  String get firstName;
  String get lastName;
  String? get countryIso2Code;
  String get payOutType;
  String get currency;
  String? get bankId;
  String? get bankName;
  String? get bankCode;
  String? get branchCode;
  String? get accountNumber;
  String? get routingNumber;
  String? get swiftCode;
  String? get mobileMoneyAccount;
  String? get paypalAddress;
  String? get cryptoCoinName;
  String? get cryptoCoinAddress;

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PaymentAccountCopyWith<PaymentAccount> get copyWith =>
      _$PaymentAccountCopyWithImpl<PaymentAccount>(
          this as PaymentAccount, _$identity);

  /// Serializes this PaymentAccount to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PaymentAccount &&
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

  @override
  String toString() {
    return 'PaymentAccount(id: $id, userId: $userId, firstName: $firstName, lastName: $lastName, countryIso2Code: $countryIso2Code, payOutType: $payOutType, currency: $currency, bankId: $bankId, bankName: $bankName, bankCode: $bankCode, branchCode: $branchCode, accountNumber: $accountNumber, routingNumber: $routingNumber, swiftCode: $swiftCode, mobileMoneyAccount: $mobileMoneyAccount, paypalAddress: $paypalAddress, cryptoCoinName: $cryptoCoinName, cryptoCoinAddress: $cryptoCoinAddress)';
  }
}

/// @nodoc
abstract mixin class $PaymentAccountCopyWith<$Res> {
  factory $PaymentAccountCopyWith(
          PaymentAccount value, $Res Function(PaymentAccount) _then) =
      _$PaymentAccountCopyWithImpl;
  @useResult
  $Res call(
      {String id,
      String userId,
      String firstName,
      String lastName,
      String? countryIso2Code,
      String payOutType,
      String currency,
      String? bankId,
      String? bankName,
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
class _$PaymentAccountCopyWithImpl<$Res>
    implements $PaymentAccountCopyWith<$Res> {
  _$PaymentAccountCopyWithImpl(this._self, this._then);

  final PaymentAccount _self;
  final $Res Function(PaymentAccount) _then;

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? countryIso2Code = freezed,
    Object? payOutType = null,
    Object? currency = null,
    Object? bankId = freezed,
    Object? bankName = freezed,
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
    return _then(_self.copyWith(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      countryIso2Code: freezed == countryIso2Code
          ? _self.countryIso2Code
          : countryIso2Code // ignore: cast_nullable_to_non_nullable
              as String?,
      payOutType: null == payOutType
          ? _self.payOutType
          : payOutType // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: freezed == bankId
          ? _self.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _self.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      routingNumber: freezed == routingNumber
          ? _self.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      swiftCode: freezed == swiftCode
          ? _self.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileMoneyAccount: freezed == mobileMoneyAccount
          ? _self.mobileMoneyAccount
          : mobileMoneyAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      paypalAddress: freezed == paypalAddress
          ? _self.paypalAddress
          : paypalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinName: freezed == cryptoCoinName
          ? _self.cryptoCoinName
          : cryptoCoinName // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinAddress: freezed == cryptoCoinAddress
          ? _self.cryptoCoinAddress
          : cryptoCoinAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _PaymentAccount implements PaymentAccount {
  _PaymentAccount(
      {required this.id,
      required this.userId,
      required this.firstName,
      required this.lastName,
      this.countryIso2Code,
      required this.payOutType,
      required this.currency,
      this.bankId,
      this.bankName,
      this.bankCode,
      this.branchCode,
      this.accountNumber,
      this.routingNumber,
      this.swiftCode,
      this.mobileMoneyAccount,
      this.paypalAddress,
      this.cryptoCoinName,
      this.cryptoCoinAddress});
  factory _PaymentAccount.fromJson(Map<String, dynamic> json) =>
      _$PaymentAccountFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String? countryIso2Code;
  @override
  final String payOutType;
  @override
  final String currency;
  @override
  final String? bankId;
  @override
  final String? bankName;
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

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PaymentAccountCopyWith<_PaymentAccount> get copyWith =>
      __$PaymentAccountCopyWithImpl<_PaymentAccount>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$PaymentAccountToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PaymentAccount &&
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

  @override
  String toString() {
    return 'PaymentAccount(id: $id, userId: $userId, firstName: $firstName, lastName: $lastName, countryIso2Code: $countryIso2Code, payOutType: $payOutType, currency: $currency, bankId: $bankId, bankName: $bankName, bankCode: $bankCode, branchCode: $branchCode, accountNumber: $accountNumber, routingNumber: $routingNumber, swiftCode: $swiftCode, mobileMoneyAccount: $mobileMoneyAccount, paypalAddress: $paypalAddress, cryptoCoinName: $cryptoCoinName, cryptoCoinAddress: $cryptoCoinAddress)';
  }
}

/// @nodoc
abstract mixin class _$PaymentAccountCopyWith<$Res>
    implements $PaymentAccountCopyWith<$Res> {
  factory _$PaymentAccountCopyWith(
          _PaymentAccount value, $Res Function(_PaymentAccount) _then) =
      __$PaymentAccountCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      String firstName,
      String lastName,
      String? countryIso2Code,
      String payOutType,
      String currency,
      String? bankId,
      String? bankName,
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
class __$PaymentAccountCopyWithImpl<$Res>
    implements _$PaymentAccountCopyWith<$Res> {
  __$PaymentAccountCopyWithImpl(this._self, this._then);

  final _PaymentAccount _self;
  final $Res Function(_PaymentAccount) _then;

  /// Create a copy of PaymentAccount
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? firstName = null,
    Object? lastName = null,
    Object? countryIso2Code = freezed,
    Object? payOutType = null,
    Object? currency = null,
    Object? bankId = freezed,
    Object? bankName = freezed,
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
    return _then(_PaymentAccount(
      id: null == id
          ? _self.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _self.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      countryIso2Code: freezed == countryIso2Code
          ? _self.countryIso2Code
          : countryIso2Code // ignore: cast_nullable_to_non_nullable
              as String?,
      payOutType: null == payOutType
          ? _self.payOutType
          : payOutType // ignore: cast_nullable_to_non_nullable
              as String,
      currency: null == currency
          ? _self.currency
          : currency // ignore: cast_nullable_to_non_nullable
              as String,
      bankId: freezed == bankId
          ? _self.bankId
          : bankId // ignore: cast_nullable_to_non_nullable
              as String?,
      bankName: freezed == bankName
          ? _self.bankName
          : bankName // ignore: cast_nullable_to_non_nullable
              as String?,
      bankCode: freezed == bankCode
          ? _self.bankCode
          : bankCode // ignore: cast_nullable_to_non_nullable
              as String?,
      branchCode: freezed == branchCode
          ? _self.branchCode
          : branchCode // ignore: cast_nullable_to_non_nullable
              as String?,
      accountNumber: freezed == accountNumber
          ? _self.accountNumber
          : accountNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      routingNumber: freezed == routingNumber
          ? _self.routingNumber
          : routingNumber // ignore: cast_nullable_to_non_nullable
              as String?,
      swiftCode: freezed == swiftCode
          ? _self.swiftCode
          : swiftCode // ignore: cast_nullable_to_non_nullable
              as String?,
      mobileMoneyAccount: freezed == mobileMoneyAccount
          ? _self.mobileMoneyAccount
          : mobileMoneyAccount // ignore: cast_nullable_to_non_nullable
              as String?,
      paypalAddress: freezed == paypalAddress
          ? _self.paypalAddress
          : paypalAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinName: freezed == cryptoCoinName
          ? _self.cryptoCoinName
          : cryptoCoinName // ignore: cast_nullable_to_non_nullable
              as String?,
      cryptoCoinAddress: freezed == cryptoCoinAddress
          ? _self.cryptoCoinAddress
          : cryptoCoinAddress // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
