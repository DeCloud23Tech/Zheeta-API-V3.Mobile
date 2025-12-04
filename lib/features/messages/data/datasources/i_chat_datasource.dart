import 'dart:io';

import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/messages/data/models/chat_history_model.dart';
import 'package:zheeta/features/messages/data/models/chat_recipients_model.dart';
import 'package:zheeta/features/messages/data/models/message_model.dart';
import 'package:zheeta/features/messages/data/requests/create_chat_request.dart';

abstract class IChatDataSource {
  Future<ChatHistory> getChatHistory({
    required String recipientId,
    required int pageNumber,
    required int pageSize,
  });

  Future<MessageModel> createChat({
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

  Future<ChatRecipients> getAllRecipients({
    required int pageNumber,
    required int pageSize,
  });

  Future<MessageModel> sendMediaFile({
    required String message,
    required String recipientId,
    required String senderId,
    required File file,
  });
}
