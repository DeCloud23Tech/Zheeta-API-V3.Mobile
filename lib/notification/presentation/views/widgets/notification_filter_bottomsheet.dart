import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/close_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

Future notificationFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.47),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return NotificationFilterBottomSheetView();
    },
  );
}

class NotificationFilterBottomSheetView extends ConsumerWidget {
  NotificationFilterBottomSheetView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Container(
      padding: EdgeInsets.all(20),
      decoration: const BoxDecoration(
        color: Color(0xffFFF1F7),
        borderRadius: BorderRadius.only(topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(2), color: Color(0xffDADADA)),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                AppCloseButton(),
                Text(
                  'Notification filter',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
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
                NotificationFilterChip(
                  text: 'Friend request',
                  active: true,
                ),
                NotificationFilterChip(
                  text: 'Activity',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Gift',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Post',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Transaction',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Shared Post',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Community',
                  active: false,
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Date',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                NotificationFilterChip(
                  text: 'Last hour',
                  active: true,
                ),
                NotificationFilterChip(
                  text: 'Today',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Last 7 days',
                  active: false,
                ),
                NotificationFilterChip(
                  text: 'Last 30 days',
                  active: false,
                ),
              ],
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                action: () {
                  router.pop();
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class NotificationFilterChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool active;

  const NotificationFilterChip({super.key, required this.text, this.onTap, required this.active});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: active ? Color(0xff4E4B66) : Color(0xffF7F7FC),
          borderRadius: BorderRadius.circular(5),
          border: active ? null : Border.all(color: Color(0xffD9DBE9)),
        ),
        child: Text(
          text,
          style: TextStyle(color: active ? Colors.white : Color(0xffA0A3BD), fontWeight: FontWeight.w400, fontSize: 12),
        ),
      ),
    );
  }
}
