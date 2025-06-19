// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ChatHistoryImpl _$$ChatHistoryImplFromJson(Map<String, dynamic> json) =>
    _$ChatHistoryImpl(
      data: (json['data'] as List<dynamic>)
          .map((e) => Message.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ChatHistoryImplToJson(_$ChatHistoryImpl instance) =>
    <String, dynamic>{
      'data': instance.data,
    };

_$MessageImpl _$$MessageImplFromJson(Map<String, dynamic> json) =>
    _$MessageImpl(
      message: json['message'] as String,
      recipientId: json['recipientId'] as String,
      senderId: json['senderId'] as String,
      mediaUrl: json['mediaUrl'] as String,
      timestamp: json['timestamp'] as String,
      isRead: json['isRead'] as bool,
      id: json['id'] as String,
      partitionKey: json['partitionKey'] as String,
      lastModifiedDate: json['lastModifiedDate'] as String?,
      createdDate: json['createdDate'] as String?,
    );

Map<String, dynamic> _$$MessageImplToJson(_$MessageImpl instance) =>
    <String, dynamic>{
      'message': instance.message,
      'recipientId': instance.recipientId,
      'senderId': instance.senderId,
      'mediaUrl': instance.mediaUrl,
      'timestamp': instance.timestamp,
      'isRead': instance.isRead,
      'id': instance.id,
      'partitionKey': instance.partitionKey,
      'lastModifiedDate': instance.lastModifiedDate,
      'createdDate': instance.createdDate,
    };
