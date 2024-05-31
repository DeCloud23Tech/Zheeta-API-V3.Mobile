// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_interest_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserInterestModelImpl _$$UserInterestModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInterestModelImpl(
      id: json['id'],
      title: json['title'],
    );

Map<String, dynamic> _$$UserInterestModelImplToJson(
        _$UserInterestModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
    };

_$UserInterestListModelImpl _$$UserInterestListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserInterestListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserInterestModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserInterestListModelImplToJson(
        _$UserInterestListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };
