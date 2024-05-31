import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';

abstract class NotificationUseCase {
  Future<NotificationListModel> getNotificationsUseCase({
    int? pageNumber,
    int? pageSize,
    required NotificationType notificationType,
    required NotificationDate notificationDurationInDays,
  });
  markNotificationUseCase({required List<String> notificationIds});
  markAllNotificationsReadUseCase();
}
