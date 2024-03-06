import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/notification/data/datasource/notification_datasource.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/domain/repository/notification_repository.dart';

@prod
@LazySingleton(as: NotificationRepository)
class NotificationRepositoryImpl implements NotificationRepository {
  final NotificationDataSource _datasource;
  NotificationRepositoryImpl(this._datasource);

  @override
  Future<NotificationListModel> getNotificationsRepo({
    int? pageNumber,
    int? pageSize,
    required NotificationType notificationType,
    required NotificationDate notificationDurationInDays,
  }) async {
    final result = await _datasource.getNotifications(
      pageNumber: pageNumber,
      pageSize: pageSize,
      notificationType: notificationType,
      notificationDurationInDays: notificationDurationInDays,
    );
    return result.fold(
      (error) => throw new Exception(error.message),
      (data) => NotificationListModel.fromJson(data),
    );
  }

  @override
  markAllNotificationsReadRepo() async {
    final result = await _datasource.markAllNotificationsRead();
    return result.fold(
      (error) => throw new Exception(error.message),
      (data) => data,
    );
  }

  @override
  markNotificationRepo({required List<String> notificationIds}) async {
    final result = await _datasource.markNotification(notificationIds: notificationIds);
    return result.fold(
      (error) => throw new Exception(error.message),
      (data) => data,
    );
  }
}
