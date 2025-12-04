import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/utils/pagination_controller.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/notification/data/models/notification_model.dart';
import 'package:zheeta/features/notification/presentation/cubits/notification_action_cubit/notification_action_cubit.dart';
import 'package:zheeta/features/notification/presentation/cubits/notification_cubit/notification_cubit.dart';
import 'package:zheeta/core/utils/notification_utils.dart';
import 'package:zheeta/shared/bottom_sheets/notification_filter_bottomsheet.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/loader.dart';
import 'package:zheeta/shared/widgets/network_image.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  NotificationScreenState createState() => NotificationScreenState();
}

class NotificationScreenState extends State<NotificationScreen> {
  final NotificationCubit notificationCubit = locator<NotificationCubit>();
  final NotificationActionCubit notificationActionCubit =
      locator<NotificationActionCubit>();
  final ScrollController _scrollController = ScrollController();
  int? _selectedNotificationType;

  @override
  void initState() {
    super.initState();
    notificationCubit.resetNotifications();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_isBottom) notificationCubit.loadNextPage();
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.position.pixels;
    return currentScroll >= (maxScroll * 0.9);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> _filterNotifications(BuildContext context) async {
    final selectedType = await notificationFilterBottomSheet(
      context,
      selectedType: _selectedNotificationType,
    );
    if (selectedType != null) {
      setState(() => _selectedNotificationType = selectedType);
      await notificationCubit.setFilter(notificationType: selectedType);
    }
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
            onTap: () => notificationActionCubit.markAllAsRead(),
            child:
                SvgPicture.asset('assets/images/icons/notification_tick.svg'),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () => _filterNotifications(context),
            child: SvgPicture.asset('assets/images/icons/filter_mark.svg'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: MultiBlocListener(
        listeners: [
          BlocListener<NotificationActionCubit, NotificationActionState>(
            bloc: notificationActionCubit,
            listener: (context, actionState) {
              if (actionState.status == NotificationActionStatus.success) {
                notificationCubit.reset(); // refresh list after any action
              }
            },
          ),
        ],
        child:
            BlocBuilder<NotificationCubit, PaginationState<NotificationModel>>(
          bloc: notificationCubit,
          builder: (context, state) {
            if (state.isLoading && state.items.isEmpty) {
              return loadingIndicator();
            }
            if (state.error != null && state.items.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: AppColors.red, size: 50),
                    const SizedBox(height: 16),
                    const Text(
                      'An error occurred while loading notifications.',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w500,
                        color: AppColors.primaryDark,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ElevatedButton(
                      onPressed: notificationCubit.reset,
                      child: const Text('Retry'),
                    ),
                  ],
                ),
              );
            }
            if (state.items.isEmpty) {
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
            }

            return ListView.builder(
              controller: _scrollController,
              itemCount: state.items.length + (state.hasMore ? 1 : 0),
              itemBuilder: (context, index) {
                if (index == state.items.length) {
                  return loadingIndicator();
                }
                final notification = state.items[index];
                return Dismissible(
                  key: ValueKey(notification.id),
                  direction: DismissDirection.endToStart,
                  // swipe left to delete
                  background: Container(
                    alignment: Alignment.centerRight,
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    color: AppColors.red,
                    child: const Icon(Icons.delete, color: Colors.white),
                  ),
                  confirmDismiss: (direction) async {
                    // Optionally show a confirmation dialog
                    return await showDialog<bool>(
                          context: context,
                          builder: (ctx) => AlertDialog(
                            title: const Text('Delete notification'),
                            content: const Text(
                                'Are you sure you want to delete this notification?'),
                            actions: [
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(false),
                                child: const Text('Cancel'),
                              ),
                              TextButton(
                                onPressed: () => Navigator.of(ctx).pop(true),
                                child: const Text('Delete'),
                              ),
                            ],
                          ),
                        ) ??
                        false;
                  },
                  onDismissed: (_) {
                    final typeInt =
                        mapTypeStringToInt(notification.notificationType ?? '');
                    notificationActionCubit.deleteNotification(
                      notificationId: notification.id,
                      notificationType: typeInt!,
                    );
                  },

                  child: _buildNotificationItem(notification),
                );
              },
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
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
              notificationActionCubit.markNotificationAsRead(notification.id);
            }
          : null,
      child: Column(
        children: [
          ListTile(
            contentPadding: EdgeInsets.zero,
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
              style: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
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
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                  decoration: BoxDecoration(
                    color: getNotificationColor(
                        notification.notificationType ?? ''),
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
            color: AppColors.grayscale.withValues(alpha: 0.15),
            thickness: 1.5,
            height: 1,
          ),
        ],
      ),
    );
  }
}
