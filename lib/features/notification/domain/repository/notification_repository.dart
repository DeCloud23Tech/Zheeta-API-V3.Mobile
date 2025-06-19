import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/features/notification/data/model/notification_model.dart';

abstract class NotificationRepository {
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
