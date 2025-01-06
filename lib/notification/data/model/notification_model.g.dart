// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NotificationModelImpl _$$NotificationModelImplFromJson(
        Map<String, dynamic> json) =>
    _$NotificationModelImpl(
      userId: json['userId'] as String,
      notificationType: json['notificationType'] as String?,
      content: json['content'] as String,
      userProfilePicUrl: json['userProfilePicUrl'] as String?,
      isRead: json['isRead'] as bool,
      notificationTypeValueId: json['notificationTypeValueId'] as String?,
      id: json['id'] as String,
      partitionKey: json['partitionKey'] as String?,
      lastModifiedDate: json['lastModifiedDate'] == null
          ? null
          : DateTime.parse(json['lastModifiedDate'] as String),
      createdDate: json['createdDate'] == null
          ? null
          : DateTime.parse(json['createdDate'] as String),
    );

Map<String, dynamic> _$$NotificationModelImplToJson(
        _$NotificationModelImpl instance) =>
    <String, dynamic>{
      'userId': instance.userId,
      'notificationType': instance.notificationType,
      'content': instance.content,
      'userProfilePicUrl': instance.userProfilePicUrl,
      'isRead': instance.isRead,
      'notificationTypeValueId': instance.notificationTypeValueId,
      'id': instance.id,
      'partitionKey': instance.partitionKey,
      'lastModifiedDate': instance.lastModifiedDate?.toIso8601String(),
      'createdDate': instance.createdDate?.toIso8601String(),
    };
