import 'dart:io';
import 'package:zheeta/messages/data/request/create_chat_request.dart';

import '../../domain/repository/chat_repository.dart';



abstract class ChatDataSource {
  Future<List<ChatMessage>> getChatHistory({
    required String recipientId,
    required int pageNumber,
    required int pageSize,
  });

  Future<void> createChat({
    required CreateChatRequest request,
  });

  Future<void> deleteChatHistory({
    required String senderId,
    required String recipientId,
  });

  Future<void> deleteChatMessage({
    required String id,
    required String senderId,
    required String recipientId,
  });

  Future<List<ChatRecipient>> getAllRecipients({
    required int pageNumber,
    required int pageSize,
  });

  Future<void> sendMediaFile({
    required String chatId,
    required File file,
  });
}
