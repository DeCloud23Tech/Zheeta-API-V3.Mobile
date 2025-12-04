import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/messages/domain/usecases/delete_chat.dart';

part 'chat_delete_state.dart';

@prod
@injectable
class ChatDeleteCubit extends Cubit<ChatDeleteState> {
  final DeleteChatHistory _deleteChatHistory;
  final DeleteChatMessage _deleteChatMessage;

  ChatDeleteCubit({
    required DeleteChatHistory deleteChatHistory,
    required DeleteChatMessage deleteChatMessage,
  })  : _deleteChatHistory = deleteChatHistory,
        _deleteChatMessage = deleteChatMessage,
        super(const ChatDeleteState());

  /// Delete entire chat history
  Future<void> deleteChatHistory(ChatParam params) async {
    emit(state.copyWith(historyStatus: DeleteStatus.loading, error: null));
    final result = await _deleteChatHistory(params);
    result.fold(
      (error) => emit(state.copyWith(
        historyStatus: DeleteStatus.error,
        error: error.message,
      )),
      (_) => emit(state.copyWith(
        historyStatus: DeleteStatus.success,
      )),
    );
  }

  /// Delete a single chat message
  Future<void> deleteChatMessage(DeleteMessageParam params) async {
    emit(state.copyWith(messageStatus: DeleteStatus.loading, error: null));
    final result = await _deleteChatMessage(params);
    result.fold(
      (error) => emit(state.copyWith(
        messageStatus: DeleteStatus.error,
        error: error.message,
      )),
      (_) => emit(state.copyWith(
        messageStatus: DeleteStatus.success,
      )),
    );
  }

  /// Reset state
  void reset() => emit(const ChatDeleteState());
}
