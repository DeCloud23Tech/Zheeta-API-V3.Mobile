// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'wallet_counters_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_WalletCounters _$WalletCountersFromJson(Map<String, dynamic> json) =>
    _WalletCounters(
      userId: json['userId'] as String,
      balance: (json['balance'] as num).toDouble(),
      regularCount: (json['regularCount'] as num).toInt(),
      silverCount: (json['silverCount'] as num).toInt(),
      goldCount: (json['goldCount'] as num).toInt(),
    );

Map<String, dynamic> _$WalletCountersToJson(_WalletCounters instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'balance': instance.balance,
      'regularCount': instance.regularCount,
      'silverCount': instance.silverCount,
      'goldCount': instance.goldCount,
    };
