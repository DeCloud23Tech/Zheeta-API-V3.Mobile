// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_update_bank_account_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateUpdateBankAccountRequest _$CreateUpdateBankAccountRequestFromJson(
        Map<String, dynamic> json) =>
    CreateUpdateBankAccountRequest(
      userId: json['UserId'] as String,
      accountCountry: json['AccountCountry'] as String,
      bankName: json['BankName'] as String,
      bankCode: json['BankCode'] as String,
      accountNumber: json['AccountNumber'] as String,
      accountCurrency: json['AccountCurrency'] as String,
      accountSwiftCode: json['AccountSwiftCode'] as String,
      accountBICCode: json['AccountBICCode'] as String,
      otherDetails: json['OtherDetails'] as String,
      accountName: json['AccountName'] as String,
    );

Map<String, dynamic> _$CreateUpdateBankAccountRequestToJson(
        CreateUpdateBankAccountRequest instance) =>
    <String, dynamic>{
      'UserId': instance.userId,
      'AccountCountry': instance.accountCountry,
      'BankName': instance.bankName,
      'BankCode': instance.bankCode,
      'AccountNumber': instance.accountNumber,
      'AccountCurrency': instance.accountCurrency,
      'AccountSwiftCode': instance.accountSwiftCode,
      'AccountBICCode': instance.accountBICCode,
      'OtherDetails': instance.otherDetails,
      'AccountName': instance.accountName,
    };
