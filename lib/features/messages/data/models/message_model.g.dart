// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_MessageModel _$MessageModelFromJson(Map<String, dynamic> json) =>
    _MessageModel(
      id: json['id'] as String,
      senderId: json['senderId'] as String,
      recipientId: json['recipientId'] as String,
      message: json['message'] as String?,
      mediaUrl: json['mediaUrl'] as String?,
      partitionKey: json['partitionKey'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
      createdDate: DateTime.parse(json['createdDate'] as String),
      lastModifiedDate: DateTime.parse(json['lastModifiedDate'] as String),
      isRead: json['isRead'] as bool,
    );

Map<String, dynamic> _$MessageModelToJson(_MessageModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'senderId': instance.senderId,
      'recipientId': instance.recipientId,
      'message': instance.message,
      'mediaUrl': instance.mediaUrl,
      'partitionKey': instance.partitionKey,
      'timestamp': instance.timestamp.toIso8601String(),
      'createdDate': instance.createdDate.toIso8601String(),
      'lastModifiedDate': instance.lastModifiedDate.toIso8601String(),
      'isRead': instance.isRead,
    };
