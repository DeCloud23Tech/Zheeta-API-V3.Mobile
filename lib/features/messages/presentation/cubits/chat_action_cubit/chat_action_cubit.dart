import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/messages/data/models/chat_history_model.dart';
import 'package:zheeta/features/messages/data/models/message_model.dart';
import 'package:zheeta/features/messages/data/requests/create_chat_request.dart';
import 'package:zheeta/features/messages/domain/usecases/create_chat.dart';

part 'chat_action_state.dart';

@prod
@injectable
class ChatActionCubit extends Cubit<ChatActionState> {
  final CreateChat _createChat;
  final SendMediaFile _sendMediaFile;

  ChatActionCubit({
    required CreateChat createChat,
    required SendMediaFile sendMediaFile,
  })  : _createChat = createChat,
        _sendMediaFile = sendMediaFile,
        super(const ChatActionState());

  /// Create a new chat
  Future<void> createChat(CreateChatRequest request) async {
    emit(state.copyWith(status: ChatActionStatus.loading, error: null));
    final result = await _createChat(request);
    result.fold(
      (error) => emit(state.copyWith(
        status: ChatActionStatus.error,
        error: error.message,
      )),
      (message) => emit(state.copyWith(
        status: ChatActionStatus.success,
        message: message,
      )),
    );
  }

  /// Send a media file
  Future<void> sendMedia({
    String? message,
    required String recipientId,
    required String senderId,
    required File file,
  }) async {
    emit(state.copyWith(status: ChatActionStatus.loading, error: null));
    final params = SendMediaFileParams(
      message: message,
      recipientId: recipientId,
      senderId: senderId,
      file: file,
    );
    final result = await _sendMediaFile(params);
    result.fold(
      (error) => emit(state.copyWith(
        status: ChatActionStatus.error,
        error: error.message,
      )),
      (message) => emit(state.copyWith(
        status: ChatActionStatus.success,
        message: message,
      )),
    );
  }

  /// Reset state back to initial
  void reset() => emit(const ChatActionState());
}

Message convertMessageModelToMessage(MessageModel model) {
  return Message(
    id: model.id,
    message: model.message ?? '',
    senderId: model.senderId,
    recipientId: model.recipientId,
    mediaUrl: model.mediaUrl ?? '',
    timestamp: model.timestamp.toIso8601String(),
    isRead: model.isRead,
    partitionKey: model.partitionKey,
    lastModifiedDate: model.lastModifiedDate.toIso8601String(),
    createdDate: model.createdDate.toIso8601String(),
  );
}
