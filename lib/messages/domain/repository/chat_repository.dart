import 'dart:io';

import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/messages/data/request/create_chat_request.dart';
import 'package:zheeta/messages/presentation/views/chat_texts_screen.dart';

abstract class ChatRepository {
  ResultVoid createChat({
    required CreateChatRequest request,
  });

  ResultVoid deleteChatHistory({
    required String senderId,
    required String recipientId,
  });

  ResultFuture<List<ChatMessage>> getChatHistory({
    required String recipientId,
    required int pageNumber,
    required int pageSize,
  });

  ResultVoid deleteChatMessage({
    required String id,
    required String senderId,
    required String recipientId,
  });

  ResultFuture<List<ChatRecipient>> getAllRecipients({
    required int pageNumber,
    required int pageSize,
  });

  // Send a media file
  ResultVoid sendMediaFile({
    required String chatId,
    required File file,
  });
}

class ChatMessage {
}

class ChatRecipient {
}
