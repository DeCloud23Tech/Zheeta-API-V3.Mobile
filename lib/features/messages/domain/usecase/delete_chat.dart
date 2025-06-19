import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/messages/domain/repository/chat_repository.dart';

@prod
@LazySingleton()
class DeleteChatHistory extends UsecaseWithParams<void, ChatParam> {
  const DeleteChatHistory(this._repo);

  final ChatRepository _repo;

  @override
  ResultVoid call(ChatParam params) async => await _repo.deleteChatHistory(
        senderId: params.senderId,
        recipientId: params.recipientId,
      );
}

@prod
@LazySingleton()
class DeleteChatMessage extends UsecaseWithParams<void, DeleteMessageParam> {
  const DeleteChatMessage(this._repo);

  final ChatRepository _repo;

  @override
  ResultVoid call(DeleteMessageParam params) async =>
      await _repo.deleteChatMessage(
        id: params.messageId,
        senderId: params.senderId,
        recipientId: params.recipientId,
      );
}

class ChatParam {
  final String senderId;
  final String recipientId;

  ChatParam({required this.senderId, required this.recipientId});
}

class DeleteMessageParam {
  final String messageId;
  final String senderId;
  final String recipientId;

  DeleteMessageParam({
    required this.messageId,
    required this.senderId,
    required this.recipientId,
  });
}
