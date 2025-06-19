import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/notification/data/model/notification_model.dart';
import 'package:zheeta/features/notification/domain/usecase/notification_usecase.dart';
import 'package:zheeta/features/notification/presentation/bloc/notification_cubit.dart';
import 'package:zheeta/features/notification/presentation/utils/notification_utils.dart';
import 'package:zheeta/features/notification/presentation/widgets/notification_filter_bottomsheet.dart';
import 'package:zheeta/utils/pagination_controller.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/network_image.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
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
          notificationType: _selectedNotificationType,
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
        leading: const AppBackButton(),
        title: const Text(
          'Notifications',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
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
              final selectedType = await notificationFilterBottomSheet(context);
              if (selectedType != null) {
                setState(() {
                  _selectedNotificationType = selectedType;
                });
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
            if (state is NotificationLoading &&
                _notificationPaginatedController.items.isEmpty) {
              return loadingIndicator();
            } else if (state is NotificationLoaded &&
                _notificationPaginatedController.items.isEmpty) {
              return const Center(
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
                        _notificationPaginatedController.reset();
                      },
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            return ListView.builder(
              shrinkWrap: true,
              physics: const AlwaysScrollableScrollPhysics(),
              controller: _scrollController,
              itemCount: _notificationPaginatedController.items.length + 1,
              itemBuilder: (context, index) {
                if (index == _notificationPaginatedController.items.length) {
                  return _notificationPaginatedController.hasMoreItems
                      ? loadingIndicator()
                      : const SizedBox.shrink();
                }

                final notification =
                    _notificationPaginatedController.items[index];
                return _buildNotificationItem(notification);
              },
            );
          },
        ),
      ),
    );
  }

  Widget _buildNotificationItem(NotificationModel notification) {
    return InkWell(
      onTap: !notification.isRead
          ? () {
              notificationCubit.markNotificationsReadCubit(
                MarkNotificationReadParams(notificationIds: [notification.id]),
              );
            }
          : null,
      child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        ListTile(
          contentPadding: EdgeInsets.zero, // Remove default padding
          leading: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
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
            ],
          ),
          title: Text(
            notification.content,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
            maxLines: 3, // Reduced maxLines to prevent overflow
            overflow: TextOverflow.ellipsis, // Add ellipsis for overflow
          ),
          subtitle: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Text(
              DateFormat('d MMM \'at\' HH:mm')
                  .format(notification.createdDate ?? DateTime.now()),
              style: const TextStyle(
                color: AppColors.grey,
                fontSize: 12,
              ),
            ),
          ),
          trailing: Column(
            mainAxisAlignment: MainAxisAlignment.start, // Center the trailing content
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                decoration: BoxDecoration(
                  color: getNotificationColor(notification.notificationType ?? ''),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: Text(
                  '${notification.notificationType}',
                  style: const TextStyle(
                    fontSize: 10,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              if (!notification.isRead)
                Container(
                  width: 8,
                  height: 8,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color: AppColors.red,
                  ),
                ),
            ],
          ),
        ),
        Divider(
          color: AppColors.grayscale.withOpacity(0.15),
          thickness: 1.5,
          height: 1,
        ),
      ],
    ),
    );
  }
}
