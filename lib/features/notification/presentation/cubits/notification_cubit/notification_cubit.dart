import 'package:injectable/injectable.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/features/notification/data/models/notification_model.dart';
import 'package:zheeta/features/notification/domain/usecases/notification_usecase.dart';

part 'notification_state.dart';

@prod
@lazySingleton
class NotificationCubit
    extends PaginationCubit<NotificationModel, GetNotificationParams> {
  final GetAllNotifications _getAllNotifications;

  NotificationCubit(this._getAllNotifications)
      : super(
          fetchPage: (params) async {
            final result = await _getAllNotifications.call(params);
            return result.fold(
              (failure) => throw Exception(failure.message),
              (items) => items,
            );
          },
          baseParams: GetNotificationParams(pageNo: 1, pageSize: 25),
          pageSize: 25,
        );

  /// Set filter and reload list
  Future<void> setFilter(
      {int? notificationType, int? notificationDurationInDays}) async {
    final newParams = baseParams.copyWith(
      notificationType: notificationType,
      notificationDurationInDays: notificationDurationInDays,
      pageNo: 1,
    );
    await applyParams(newParams);
  }

  /// Clear filter and reload list
  Future<void> clearFilter() async {
    final newParams = baseParams.copyWith(
      notificationType: null,
      notificationDurationInDays: null,
      pageNo: 1,
    );
    await applyParams(newParams);
  }

  Future<void> resetNotifications() async {
    final params = GetNotificationParams(
      pageNo: 1,
      pageSize: pageSize,
      notificationType: null,
      notificationDurationInDays: null,
    );
    await applyParams(params);
  }
}
