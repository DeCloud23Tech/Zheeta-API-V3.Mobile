// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_account_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentAccount _$PaymentAccountFromJson(Map<String, dynamic> json) =>
    _PaymentAccount(
      id: json['id'] as String,
      userId: json['userId'] as String,
      firstName: json['firstName'] as String,
      lastName: json['lastName'] as String,
      countryIso2Code: json['countryIso2Code'] as String,
      payOutType: json['payOutType'] as String,
      currency: json['currency'] as String,
      bankId: json['bankId'] as String?,
      bankName: json['bankName'] as String?,
      bankCode: json['bankCode'] as String?,
      branchCode: json['branchCode'] as String?,
      accountNumber: json['accountNumber'] as String?,
      routingNumber: json['routingNumber'] as String?,
      swiftCode: json['swiftCode'] as String?,
      mobileMoneyAccount: json['mobileMoneyAccount'] as String?,
      paypalAddress: json['paypalAddress'] as String?,
      cryptoCoinName: json['cryptoCoinName'] as String?,
      cryptoCoinAddress: json['cryptoCoinAddress'] as String?,
    );

Map<String, dynamic> _$PaymentAccountToJson(_PaymentAccount instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'countryIso2Code': instance.countryIso2Code,
      'payOutType': instance.payOutType,
      'currency': instance.currency,
      'bankId': instance.bankId,
      'bankName': instance.bankName,
      'bankCode': instance.bankCode,
      'branchCode': instance.branchCode,
      'accountNumber': instance.accountNumber,
      'routingNumber': instance.routingNumber,
      'swiftCode': instance.swiftCode,
      'mobileMoneyAccount': instance.mobileMoneyAccount,
      'paypalAddress': instance.paypalAddress,
      'cryptoCoinName': instance.cryptoCoinName,
      'cryptoCoinAddress': instance.cryptoCoinAddress,
    };
