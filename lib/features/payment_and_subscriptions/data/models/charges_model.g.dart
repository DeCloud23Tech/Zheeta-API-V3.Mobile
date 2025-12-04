// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'charges_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_ChargesListModel _$ChargesListModelFromJson(Map<String, dynamic> json) =>
    _ChargesListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => Charge.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ChargesListModelToJson(_ChargesListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_Charge _$ChargeFromJson(Map<String, dynamic> json) => _Charge(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$ChargeToJson(_Charge instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'amount': instance.amount,
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
