// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MatchModelImpl _$$MatchModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchModelImpl(
      id: json['id'],
      username: json['username'],
      profilePhotoURL: json['profilePhotoURL'],
      location: json['location'],
      distance: json['distance'],
      age: json['age'],
      gender: json['gender'],
      totalWeight: json['totalWeight'],
    );

Map<String, dynamic> _$$MatchModelImplToJson(_$MatchModelImpl instance) =>
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

_$MatchListModelImpl _$$MatchListModelImplFromJson(Map<String, dynamic> json) =>
    _$MatchListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$MatchListModelImplToJson(
        _$MatchListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
