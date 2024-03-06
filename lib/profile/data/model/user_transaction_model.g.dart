// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_transaction_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserTransactionModelImpl _$$UserTransactionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserTransactionModelImpl(
      userId: json['userId'],
      title: json['title'],
      fromUsername: json['fromUsername'],
      amount: json['amount'],
      transactionType: json['transactionType'],
      lastModifiedDate: json['lastModifiedDate'],
      createdDate: json['createdDate'],
    );

Map<String, dynamic> _$$UserTransactionModelImplToJson(
        _$UserTransactionModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'title': instance.title,
      'fromUsername': instance.fromUsername,
      'amount': instance.amount,
      'transactionType': instance.transactionType,
      'lastModifiedDate': instance.lastModifiedDate,
      'createdDate': instance.createdDate,
    };

_$UserTransactionListModelImpl _$$UserTransactionListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserTransactionListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserTransactionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserTransactionListModelImplToJson(
        _$UserTransactionListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
