// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'generate_payment_link_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GeneratePaymentLinkDataImpl _$$GeneratePaymentLinkDataImplFromJson(
        Map<String, dynamic> json) =>
    _$GeneratePaymentLinkDataImpl(
      paymentProvider: json['paymentProvider'] as String,
      paymentGenerationData: PaymentGenerationData.fromJson(
          json['paymentGenerationData'] as Map<String, dynamic>),
      verificationData: json['verificationData'] == null
          ? null
          : VerificationData.fromJson(
              json['verificationData'] as Map<String, dynamic>),
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      success: json['success'] as bool,
      data: json['data'],
    );

Map<String, dynamic> _$$GeneratePaymentLinkDataImplToJson(
        _$GeneratePaymentLinkDataImpl instance) =>
    <String, dynamic>{
      'paymentProvider': instance.paymentProvider,
      'paymentGenerationData': instance.paymentGenerationData,
      'verificationData': instance.verificationData,
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'data': instance.data,
    };

_$PaymentGenerationDataImpl _$$PaymentGenerationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$PaymentGenerationDataImpl(
      id: json['id'] as String,
      paymentLink: json['paymentLink'] as String,
      addressToPayTo: json['addressToPayTo'] as String?,
      currencyToPay: json['currencyToPay'] as String,
      amountToPay: (json['amountToPay'] as num).toDouble(),
      amountOfZheetaCoins: (json['amountOfZheetaCoins'] as num).toDouble(),
    );

Map<String, dynamic> _$$PaymentGenerationDataImplToJson(
        _$PaymentGenerationDataImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'paymentLink': instance.paymentLink,
      'addressToPayTo': instance.addressToPayTo,
      'currencyToPay': instance.currencyToPay,
      'amountToPay': instance.amountToPay,
      'amountOfZheetaCoins': instance.amountOfZheetaCoins,
    };

_$VerificationDataImpl _$$VerificationDataImplFromJson(
        Map<String, dynamic> json) =>
    _$VerificationDataImpl();

Map<String, dynamic> _$$VerificationDataImplToJson(
        _$VerificationDataImpl instance) =>
    <String, dynamic>{};
