import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_history_model.freezed.dart';
part 'chat_history_model.g.dart';

@freezed
class ChatHistory with _$ChatHistory {
  const factory ChatHistory({
    required List<Message> data,
  }) = _ChatHistory;

  factory ChatHistory.fromJson(Map<String, dynamic> json) =>
      _$ChatHistoryFromJson(json);
}

@freezed
class Message with _$Message {
  const factory Message({
    required String message,
    required String recipientId,
    required String senderId,
    required String mediaUrl,
    required String timestamp,
    required bool isRead,
    required String id,
    required String partitionKey,
    String? lastModifiedDate,
    String? createdDate,
  }) = _Message;

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
}
