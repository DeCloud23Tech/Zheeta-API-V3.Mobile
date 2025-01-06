import 'package:zheeta/notification/data/model/notification_model.dart';
import '../../../app/common/type_def.dart';

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
