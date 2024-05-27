// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'nearby_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NearbyListModelImpl _$$NearbyListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => NearbyDataModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$NearbyListModelImplToJson(
        _$NearbyListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data.map((e) => e.toJson()).toList(),
    };

_$NearbyDataModelImpl _$$NearbyDataModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NearbyDataModelImpl(
      id: json['id'] as String,
      username: json['username'] as String,
      profilePhotoURL: json['profilePhotoURL'] as String,
      location: json['location'] as String,
      distance: json['distance'] as int,
      age: json['age'] as int,
      gender: json['gender'] as String,
      totalWeight: json['totalWeight'] as int,
    );

Map<String, dynamic> _$$NearbyDataModelImplToJson(
        _$NearbyDataModelImpl instance) =>
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
