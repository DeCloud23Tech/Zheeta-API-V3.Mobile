// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'activity_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ActivityModelImpl _$$ActivityModelImplFromJson(Map<String, dynamic> json) =>
    _$ActivityModelImpl(
      totalPostCoin: json['totalPostCoin'],
      posterId: json['posterId'],
      id: json['id'],
      caption: json['caption'],
      location: json['location'],
      mediaCollectionURL: json['mediaCollectionURL'],
      tagCollection: json['tagCollection'],
      redirectUrl: json['redirectUrl'],
      unlikeCount: json['unlikeCount'],
      likeCount: json['likeCount'],
      commentCount: json['commentCount'],
      status: json['status'],
      lastModifiedDate: json['lastModifiedDate'],
    );

Map<String, dynamic> _$$ActivityModelImplToJson(_$ActivityModelImpl instance) =>
    <String, dynamic>{
      'totalPostCoin': instance.totalPostCoin,
      'posterId': instance.posterId,
      'id': instance.id,
      'caption': instance.caption,
      'location': instance.location,
      'mediaCollectionURL': instance.mediaCollectionURL,
      'tagCollection': instance.tagCollection,
      'redirectUrl': instance.redirectUrl,
      'unlikeCount': instance.unlikeCount,
      'likeCount': instance.likeCount,
      'commentCount': instance.commentCount,
      'status': instance.status,
      'lastModifiedDate': instance.lastModifiedDate,
    };

_$ActivityListModelImpl _$$ActivityListModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ActivityListModelImpl(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ActivityModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ActivityListModelImplToJson(
        _$ActivityListModelImpl instance) =>
    <String, dynamic>{
      'data': instance.data?.map((e) => e.toJson()).toList(),
    };
