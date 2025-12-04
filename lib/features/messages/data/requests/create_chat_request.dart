import 'package:json_annotation/json_annotation.dart';

part 'create_chat_request.g.dart';

@JsonSerializable()
class CreateChatRequest {
  final String message;
  final String recipientId;
  final String senderId;
  final String? mediaUrl;
  final DateTime timestamp;

  CreateChatRequest({
    required this.message,
    required this.recipientId,
    required this.senderId,
    this.mediaUrl,
    required this.timestamp,
  });

  factory CreateChatRequest.fromJson(Map<String, dynamic> json) => _$CreateChatRequestFromJson(json);

  Map<String, dynamic> toJson() => _$CreateChatRequestToJson(this);
}
