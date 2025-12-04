part of 'notification_action_cubit.dart';

enum NotificationActionStatus { initial, loading, success, error }

enum NotificationOperationType {
  none,
  markAllRead,
  markSingleRead,
  delete,
}

class NotificationActionState {
  final NotificationActionStatus status;
  final NotificationOperationType operationType;
  final String? message;

  const NotificationActionState({
    this.status = NotificationActionStatus.initial,
    this.operationType = NotificationOperationType.none,
    this.message,
  });

  NotificationActionState copyWith({
    NotificationActionStatus? status,
    NotificationOperationType? operationType,
    String? message,
  }) {
    return NotificationActionState(
      status: status ?? this.status,
      operationType: operationType ?? this.operationType,
      message: message,
    );
  }
}
