import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';

abstract class NotificationRepository {
  Future<NotificationListModel> getNotificationsRepo({
    int? pageNumber,
    int? pageSize,
    required NotificationType notificationType,
    required NotificationDate notificationDurationInDays,
  });
  markNotificationRepo({required List<String> notificationIds});
  markAllNotificationsReadRepo();
}
