// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'zheeta_wallet_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ZheetaWalletModelImpl _$$ZheetaWalletModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ZheetaWalletModelImpl(
      id: (json['id'] as num).toInt(),
      subscriptionSum: json['subscriptionSum'] as String,
      withdrawalSum: json['withdrawalSum'] as String,
      totalWalletSum: json['totalWalletSum'] as String,
      affiliateSum: json['affiliateSum'] as String,
      profileBoostSum: json['profileBoostSum'] as String,
      lastTransactionDate:
          DateTime.parse(json['lastTransactionDate'] as String),
    );

Map<String, dynamic> _$$ZheetaWalletModelImplToJson(
        _$ZheetaWalletModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'subscriptionSum': instance.subscriptionSum,
      'withdrawalSum': instance.withdrawalSum,
      'totalWalletSum': instance.totalWalletSum,
      'affiliateSum': instance.affiliateSum,
      'profileBoostSum': instance.profileBoostSum,
      'lastTransactionDate': instance.lastTransactionDate.toIso8601String(),
    };
