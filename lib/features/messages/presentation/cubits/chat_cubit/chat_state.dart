// part of 'chat_cubit.dart';
//
// abstract class ChatState extends Equatable {
//   const ChatState();
//
//   @override
//   List<Object> get props => [];
// }
//
// class ChatInitial extends ChatState {}
//
// class ChatLoading extends ChatState {}
//
// class ChatRecipientsLoaded extends ChatState {
//   final ChatRecipients recipients;
//
//   const ChatRecipientsLoaded(this.recipients);
//
//   @override
//   List<Object> get props => [recipients];
// }
//
// class ChatHistoryLoaded extends ChatState {
//   final ChatHistory chatHistory;
//
//   const ChatHistoryLoaded(this.chatHistory);
//
//   @override
//   List<Object> get props => [chatHistory];
// }
//
// class ChatMessageSent extends ChatState {
//   final MessageModel message;
//
//   const ChatMessageSent(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
//
// class ChatMediaSent extends ChatState {
//   final MessageModel message;
//
//   const ChatMediaSent(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
//
// class ChatDeleted extends ChatState {}
//
// class ChatMessageDeleted extends ChatState {}
//
// class ChatError extends ChatState {
//   final String message;
//
//   const ChatError(this.message);
//
//   @override
//   List<Object> get props => [message];
// }
