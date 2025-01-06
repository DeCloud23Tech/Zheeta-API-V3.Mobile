import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/pagination_controller.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/domain/usecase/notification_usecase.dart';
import 'package:zheeta/notification/presentation/bloc/notification_cubit.dart';
import 'package:zheeta/notification/presentation/utils/notification_utils.dart';
import 'package:zheeta/notification/presentation/widgets/notification_filter_bottomsheet.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/network_image.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late PaginatedListController<NotificationModel, NotificationCubit,
      NotificationState> _notificationPaginatedController;

  final ScrollController _scrollController = ScrollController();
  final NotificationCubit notificationCubit = locator<NotificationCubit>();

  int? _selectedNotificationType; // Store the selected notification type

  @override
  void initState() {
    super.initState();

    // Initialize paginated controller
    _notificationPaginatedController = PaginatedListController<
        NotificationModel, NotificationCubit, NotificationState>(
      fetchItems: (param) => notificationCubit.fetchNotificationsCubit(
        GetNotificationParams(
          pageNo: param.pageNo,
          pageSize: param.pageSize,
          notificationType:
              _selectedNotificationType, // Use the selected notification type
        ),
      ),
      cubit: notificationCubit,
    );

    // Add scroll listener to load more items when reaching the bottom
    _scrollController.addListener(_scrollListener);

    // Load the initial page of notifications
    _loadNotificationsPage();
  }

  void _loadNotificationsPage() {
    // Load the next page of notifications
    _notificationPaginatedController.loadNextPage(
      successCondition: (state) => state is NotificationLoaded,
      extractItems: (state) => (state as NotificationLoaded).notifications,
      isError: (state) => state is NotificationError,
    );
  }

  void _scrollListener() {
    if (_isBottom) {
      _loadNotificationsPage();
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >=
        (maxScroll * 0.9); // Trigger loading when 90% scrolled
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),

        title: Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
        actions: [
          GestureDetector(
            onTap: () {
              notificationCubit.markAllNotificationsAsReadCubit();
            },
            child:
                SvgPicture.asset('assets/images/icons/notification_tick.svg'),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () async {
              // Wait for the bottom sheet to close and get the selected notification type
              final selectedType = await notificationFilterBottomSheet(context);
              if (selectedType != null) {
                setState(() {
                  _selectedNotificationType =
                      selectedType; // Update the selected notification type
                });
                // Reload notifications with the selected type
                _notificationPaginatedController.reset();
                _loadNotificationsPage();
              }
            },
            child: SvgPicture.asset('assets/images/icons/filter_mark.svg'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<NotificationCubit, NotificationState>(
          listener: (context, state) {
            if (state is NotificationMarkedRead) {
              _notificationPaginatedController.reset();
              _loadNotificationsPage();
            }
          },
          builder: (context, state) {
            // Check if notifications are loading and if the list is empty
            if (state is NotificationLoading &&
                _notificationPaginatedController.items.isEmpty) {
              return LoadingIndicator();
            } else if (state is NotificationLoaded &&
                _notificationPaginatedController.items.isEmpty) {
              return Center(
                child: Text(
                  'No notifications found.',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                    color: AppColors.primaryDark,
                  ),
                ),
              );
            } else if (state is NotificationError) {
              // Display error screen if there's an error
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: AppColors.red, size: 50),
                    const SizedBox(height: 16),
                    Text(
                      'An error occurred while loading notifications.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: () {
                        // Retry loading notifications
                        // _notificationPaginatedController.refresh();
                        // notificationCubit.getNotifications();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            // If no error or loading state, show the notification list
            return ListView.builder(
              shrinkWrap: true,
              physics: AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: _notificationPaginatedController.items.length + 1,
              itemBuilder: (context, index) {
                if (index == _notificationPaginatedController.items.length) {
                  return _notificationPaginatedController.hasMoreItems &&
                      (_notificationPaginatedController.items.length >=
                          _notificationPaginatedController.pageSize)
                      ? LoadingIndicator()
                      : const SizedBox.shrink();
                }

                // Render each notification item
                final notification = _notificationPaginatedController.items[index];
                return InkWell(
                  onTap: !notification.isRead
                      ? () {
                    notificationCubit.markNotificationsReadCubit(
                        MarkNotificationReadParams(
                            notificationIds: [notification.id]));
                  }
                      : null,
                  child: Column(
                    children: [
                      ListTile(
                        contentPadding: EdgeInsets.symmetric(vertical: 6),
                        leading: Container(
                          width: 40,
                          height: 40,
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: CustomNetworkImage(
                            imageUrl: notification.userProfilePicUrl,
                            fit: BoxFit.cover,
                          ),
                        ),
                        title: Text(
                          notification.content,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        subtitle: Text(
                          DateFormat('d MMM \'at\' HH:mm').format(
                              notification.createdDate ?? DateTime.now()),
                          style: TextStyle(
                            color: AppColors.grey,
                            fontSize: 14,
                          ),
                        ),
                        trailing: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Container(
                              padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                              decoration: BoxDecoration(
                                color: getNotificationColor(
                                    notification.notificationType ?? ''),
                                borderRadius: BorderRadius.circular(5),
                              ),
                              child: Text(
                                '${notification.notificationType}',
                                style: TextStyle(
                                    fontSize: 10, fontWeight: FontWeight.w500),
                              ),
                            ),
                            SizedBox(height: 10),
                            if (!notification.isRead)
                              Container(
                                width: 8,
                                height: 8,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(100),
                                  color: AppColors.red,
                                ),
                              )
                          ],
                        ),
                      ),
                      Divider(
                          color: AppColors.grayscale.withOpacity(0.15),
                          thickness: 1.5,
                          height: 1),
                    ],
                  ),
                );
              },
            );
          },

        ),
      ),
    );
  }
}
