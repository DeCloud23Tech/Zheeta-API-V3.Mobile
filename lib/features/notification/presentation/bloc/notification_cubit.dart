import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/features/notification/data/model/notification_model.dart';
import 'package:zheeta/features/notification/domain/usecase/notification_usecase.dart';

part 'notification_state.dart';

@prod
@LazySingleton()
class NotificationCubit extends Cubit<NotificationState> {
  final GetAllNotifications getAllNotifications;
  final DeleteNotification deleteNotification;
  final MarkNotificationRead markNotificationRead;
  final MarkAllNotificationsRead markAllNotificationsRead;

  NotificationCubit({
    required this.getAllNotifications,
    required this.deleteNotification,
    required this.markNotificationRead,
    required this.markAllNotificationsRead,
  }) : super(NotificationInitial());

  // Fetch notifications with pagination
  Future<void> fetchNotificationsCubit(GetNotificationParams request) async {
    emit(NotificationLoading());
    final result = await getAllNotifications(request);
    result.fold(
      (failure) {
        emit(NotificationError(failure.message));
      },
      (notifications) {
        emit(NotificationLoaded(notifications: notifications));
      },
    );
  }

  // Delete a notification
  Future<void> removeNotificationCubit(DeleteNotificationParams params) async {
    emit(NotificationLoading());

    final result = await deleteNotification(params);

    result.fold(
      (failure) {
        emit(NotificationError(failure.message));
      },
      (_) {
        emit(NotificationDeleted());
      },
    );
  }

  // Mark specific notifications as read
  Future<void> markNotificationsReadCubit(
      MarkNotificationReadParams params) async {
    // emit(NotificationLoading());
    final result = await markNotificationRead(params);
    result.fold(
      (failure) {
        emit(NotificationError(failure.message));
      },
      (_) {
        emit(NotificationMarkedRead());
      },
    );
  }

  // Mark all notifications as read
  Future<void> markAllNotificationsAsReadCubit() async {
    emit(NotificationLoading());
    final result = await markAllNotificationsRead();

    result.fold(
      (failure) {
        emit(NotificationError(failure.message));
      },
      (_) {
        emit(NotificationAllMarkedRead());
      },
    );
  }
}
