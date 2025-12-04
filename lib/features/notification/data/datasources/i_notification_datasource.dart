import 'package:zheeta/features/notification/data/models/notification_model.dart';

abstract class INotificationDataSource {
  Future<List<NotificationModel>> getNotifications({
    required int pageNumber,
    required int pageSize,
    int? notificationType,
    int? notificationDurationInDays,
  });

  Future<void> deleteNotification({
    required String notificationId,
    required int notificationType,
  });

  Future<void> markAllNotificationsRead();

  Future<void> markNotificationRead({
    required List<String> notificationIds,
  });
}
