// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'gift_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GiftModelImpl _$$GiftModelImplFromJson(Map<String, dynamic> json) =>
    _$GiftModelImpl(
      imageUrl: json['imageUrl'] as String,
      title: json['title'] as String,
      amount: (json['amount'] as num).toDouble(),
      id: json['id'] as String,
      partitionKey: json['partitionKey'] as String,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$GiftModelImplToJson(_$GiftModelImpl instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'title': instance.title,
      'amount': instance.amount,
      'id': instance.id,
      'partitionKey': instance.partitionKey,
      'lastModifiedDate': instance.lastModifiedDate,
      'createdDate': instance.createdDate,
    };

_$GiftListModelImpl _$$GiftListModelImplFromJson(Map<String, dynamic> json) =>
    _$GiftListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => GiftModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$GiftListModelImplToJson(_$GiftListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
