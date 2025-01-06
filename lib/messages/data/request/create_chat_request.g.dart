// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_chat_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreateChatRequest _$CreateChatRequestFromJson(Map<String, dynamic> json) =>
    CreateChatRequest(
      message: json['message'] as String,
      recipientId: json['recipientId'] as String,
      senderId: json['senderId'] as String,
      mediaUrl: json['mediaUrl'] as String,
      timestamp: DateTime.parse(json['timestamp'] as String),
    );

Map<String, dynamic> _$CreateChatRequestToJson(CreateChatRequest instance) =>
    <String, dynamic>{
      'message': instance.message,
      'recipientId': instance.recipientId,
      'senderId': instance.senderId,
      'mediaUrl': instance.mediaUrl,
      'timestamp': instance.timestamp.toIso8601String(),
    };
