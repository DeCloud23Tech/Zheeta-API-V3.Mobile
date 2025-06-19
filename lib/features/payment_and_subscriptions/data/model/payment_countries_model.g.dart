// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_countries_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryDataImpl _$$CountryDataImplFromJson(Map<String, dynamic> json) =>
    _$CountryDataImpl(
      countryName: json['countryName'] as String?,
      countryCode: json['countryCode'] as String,
      countryCurrency: json['countryCurrency'] as String,
      paymentOptions: (json['paymentOptions'] as List<dynamic>)
          .map((e) => PaymentOption.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CountryDataImplToJson(_$CountryDataImpl instance) =>
    <String, dynamic>{
      'countryName': instance.countryName,
      'countryCode': instance.countryCode,
      'countryCurrency': instance.countryCurrency,
      'paymentOptions': instance.paymentOptions,
    };

_$PaymentOptionImpl _$$PaymentOptionImplFromJson(Map<String, dynamic> json) =>
    _$PaymentOptionImpl(
      payment: json['payment'] as String,
      providers:
          (json['providers'] as List<dynamic>).map((e) => e as String).toList(),
      mandatory:
          (json['mandatory'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$PaymentOptionImplToJson(_$PaymentOptionImpl instance) =>
    <String, dynamic>{
      'payment': instance.payment,
      'providers': instance.providers,
      'mandatory': instance.mandatory,
    };
