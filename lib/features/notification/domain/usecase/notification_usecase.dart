import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/usecase/usecases.dart';
import 'package:zheeta/features/notification/data/model/notification_model.dart';
import 'package:zheeta/features/notification/domain/repository/notification_repository.dart';

@prod
@LazySingleton()
class GetAllNotifications
    extends UsecaseWithParams<List<NotificationModel>, GetNotificationParams> {
  const GetAllNotifications(this._repo);

  final NotificationRepository _repo;

  @override
  ResultFuture<List<NotificationModel>> call(
          GetNotificationParams params) async =>
      await _repo.getNotifications(
        pageNumber: params.pageNo,
        pageSize: params.pageSize,
        notificationType: params.notificationType,
        notificationDurationInDays: params.notificationDurationInDays,
      );
}

@prod
@LazySingleton()
class DeleteNotification
    extends UsecaseWithParams<void, DeleteNotificationParams> {
  const DeleteNotification(this._repo);

  final NotificationRepository _repo;

  @override
  ResultFuture<void> call(DeleteNotificationParams params) async =>
      await _repo.deleteNotification(
          notificationId: params.notificationId,
          notificationType: params.notificationType);
}

@prod
@LazySingleton()
class MarkAllNotificationsRead extends UsecaseWithoutParams {
  const MarkAllNotificationsRead(this._repo);

  final NotificationRepository _repo;

  @override
  ResultFuture<void> call() async => await _repo.markAllNotificationRead();
}

@prod
@LazySingleton()
class MarkNotificationRead
    extends UsecaseWithParams<void, MarkNotificationReadParams> {
  const MarkNotificationRead(this._repo);

  final NotificationRepository _repo;

  @override
  ResultFuture<void> call(MarkNotificationReadParams params) async =>
      await _repo.markNotificationRead(notificationIds: params.notificationIds);
}

// Parameter classes
class DeleteNotificationParams {
  final String notificationId;
  final int notificationType;

  DeleteNotificationParams({
    required this.notificationId,
    required this.notificationType,
  });
}

class MarkNotificationReadParams {
  final List<String> notificationIds;

  MarkNotificationReadParams({required this.notificationIds});
}

class GetNotificationParams {
  final int pageNo;
  final int pageSize;
  final int? notificationType; // Optional notification type
  final int? notificationDurationInDays; // Optional notification duration

  GetNotificationParams({
    required this.pageNo,
    required this.pageSize,
    this.notificationType, // Make this parameter optional
    this.notificationDurationInDays, // Make this parameter optional
  });

  // Updated copyWith method to handle optional parameters
  copyWith({
    int? pageNo,
    int? pageSize,
    int? notificationType,
    int? notificationDurationInDays,
  }) {
    return GetNotificationParams(
      pageNo: pageNo ?? this.pageNo,
      pageSize: pageSize ?? this.pageSize,
      notificationType: notificationType ?? this.notificationType,
      notificationDurationInDays:
          notificationDurationInDays ?? this.notificationDurationInDays,
    );
  }
}
