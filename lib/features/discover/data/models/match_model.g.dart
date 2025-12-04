// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MatchModel _$MatchModelFromJson(Map<String, dynamic> json) => _MatchModel(
      id: json['id'],
      username: json['username'],
      profilePhotoURL: json['profilePhotoURL'],
      location: json['location'],
      distance: json['distance'],
      age: json['age'],
      gender: json['gender'],
      totalWeight: json['totalWeight'],
    );

Map<String, dynamic> _$MatchModelToJson(_MatchModel instance) =>
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

_MatchListModel _$MatchListModelFromJson(Map<String, dynamic> json) =>
    _MatchListModel(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => MatchModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MatchListModelToJson(_MatchListModel instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
