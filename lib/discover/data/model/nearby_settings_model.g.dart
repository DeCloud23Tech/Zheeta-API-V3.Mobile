// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbySettingsModelImpl _$$NearbySettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbySettingsModelImpl(
      statusCode: json['statusCode'] as int,
      message: json['message'] as String,
      success: json['success'] as bool,
      totalCount: json['totalCount'] as int,
      data: NearbySettingsDataModel.fromJson(
          json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$NearbySettingsModelImplToJson(
        _$NearbySettingsModelImpl instance) =>
    <String, dynamic>{
      'statusCode': instance.statusCode,
      'message': instance.message,
      'success': instance.success,
      'totalCount': instance.totalCount,
      'data': instance.data,
    };

_$NearbySettingsDataModelImpl _$$NearbySettingsDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbySettingsDataModelImpl(
      id: json['id'] as int,
      radiusInKm: json['radiusInKm'] as int,
    );

Map<String, dynamic> _$$NearbySettingsDataModelImplToJson(
        _$NearbySettingsDataModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'radiusInKm': instance.radiusInKm,
    };
