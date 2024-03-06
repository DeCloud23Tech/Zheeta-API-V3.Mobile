import 'package:dartz/dartz.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class NotificationDataSource {
  Future<Either<ErrorResponse, MappedResponse>> getNotifications({
    int? pageNumber,
    int? pageSize,
    required NotificationType notificationType,
    required NotificationDate notificationDurationInDays,
  });
  Future<Either<ErrorResponse, MappedResponse>> markNotification({required List<String> notificationIds});
  Future<Either<ErrorResponse, MappedResponse>> markAllNotificationsRead();
}
