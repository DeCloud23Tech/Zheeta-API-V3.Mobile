// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charges_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChargesListModelImpl _$$ChargesListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ChargesListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Charge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChargesListModelImplToJson(
        _$ChargesListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$ChargeImpl _$$ChargeImplFromJson(Map<String, dynamic> json) => _$ChargeImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$ChargeImplToJson(_$ChargeImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
