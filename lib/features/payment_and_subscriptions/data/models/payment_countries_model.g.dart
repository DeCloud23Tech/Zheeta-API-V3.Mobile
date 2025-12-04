// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountryData _$CountryDataFromJson(Map<String, dynamic> json) => _CountryData(
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String,
      countryCurrency: json['countryCurrency'] as String,
      paymentOptions: (json['paymentOptions'] as List<dynamic>)
          .map((e) => PaymentOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryDataToJson(_CountryData instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'countryCurrency': instance.countryCurrency,
      'paymentOptions': instance.paymentOptions,
    };

_PaymentOption _$PaymentOptionFromJson(Map<String, dynamic> json) =>
    _PaymentOption(
      payment: json['payment'] as String,
      providers:
          (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
      mandatory:
          (json['mandatory'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$PaymentOptionToJson(_PaymentOption instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'providers': instance.providers,
      'mandatory': instance.mandatory,
    };
