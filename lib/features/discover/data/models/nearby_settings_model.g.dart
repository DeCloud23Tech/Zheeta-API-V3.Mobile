// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbySettingsModel _$NearbySettingsModelFromJson(Map<String, dynamic> json) =>
    _NearbySettingsModel(
      id: (json['id'] as num).toInt(),
      radiusInKm: (json['radiusInKm'] as num).toInt(),
    );

Map<String, dynamic> _$NearbySettingsModelToJson(
        _NearbySettingsModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'radiusInKm': instance.radiusInKm,
    };
