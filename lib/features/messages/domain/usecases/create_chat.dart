import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/messages/data/models/message_model.dart';
import 'package:zheeta/features/messages/data/requests/create_chat_request.dart';
import 'package:zheeta/features/messages/domain/repositories/chat_repository.dart';

@prod
@LazySingleton()
class CreateChat extends UsecaseWithParams<MessageModel, CreateChatRequest> {
  const CreateChat(this._repo);

  final IChatRepository _repo;

  @override
  ResultFuture<MessageModel> call(CreateChatRequest params) async =>
      await _repo.createChat(request: params);
}

@prod
@LazySingleton()
class SendMediaFile
    extends UsecaseWithParams<MessageModel, SendMediaFileParams> {
  const SendMediaFile(this._repo);

  final IChatRepository _repo;

  @override
  ResultFuture<MessageModel> call(SendMediaFileParams params) async =>
      await _repo.sendMediaFile(
        message: params.message ?? '',
        recipientId: params.recipientId,
        senderId: params.senderId,
        file: params.file,
      );
}

class SendMediaFileParams {
  final String? message;
  final String recipientId;
  final String senderId;
  final File file;

  SendMediaFileParams({
    this.message,
    required this.recipientId,
    required this.senderId,
    required this.file,
  });
}
