// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'country_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CountryModelImpl _$$CountryModelImplFromJson(Map<String, dynamic> json) =>
    _$CountryModelImpl(
      code: json['code'] as String?,
      code2Iso: json['code2Iso'] as String?,
      name: json['name'] as String?,
      phoneCode: json['phoneCode'] as String?,
      currency: json['currency'] as String?,
    );

Map<String, dynamic> _$$CountryModelImplToJson(_$CountryModelImpl instance) =>
    <String, dynamic>{
      'code': instance.code,
      'code2Iso': instance.code2Iso,
      'name': instance.name,
      'phoneCode': instance.phoneCode,
      'currency': instance.currency,
    };

_$CountryListModelImpl _$$CountryListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$CountryListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => CountryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$CountryListModelImplToJson(
        _$CountryListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
