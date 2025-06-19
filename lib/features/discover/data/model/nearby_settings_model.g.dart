// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbySettingsModelImpl _$$NearbySettingsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbySettingsModelImpl(
      id: (json['id'] as num).toInt(),
      radiusInKm: (json['radiusInKm'] as num).toInt(),
    );

Map<String, dynamic> _$$NearbySettingsModelImplToJson(
        _$NearbySettingsModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'radiusInKm': instance.radiusInKm,
    };
