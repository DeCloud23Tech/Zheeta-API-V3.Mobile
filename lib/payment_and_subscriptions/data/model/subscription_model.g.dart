// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'subscription_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SubscriptionModelImpl _$$SubscriptionModelImplFromJson(
        Map<String, dynamic> json) =>
    _$SubscriptionModelImpl(
      id: json['id'] as int,
      name: json['name'] as String,
      description: json['description'] as String,
      fee: json['fee'] as int,
      allowMessaging: json['allowMessaging'] as bool,
      noMatchesPerDay: json['noMatchesPerDay'] as int,
      noOfPostPerDay: json['noOfPostPerDay'] as int,
      noNearbyPerWeek: json['noNearbyPerWeek'] as int,
      allowWithdrawal: json['allowWithdrawal'] as bool,
      allowMultipleMediaInPost: json['allowMultipleMediaInPost'] as bool,
      maxNumberOfMediaInPost: json['maxNumberOfMediaInPost'] as int,
      allowVideoMediaCategoryInPost:
          json['allowVideoMediaCategoryInPost'] as bool,
      allowCreateCommunity: json['allowCreateCommunity'] as bool,
      accessPeopleNearby: json['accessPeopleNearby'] as bool,
    );

Map<String, dynamic> _$$SubscriptionModelImplToJson(
        _$SubscriptionModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'fee': instance.fee,
      'allowMessaging': instance.allowMessaging,
      'noMatchesPerDay': instance.noMatchesPerDay,
      'noOfPostPerDay': instance.noOfPostPerDay,
      'noNearbyPerWeek': instance.noNearbyPerWeek,
      'allowWithdrawal': instance.allowWithdrawal,
      'allowMultipleMediaInPost': instance.allowMultipleMediaInPost,
      'maxNumberOfMediaInPost': instance.maxNumberOfMediaInPost,
      'allowVideoMediaCategoryInPost': instance.allowVideoMediaCategoryInPost,
      'allowCreateCommunity': instance.allowCreateCommunity,
      'accessPeopleNearby': instance.accessPeopleNearby,
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
