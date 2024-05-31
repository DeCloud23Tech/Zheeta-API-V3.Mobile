import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/app/common/extensions/string_extension.dart';
import 'package:zheeta/notification/data/model/notification_model.dart';
import 'package:zheeta/notification/presentation/viewmodel/notification_viewmodel.dart';
import 'package:zheeta/notification/presentation/widgets/notification_filter_bottomsheet.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/network_image.dart';

@RoutePage()
class NotificationScreen extends ConsumerStatefulWidget {
  const NotificationScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationScreenState();
}

class _NotificationScreenState extends ConsumerState<NotificationScreen> {
  late NotificationViewModel notificationViewModel;

  @override
  void initState() {
    notificationViewModel = ref.read(notificationViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationViewModelProvider);
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
        title: Text(
          'Notifications',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              notificationViewModel.markAllNotificationsRead();
            },
            child: SvgPicture.asset('assets/images/icons/notification_tick.svg'),
          ),
          SizedBox(width: 24),
          GestureDetector(
            onTap: () {
              notificationFilterBottomSheet(context);
            },
            child: SvgPicture.asset('assets/images/icons/filter_mark.svg'),
          ),
          SizedBox(width: 16),
        ],
      ),
      body: notificationState.getNotificationsState.isLoading
          ? LoadingScreen(backgroundColor: AppColors.secondaryLight, indicatorColor: AppColors.primaryDark)
          : Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    if (notificationState.getNotificationsState.data?.data?.isEmpty ?? true)
                      Center(
                        child: Text(
                          'No notifications yet',
                          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      )
                    else
                      ...notificationState.getNotificationsState.data?.data?.map((data) {
                            return NotificationCard(data: data);
                          }).toList() ??
                          [],
                  ],
                ),
              ),
            ),
    );
  }
}

class NotificationCard extends ConsumerWidget {
  final NotificationModel data;
  NotificationCard({super.key, required this.data});

  final Map<NotificationType, Color> colorMap = {
    NotificationType.receiveFriendRequest: Color(0xff8FF187),
    NotificationType.activityComment: Color(0xffFFFFFF),
    NotificationType.activityLike: Color(0xffFFFFFF),
    NotificationType.activityPost: Color(0xffFFFFFF),
    NotificationType.activityPayment: AppColors.primaryLight,
    NotificationType.comeBack: Colors.lightBlue,
    NotificationType.communityPost: Colors.purple.shade200,
    NotificationType.receiveGift: Color(0xff8DBBFF),
    NotificationType.receiveMoney: Color(0xffFBFF4F),
    NotificationType.referralRegistration: Color(0xffFFC9C9),
    NotificationType.sharedActivityPost: Color(0xffFF8960),
    NotificationType.transaction: Color(0xffFAA1D1),
  };

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notificationViewModel = ref.read(notificationViewModelProvider.notifier);
    return GestureDetector(
      onTap: () {
        if (!data.isRead) {
          notificationViewModel.setNotificationId(data.id);
          notificationViewModel.markNotificationAsRead();
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
                      child: CustomNetworkImage(imageUrl: data.userProfilePicUrl, fit: BoxFit.cover),
                    ),
                    SizedBox(width: 14),
                    SizedBox(
                      width: MediaQuery.of(context).size.width * 0.55,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            '${data.content}',
                            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                          ),
                          SizedBox(height: 4),
                          Text(
                            '${data.createdDate.toString().toDateTime}',
                            style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
                        color: colorMap[data.notificationType],
                        borderRadius: BorderRadius.circular(5),
                      ),
                      child: Text(
                        '${data.notificationType?.name}',
                        style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
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
