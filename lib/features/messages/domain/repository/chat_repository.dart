import 'dart:io';

import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/messages/data/model/chat_history_model.dart';
import 'package:zheeta/features/messages/data/model/chat_recipients_model.dart';
import 'package:zheeta/features/messages/data/model/message_model.dart';
import 'package:zheeta/features/messages/data/request/create_chat_request.dart';

abstract class ChatRepository {
  ResultFuture<MessageModel> createChat({
    required CreateChatRequest request,
  });

  ResultVoid deleteChatHistory({
    required String senderId,
    required String recipientId,
  });

  ResultFuture<ChatHistory> getChatHistory({
    required String recipientId,
    required int pageNumber,
    required int pageSize,
  });

  ResultVoid deleteChatMessage({
    required String id,
    required String senderId,
    required String recipientId,
  });

  ResultFuture<ChatRecipients> getAllRecipients({
    required int pageNumber,
    required int pageSize,
  });

  // Send a media file
  ResultFuture<MessageModel> sendMediaFile({
    required String message,
    required String recipientId,
    required String senderId,
    required File file,
  });
}
