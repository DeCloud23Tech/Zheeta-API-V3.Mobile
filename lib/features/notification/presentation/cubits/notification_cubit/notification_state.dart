part of 'notification_cubit.dart';

class NotificationState extends PaginationState<NotificationModel> {
  final int? activeNotificationType;

  NotificationState({
    required super.items,
    required super.currentPage,
    required super.isLoading,
    required super.hasMore,
    super.error,
    this.activeNotificationType,
  });

  factory NotificationState.initial() {
    return NotificationState(
      items: [],
      currentPage: 1,
      isLoading: false,
      hasMore: true,
      error: null,
      activeNotificationType: null,
    );
  }

  @override
  NotificationState copyWith({
    List<NotificationModel>? items,
    int? currentPage,
    bool? isLoading,
    bool? hasMore,
    String? error,
    int? activeNotificationType,
  }) {
    return NotificationState(
      items: items ?? this.items,
      currentPage: currentPage ?? this.currentPage,
      isLoading: isLoading ?? this.isLoading,
      hasMore: hasMore ?? this.hasMore,
      error: error,
      activeNotificationType:
          activeNotificationType ?? this.activeNotificationType,
    );
  }
}
