import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart';
import 'package:zheeta/notification/presentation/state/notification_state.dart';

final notificationViewModelProvider = StateNotifierProvider<NotificationViewModel, NotificationState>((ref) {
  final _useCase = locator<NotificationUseCase>();
  return NotificationViewModel(_useCase);
});

class NotificationViewModel extends StateNotifier<NotificationState> {
  final NotificationUseCase _notificationUsecase;
  NotificationViewModel(this._notificationUsecase)
      : super(
          NotificationState(
            getNotificationsState: State.init(),
            markNotificationState: State.init(),
            markAllNotificationsReadState: State.init(),
            unreadNotificationsCountState: State.success(0),
            filterByCategoryState: State.success(NotificationType.all),
            filterByDateState: State.success(NotificationDate.all),
          ),
        );

  List<String> notificationIds = [];

  void setNotificationId(String id) {
    notificationIds.add(id);
  }

  setNotificationTypeFilter(NotificationType type) {
    state = state.updateFilterByCategoryState(type);
  }

  setNotificationDateFilter(NotificationDate date) {
    state = state.updateFilterByDateState(date);
  }

  Future<bool> getNotifications({bool loadState = true}) async {
    if (loadState) state = state.setGetNotificationsState(State.loading());
    try {
      final notificationType = state.filterByCategoryState.data!;
      final notificationDate = state.filterByDateState.data!;
      final result = await _notificationUsecase.getNotificationsUseCase(
        notificationType: notificationType,
        notificationDurationInDays: notificationDate,
      );
      state = state.setGetNotificationsState(State.success(result));
      state = state.updateUnreadNotificationCountState(); // Update unread notification count state.
      return true;
    } on Exception catch (e) {
      state = state.setGetNotificationsState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> markNotificationAsRead() async {
    state = state.setMarkNotificationState(State.loading());
    try {
      state = state.markNotificationReadState(notificationIds: notificationIds);
      notificationIds = [];
      final result = await _notificationUsecase.markNotificationUseCase(notificationIds: notificationIds);
      state = state.setMarkNotificationState(State.success(result));
      state = state.updateUnreadNotificationCountState();
      NotifyUser.showSnackbar('Notifications marked as read');
      return true;
    } on Exception catch (e) {
      state = state.setMarkNotificationState(State.error(e));
      NotifyUser.showSnackbar('Couldn\'t mark notifications as read');
      return false;
    }
  }

  Future<bool> markAllNotificationsRead() async {
    state = state.setMarkAllNotificationsReadState(State.loading());
    try {
      state = state.markAllNotificationsAsReadState();
      final result = await _notificationUsecase.markAllNotificationsReadUseCase();
      state = state.setMarkAllNotificationsReadState(State.success(result));
      state = state.updateUnreadNotificationCountState();
      NotifyUser.showSnackbar('All notifications marked as read');
      return true;
    } on Exception catch (e) {
      state = state.setMarkAllNotificationsReadState(State.error(e));
      NotifyUser.showSnackbar('Couldn\'t mark notifications as read');
      return false;
    }
  }

  @override
  void dispose() {
    notificationIds.clear();
    super.dispose();
  }
}
