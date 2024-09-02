part of 'notification_cubit.dart';

abstract class NotificationState extends Equatable {
  const NotificationState();
}

class NotificationInitial extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationLoading extends NotificationState {
  @override
  List<Object> get props => [];
}

class NotificationError extends NotificationState {
  final String errorMessage;

  const NotificationError(this.errorMessage);

  @override
  List<Object> get props => [errorMessage];
}

class NotificationSuccess extends NotificationState {
  final List<NotificationModel> notifications;
  final bool hasReachedMax;

  const NotificationSuccess(this.notifications, this.hasReachedMax);

  @override
  List<Object> get props => [notifications, hasReachedMax];
}
