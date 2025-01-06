// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_post_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserPostModelImpl _$$UserPostModelImplFromJson(Map<String, dynamic> json) =>
    _$UserPostModelImpl(
      mediaCollectionURL: json['mediaCollectionURL'],
    );

Map<String, dynamic> _$$UserPostModelImplToJson(_$UserPostModelImpl instance) =>
    <String, dynamic>{
      'mediaCollectionURL': instance.mediaCollectionURL,
    };

_$UserPostListModelImpl _$$UserPostListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$UserPostListModelImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => UserPostModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$UserPostListModelImplToJson(
        _$UserPostListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };
