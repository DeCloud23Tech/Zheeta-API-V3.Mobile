// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_NearbyDataModel _$NearbyDataModelFromJson(Map<String, dynamic> json) =>
    _NearbyDataModel(
      id: json['id'] as String,
      username: json['username'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String?,
      location: json['location'] as String,
      distance: (json['distance'] as num).toDouble(),
      age: (json['age'] as num).toInt(),
      gender: json['gender'] as String,
      totalWeight: (json['totalWeight'] as num).toInt(),
    );

Map<String, dynamic> _$NearbyDataModelToJson(_NearbyDataModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'profilePhotoURL': instance.profilePhotoURL,
      'location': instance.location,
      'distance': instance.distance,
      'age': instance.age,
      'gender': instance.gender,
      'totalWeight': instance.totalWeight,
    };

_NearbyListDataModel _$NearbyListDataModelFromJson(Map<String, dynamic> json) =>
    _NearbyListDataModel(
      data: (json['data'] as List<dynamic>)
          .map((e) => NearbyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$NearbyListDataModelToJson(
        _NearbyListDataModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
