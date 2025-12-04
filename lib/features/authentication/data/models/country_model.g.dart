// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CountryModel _$CountryModelFromJson(Map<String, dynamic> json) =>
    _CountryModel(
      code: json['code'] as String?,
      code2Iso: json['code2Iso'] as String?,
      name: json['name'] as String?,
      phoneCode: json['phoneCode'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$CountryModelToJson(_CountryModel instance) =>
    <String, dynamic>{
      'code': instance.code,
      'code2Iso': instance.code2Iso,
      'name': instance.name,
      'phoneCode': instance.phoneCode,
      'currency': instance.currency,
    };

_CountryListModel _$CountryListModelFromJson(Map<String, dynamic> json) =>
    _CountryListModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CountryListModelToJson(_CountryListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
