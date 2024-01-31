import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/domain/repository/notification_repository.dart';
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart';

@prod
@LazySingleton(as: NotificationUseCase)
class NotificationUseCaseImpl implements NotificationUseCase {
  NotificationRepository _repository;
  NotificationUseCaseImpl(this._repository);

  @override
  Future<NotificationListModel> getNotificationsUseCase({
    int? pageNumber,
    int? pageSize,
    required NotificationType notificationType,
    required NotificationDate notificationDurationInDays,
  }) {
    return _repository.getNotificationsRepo(
      pageNumber: pageNumber,
      pageSize: pageSize,
      notificationType: notificationType,
      notificationDurationInDays: notificationDurationInDays,
    );
  }

  @override
  markAllNotificationsReadUseCase() {
    _repository.markAllNotificationsReadRepo();
  }

  @override
  markNotificationUseCase({required List<String> notificationIds}) {
    _repository.markNotificationRepo(notificationIds: notificationIds);
  }
}
