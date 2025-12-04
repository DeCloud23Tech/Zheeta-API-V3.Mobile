// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_update_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NearbyUpdateRequest _$NearbyUpdateRequestFromJson(Map<String, dynamic> json) =>
    NearbyUpdateRequest(
      id: json['id'] as String,
      userId: json['userId'] as String,
      radiusInKm: (json['radiusInKm'] as num).toInt(),
      longitude: (json['longitude'] as num).toDouble(),
      latitude: (json['latitude'] as num).toDouble(),
      gender: json['gender'] as String,
    );

Map<String, dynamic> _$NearbyUpdateRequestToJson(
        NearbyUpdateRequest instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'radiusInKm': instance.radiusInKm,
      'longitude': instance.longitude,
      'latitude': instance.latitude,
      'gender': instance.gender,
    };
