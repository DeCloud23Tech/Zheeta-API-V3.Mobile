part of 'chat_delete_cubit.dart';

enum DeleteStatus { initial, loading, success, error }

class ChatDeleteState extends Equatable {
  final DeleteStatus historyStatus;
  final DeleteStatus messageStatus;
  final String? error;

  const ChatDeleteState({
    this.historyStatus = DeleteStatus.initial,
    this.messageStatus = DeleteStatus.initial,
    this.error,
  });

  ChatDeleteState copyWith({
    DeleteStatus? historyStatus,
    DeleteStatus? messageStatus,
    String? error,
  }) {
    return ChatDeleteState(
      historyStatus: historyStatus ?? this.historyStatus,
      messageStatus: messageStatus ?? this.messageStatus,
      error: error,
    );
  }

  @override
  List<Object?> get props => [historyStatus, messageStatus, error];
}
