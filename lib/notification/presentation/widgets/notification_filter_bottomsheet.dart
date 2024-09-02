import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/widgets/close_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../bloc/notification_cubit.dart';

Future notificationFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints:
        BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.47),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return NotificationFilterBottomSheetView();
    },
  );
}

class NotificationFilterBottomSheetView extends StatelessWidget {
  const NotificationFilterBottomSheetView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NotificationCubit, NotificationState>(
      builder: (context, state) {
        final notificationCubit = context.read<NotificationCubit>();

        return Container(
          padding: EdgeInsets.all(20),
          decoration: const BoxDecoration(
            color: Color(0xffFFF1F7),
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight: Radius.circular(15),
            ),
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                    width: 50,
                    height: 4,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2),
                      color: Color(0xffDADADA),
                    ),
                  ),
                ),
                SizedBox(height: 8),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppCloseButton(),
                    Text(
                      'Notification filter',
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(width: 40, height: 40),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Categories',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Wrap(
                  spacing: 8,
                  runSpacing: 8,
                  children: [
                    for (var type in NotificationType.values)
                      if (type != NotificationType.activityPost &&
                          type != NotificationType.activityComment &&
                          type != NotificationType.activityLike &&
                          type != NotificationType.activity)
                        // NotificationFilterChip(
                        //   text: type.name,
                        //   active: notificationCubit.state.filterByCategoryState.data == type,
                        //   color: type.color,
                        //   onTap: () {
                        //     notificationCubit.setNotificationTypeFilter(type);
                        //   },
                        // ),
                        // NotificationFilterChip(
                        //   text: 'Activity',
                        //   active: [
                        //     NotificationType.activityPost,
                        //     NotificationType.activityComment,
                        //     NotificationType.activityLike,
                        //     NotificationType.activity
                        //   ].contains(notificationCubit.state.filterByCategoryState.data),
                        //   color: Colors.white, // Define color for Activity group
                        //   onTap: () {
                        //     // notificationCubit.setNotificationTypeFilter(NotificationType.activity);
                        //   },
                        // ),
                        Placeholder()
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  'Date',
                  style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                // Wrap(
                //   spacing: 8,
                //   runSpacing: 8,
                //   children: NotificationDate.values.map((date) {
                //     return NotificationFilterChip(
                //       text: date.name,
                //       active: notificationCubit.state.filterByDateState.data == date,
                //       color: Colors.grey,
                //       onTap: () {
                //         notificationCubit.setNotificationDateFilter(date);
                //       },
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 60),
                // SizedBox(
                //   width: double.infinity,
                //   child: PrimaryButton(
                //     title: 'Apply',
                //     state: context.watch<NotificationCubit>().state.isLoading,
                //     action: () async {
                //       context.read<NotificationCubit>().setLoadingState(true);
                //       await notificationCubit.fetchNotifications(isRefresh: true);
                //       context.read<NotificationCubit>().setLoadingState(false);
                //       Navigator.pop(context);
                //     },
                //   ),
                // ),
                SizedBox(height: 10),
              ],
            ),
          ),
        );
      },
    );
  }
}

class NotificationFilterChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool active;
  final Color color;

  const NotificationFilterChip(
      {super.key,
      required this.text,
      this.onTap,
      required this.active,
      required this.color});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: active ? color : Color(0xffF7F7FC),
          borderRadius: BorderRadius.circular(5),
          border: active ? null : Border.all(color: Color(0xffD9DBE9)),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: active ? Colors.black : Color(0xffA0A3BD),
            fontWeight: FontWeight.w400,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
