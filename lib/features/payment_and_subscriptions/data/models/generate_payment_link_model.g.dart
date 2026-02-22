// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_payment_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_GeneratePaymentLinkData _$GeneratePaymentLinkDataFromJson(
        Map<String, dynamic> json) =>
    _GeneratePaymentLinkData(
      paymentProvider: json['paymentProvider'] as String,
      paymentGenerationData: PaymentGenerationData.fromJson(
          json['paymentGenerationData'] as Map<String, dynamic>),
      verificationData: json['verificationData'] == null
          ? null
          : VerificationData.fromJson(
              json['verificationData'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String?,
      success: json['success'] as bool,
      totalCount: json['totalCount'],
      data: json['data'],
      error: json['error'],
    );

Map<String, dynamic> _$GeneratePaymentLinkDataToJson(
        _GeneratePaymentLinkData instance) =>
    <String, dynamic>{
      'paymentProvider': instance.paymentProvider,
      'paymentGenerationData': instance.paymentGenerationData,
      'verificationData': instance.verificationData,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data,
      'error': instance.error,
    };

_PaymentGenerationData _$PaymentGenerationDataFromJson(
        Map<String, dynamic> json) =>
    _PaymentGenerationData(
      id: json['id'] as String,
      paymentLink: json['paymentLink'] as String,
      addressToPayTo: json['addressToPayTo'] as String?,
      currencyToPay: json['currencyToPay'] as String,
      amountToPay: (json['amountToPay'] as num).toDouble(),
      amountOfZheetaCoins: (json['amountOfZheetaCoins'] as num).toDouble(),
    );

Map<String, dynamic> _$PaymentGenerationDataToJson(
        _PaymentGenerationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentLink': instance.paymentLink,
      'addressToPayTo': instance.addressToPayTo,
      'currencyToPay': instance.currencyToPay,
      'amountToPay': instance.amountToPay,
      'amountOfZheetaCoins': instance.amountOfZheetaCoins,
    };

_VerificationData _$VerificationDataFromJson(Map<String, dynamic> json) =>
    _VerificationData();

Map<String, dynamic> _$VerificationDataToJson(_VerificationData instance) =>
    <String, dynamic>{};
