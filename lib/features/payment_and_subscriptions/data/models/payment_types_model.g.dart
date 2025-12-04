// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_types_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PaymentType _$PaymentTypeFromJson(Map<String, dynamic> json) => _PaymentType(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$PaymentTypeToJson(_PaymentType instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
