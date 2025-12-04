import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/notification/data/models/notification_model.dart';

abstract class INotificationRepository {
  ResultFuture<List<NotificationModel>> getNotifications({
    required int pageNumber,
    required int pageSize,
    int? notificationType,
    int? notificationDurationInDays,
  });

  ResultVoid markNotificationRead({
    required List<String> notificationIds,
  });

  ResultVoid markAllNotificationRead();

  ResultVoid deleteNotification({
    required String notificationId,
    required int notificationType,
  });
}
