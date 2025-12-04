import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/notification/domain/usecases/notification_usecase.dart';

part 'notification_action_state.dart';

@prod
@lazySingleton
class NotificationActionCubit extends Cubit<NotificationActionState> {
  NotificationActionCubit(
    this._deleteNotification,
    this._markAllNotificationsRead,
    this._markNotificationRead,
  ) : super(const NotificationActionState());

  final DeleteNotification _deleteNotification;
  final MarkAllNotificationsRead _markAllNotificationsRead;
  final MarkNotificationRead _markNotificationRead;

  Future<void> markAllAsRead() async {
    emit(state.copyWith(
      status: NotificationActionStatus.loading,
      operationType: NotificationOperationType.markAllRead,
    ));

    final result = await _markAllNotificationsRead();
    result.fold(
      (failure) => emit(state.copyWith(
        status: NotificationActionStatus.error,
        message: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: NotificationActionStatus.success,
        message: 'All notifications marked as read',
      )),
    );
  }

  Future<void> markNotificationAsRead(String id) async {
    emit(state.copyWith(
      status: NotificationActionStatus.loading,
      operationType: NotificationOperationType.markSingleRead,
    ));

    final result = await _markNotificationRead(
      MarkNotificationReadParams(notificationIds: [id]),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: NotificationActionStatus.error,
        message: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: NotificationActionStatus.success,
        message: 'Notification marked as read',
      )),
    );
  }

  Future<void> deleteNotification({
    required String notificationId,
    required int notificationType,
  }) async {
    emit(state.copyWith(
      status: NotificationActionStatus.loading,
      operationType: NotificationOperationType.delete,
    ));

    final result = await _deleteNotification(
      DeleteNotificationParams(
        notificationId: notificationId,
        notificationType: notificationType,
      ),
    );
    result.fold(
      (failure) => emit(state.copyWith(
        status: NotificationActionStatus.error,
        message: failure.message,
      )),
      (_) => emit(state.copyWith(
        status: NotificationActionStatus.success,
        message: 'Notification deleted',
      )),
    );
  }

  void reset() => emit(const NotificationActionState());
}
