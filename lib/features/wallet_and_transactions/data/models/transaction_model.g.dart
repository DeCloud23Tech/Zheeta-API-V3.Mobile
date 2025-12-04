// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_TransactionModel _$TransactionModelFromJson(Map<String, dynamic> json) =>
    _TransactionModel(
      id: json['id'] as String,
      userId: json['userId'] as String,
      title: json['title'] as String,
      fromUsername: json['fromUsername'] as String,
      amount: (json['amount'] as num).toDouble(),
      transactionType: json['transactionType'] as String,
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$TransactionModelToJson(_TransactionModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'title': instance.title,
      'fromUsername': instance.fromUsername,
      'amount': instance.amount,
      'transactionType': instance.transactionType,
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
    };
