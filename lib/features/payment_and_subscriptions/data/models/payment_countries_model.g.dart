// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountryData _$CountryDataFromJson(Map<String, dynamic> json) => _CountryData(
      code: json['code'] as String,
      code2Iso: json['code2Iso'] as String,
      name: json['name'] as String,
      phoneCode: json['phoneCode'] as String?,
      currency: json['currency'] as String,
    );

Map<String, dynamic> _$CountryDataToJson(_CountryData instance) =>
    <String, dynamic>{
      'code': instance.code,
      'code2Iso': instance.code2Iso,
      'name': instance.name,
      'phoneCode': instance.phoneCode,
      'currency': instance.currency,
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
