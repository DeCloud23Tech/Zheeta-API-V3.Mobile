// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      description: json['description'] as String?,
      fee: (json['fee'] as num).toDouble(),
      allowMessaging: json['allowMessaging'] as bool,
      allowWithdrawal: json['allowWithdrawal'] as bool,
      accessPeopleNearby: json['accessPeopleNearby'] as bool,
      noMatchesPerDay: (json['noMatchesPerDay'] as num).toInt(),
      noOfBuddyEventPerWeek: (json['noOfBuddyEventPerWeek'] as num).toInt(),
      noNearbyPerWeek: (json['noNearbyPerWeek'] as num).toInt(),
      noOfChatMessagePerWeek: (json['noOfChatMessagePerWeek'] as num).toInt(),
      features: (json['features'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          const [],
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'fee': instance.fee,
      'allowMessaging': instance.allowMessaging,
      'allowWithdrawal': instance.allowWithdrawal,
      'accessPeopleNearby': instance.accessPeopleNearby,
      'noMatchesPerDay': instance.noMatchesPerDay,
      'noOfBuddyEventPerWeek': instance.noOfBuddyEventPerWeek,
      'noNearbyPerWeek': instance.noNearbyPerWeek,
      'noOfChatMessagePerWeek': instance.noOfChatMessagePerWeek,
      'features': instance.features,
    };

_$SubscriptionListModelImpl _$$SubscriptionListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => SubscriptionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SubscriptionListModelImplToJson(
        _$SubscriptionListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
