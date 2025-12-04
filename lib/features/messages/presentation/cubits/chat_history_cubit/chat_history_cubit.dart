import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/param/pagination_param.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/messages/data/models/chat_history_model.dart';
import 'package:zheeta/features/messages/domain/usecases/get_chat_history.dart';

/// Cubit to fetch chat history with pagination
@prod
@injectable
class ChatHistoryCubit extends PaginationCubit<Message, PaginationParam> {
  final GetChatHistory _getChatHistory;

  ChatHistoryCubit({
    required GetChatHistory getChatHistory,
  })  : _getChatHistory = getChatHistory,
        super(
          fetchPage: ((params) async {
            final result = await getChatHistory.call(params);

            return result.fold(
              (error) {
                print("ChatHistoryCubit error: ${error.message}");
                throw Exception(error.message);
              },
              (data) {
                print("ChatHistoryCubit fetched ${data.data.length} messages");
                return data.data;
              },
            );
          }),
          baseParams: PaginationParam(pageNo: 1, pageSize: 20),
        );

  /// Refresh chat history for a specific recipient
  Future<void> refreshChatHistory(String recipientId) async {
    await applyParams(
      baseParams.copyWith(userId: recipientId, pageNo: 1),
    );
  }

  /// Add a new message locally without resetting pagination
  void addMessageLocally(Message message) {
    final updatedItems = [message, ...state.items];
    emit(state.copyWith(items: updatedItems));
  }
}
