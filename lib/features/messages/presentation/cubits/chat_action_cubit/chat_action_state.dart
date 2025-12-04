part of 'chat_action_cubit.dart';

enum ChatActionStatus { initial, loading, success, error }

class ChatActionState extends Equatable {
  final ChatActionStatus status;
  final MessageModel? message;
  final String? error;

  const ChatActionState({
    this.status = ChatActionStatus.initial,
    this.message,
    this.error,
  });

  ChatActionState copyWith({
    ChatActionStatus? status,
    MessageModel? message,
    String? error,
  }) {
    return ChatActionState(
      status: status ?? this.status,
      message: message ?? this.message,
      error: error,
    );
  }

  @override
  List<Object?> get props => [status, message, error];
}
