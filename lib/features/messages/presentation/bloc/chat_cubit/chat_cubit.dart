import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/param/pagination_param.dart';
import 'package:zheeta/features/messages/data/model/chat_history_model.dart';
import 'package:zheeta/features/messages/data/model/chat_recipients_model.dart';
import 'package:zheeta/features/messages/data/model/message_model.dart';
import 'package:zheeta/features/messages/data/request/create_chat_request.dart';
import 'package:zheeta/features/messages/domain/usecase/create_chat.dart';
import 'package:zheeta/features/messages/domain/usecase/delete_chat.dart';
import 'package:zheeta/features/messages/domain/usecase/get_chat_history.dart';
import 'package:zheeta/features/messages/domain/usecase/get_chat_recipient.dart';

part 'chat_state.dart';

@prod
@LazySingleton()
class ChatCubit extends Cubit<ChatState> {
  final GetChatRecipients getChatRecipients;
  final GetChatHistory getChatHistory;
  final CreateChat createChat;
  final SendMediaFile sendMediaFile;
  final DeleteChatHistory deleteChat;
  final DeleteChatMessage deleteMessage;

  ChatCubit({
    required this.getChatRecipients,
    required this.getChatHistory,
    required this.createChat,
    required this.sendMediaFile,
    required this.deleteChat,
    required this.deleteMessage,
  }) : super(ChatInitial());


  resetState() {
    emit(ChatInitial());
  }

  Future<void> fetchRecipientsCubit(PaginationParam request) async {
    emit(ChatLoading());
    var result = await getChatRecipients(request);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (recipients) => emit(ChatRecipientsLoaded(recipients)),
    );
  }

  Future<void> fetchChatHistoryCubit(PaginationParam request) async {
    emit(ChatLoading());
    var result = await getChatHistory(request);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (chatHistory) => emit(ChatHistoryLoaded(chatHistory)),
    );
  }

  Future<void> createNewChatCubit(CreateChatRequest request) async {
    emit(ChatLoading());
    var result = await createChat(request);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (message) => emit(ChatMessageSent(message)),
    );
  }

  Future<void> sendMediaCubit(SendMediaFileParams params) async {
    emit(ChatLoading());
    var result = await sendMediaFile(params);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (message) => emit(ChatMessageSent(message)),
    );
  }

  Future<bool> deleteChatHistoryCubit(ChatParam request) async {
    emit(ChatLoading());
    var result = await deleteChat(request);
    return result.fold(
      (failure) {
        emit(ChatError(failure.message));
        return false;
      },
      (_) {
        emit(ChatDeleted());
        return true;
      },
    );
  }

  Future<void> deleteChatMessageCubit(DeleteMessageParam request) async {
    emit(ChatLoading());
    var result = await deleteMessage(request);
    result.fold(
      (failure) => emit(ChatError(failure.message)),
      (_) => emit(ChatMessageDeleted()),
    );
  }
}
