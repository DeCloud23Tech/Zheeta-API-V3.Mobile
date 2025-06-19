// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_detail_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryDetailModelImpl _$$CountryDetailModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountryDetailModelImpl(
      code: json['code'] as String?,
      code2Iso: json['code2Iso'] as String?,
      name: json['name'] as String?,
      phoneCode: json['phoneCode'] as String?,
      currency: json['currency'] as String?,
      cities:
          (json['cities'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$$CountryDetailModelImplToJson(
        _$CountryDetailModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'code2Iso': instance.code2Iso,
      'name': instance.name,
      'phoneCode': instance.phoneCode,
      'currency': instance.currency,
      'cities': instance.cities,
    };
