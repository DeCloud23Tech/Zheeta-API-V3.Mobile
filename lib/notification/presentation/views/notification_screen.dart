import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/app/common/extensions/string_extension.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/presentation/widgets/notification_filter_bottomsheet.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/network_image.dart';

import '../bloc/notification_cubit.dart';

@RoutePage()
class NotificationScreen extends StatefulWidget {
  const NotificationScreen({super.key});

  @override
  _NotificationScreenState createState() => _NotificationScreenState();
}

class _NotificationScreenState extends State<NotificationScreen> {
  late NotificationCubit _notificationCubit;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _notificationCubit = context.read<NotificationCubit>();
    _notificationCubit.fetchNotifications();
    _scrollController.addListener(_onScroll);
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _saveScrollPosition();
      _notificationCubit.fetchNotifications();
    }
  }

  void _saveScrollPosition() {
    if (_scrollController.hasClients) {
      _notificationCubit.scrollPosition = _scrollController.position.pixels;
    }
  }

  void _restoreScrollPosition() {
    if (_scrollController.hasClients &&
        _notificationCubit.scrollPosition != null) {
      _scrollController.jumpTo(_notificationCubit.scrollPosition!);
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_onScroll);
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondaryLight,
        surfaceTintColor: AppColors.secondaryLight,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: const Text(
          'Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              // _notificationCubit.markAllNotificationsRead();
            },
            child:
                SvgPicture.asset('assets/images/icons/notification_tick.svg'),
          ),
          const SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              notificationFilterBottomSheet(context);
            },
            child: SvgPicture.asset('assets/images/icons/filter_mark.svg'),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: BlocBuilder<NotificationCubit, NotificationState>(
        builder: (context, state) {
          if (state is NotificationLoading) {
            return LoadingScreen(
              backgroundColor: AppColors.secondaryLight,
              indicatorColor: AppColors.primaryDark,
            );
          } else if (state is NotificationError) {
            return Center(
              child: Text('Error: ${state.errorMessage}'),
            );
          } else if (state is NotificationSuccess) {
            WidgetsBinding.instance.addPostFrameCallback((_) {
              _restoreScrollPosition();
            });

            final notifications = state.notifications;
            return Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                controller: _scrollController,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 40),
                    if (notifications.isEmpty)
                      const Center(
                        child: Text(
                          'No notifications yet',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      )
                    else
                      ...notifications.map((data) {
                        return NotificationCard(data: data);
                      }).toList(),
                    if (_notificationCubit.isFetching)
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: Center(
                          child: CircularProgressIndicator(
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ),
                  ],
                ),
              ),
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}

class NotificationCard extends StatelessWidget {
  final NotificationModel data;

  const NotificationCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (!data.isRead) {
          // context.read<NotificationCubit>().markNotificationAsRead(data.id);
        }
      },
      child: Container(
        color: Colors.transparent,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 40,
                      height: 40,
                      clipBehavior: Clip.hardEdge,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CustomNetworkImage(
                          imageUrl: data.userProfilePicUrl, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 14),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.content}',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${data.createdDate.toString().toDateTime}',
                            style: TextStyle(
                                fontSize: 10, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${data.notificationType?.name}',
                        style: TextStyle(
                            fontSize: 10, fontWeight: FontWeight.w400),
                      ),
                    ),
                    SizedBox(height: 10),
                    if (!data.isRead)
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
              ],
            ),
            SizedBox(height: 8),
            Divider(color: Color(0xffD9DBE9), thickness: 1, height: 1),
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
