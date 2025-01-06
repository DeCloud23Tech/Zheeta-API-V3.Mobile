// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'total_matched_count_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GetTotalMatchedCountResponseImpl _$$GetTotalMatchedCountResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$GetTotalMatchedCountResponseImpl(
      statusCode: (json['statusCode'] as num).toInt(),
      message: json['message'] as String,
      success: json['success'] as bool,
      totalCount: (json['totalCount'] as num).toInt(),
      data: (json['data'] as num).toInt(),
    );

Map<String, dynamic> _$$GetTotalMatchedCountResponseImplToJson(
        _$GetTotalMatchedCountResponseImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };
