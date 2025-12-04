// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_UserInterestModel _$UserInterestModelFromJson(Map<String, dynamic> json) =>
    _UserInterestModel(
      id: json['id'],
      title: json['title'],
    );

Map<String, dynamic> _$UserInterestModelToJson(_UserInterestModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_UserInterestListModel _$UserInterestListModelFromJson(
        Map<String, dynamic> json) =>
    _UserInterestListModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserInterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserInterestListModelToJson(
        _UserInterestListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
