// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_InterestModel _$InterestModelFromJson(Map<String, dynamic> json) =>
    _InterestModel(
      id: json['id'],
      title: json['title'],
    );

Map<String, dynamic> _$InterestModelToJson(_InterestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_InterestListModel _$InterestListModelFromJson(Map<String, dynamic> json) =>
    _InterestListModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => InterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$InterestListModelToJson(_InterestListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
