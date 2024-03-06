import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';

part 'notification_state.freezed.dart';

@freezed
class NotificationState with _$NotificationState {
  factory NotificationState({
    required State<NotificationListModel> getNotificationsState,
    required State markNotificationState,
    required State markAllNotificationsReadState,
    required State<int> unreadNotificationsCountState,
    required State<NotificationType> filterByCategoryState,
    required State<NotificationDate> filterByDateState,
  }) = _NotificationState;

  NotificationState._();

  NotificationState setGetNotificationsState(State<NotificationListModel> state) => copyWith(getNotificationsState: state);
  NotificationState setMarkNotificationState(State state) => copyWith(markNotificationState: state);
  NotificationState setMarkAllNotificationsReadState(State state) => copyWith(markAllNotificationsReadState: state);

  NotificationState markAllNotificationsAsReadState() {
    return copyWith(
      getNotificationsState: State.success(
        NotificationListModel(
          data: getNotificationsState.data?.data?.map((e) => e.copyWith(isRead: true)).toList(),
        ),
      ),
    );
  }

  NotificationState markNotificationReadState({required List<String> notificationIds}) {
    return copyWith(
      getNotificationsState: State.success(
        NotificationListModel(
          data: getNotificationsState.data?.data
              ?.map(
                (e) => notificationIds.contains(e.id) ? e.copyWith(isRead: true) : e,
              )
              .toList(),
        ),
      ),
    );
  }

  NotificationState updateUnreadNotificationCountState() {
    return copyWith(
      unreadNotificationsCountState: State.success(getNotificationsState.data?.data?.where((element) => !element.isRead).toList().length ?? 0),
    );
  }

  NotificationState updateFilterByCategoryState(NotificationType notificationType) {
    return copyWith(filterByCategoryState: State.success(notificationType));
  }

  NotificationState updateFilterByDateState(NotificationDate notificationDate) {
    return copyWith(filterByDateState: State.success(notificationDate));
  }
}
