import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/enums/notification_filter.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/notification/presentation/view_model/notification_viewmodel.dart';
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

class NotificationFilterBottomSheetView extends ConsumerStatefulWidget {
  const NotificationFilterBottomSheetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _NotificationFilterBottomSheetViewState();
}

class _NotificationFilterBottomSheetViewState extends ConsumerState<NotificationFilterBottomSheetView> {
  late NotificationViewModel notificiationViewModel;
  final _isLoading = StateProvider((ref) => false);

  @override
  void initState() {
    notificiationViewModel = ref.read(notificationViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final notificationState = ref.watch(notificationViewModelProvider);
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
              children: NotificationType.values.map((type) {
                return NotificationFilterChip(
                  text: type.name,
                  active: notificationState.filterByCategoryState.data == type,
                  onTap: () {
                    notificiationViewModel.setNotificationTypeFilter(type);
                  },
                );
              }).toList(),
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
              children: NotificationDate.values.map((date) {
                return NotificationFilterChip(
                  text: date.name,
                  active: notificationState.filterByDateState.data == date,
                  onTap: () {
                    notificiationViewModel.setNotificationDateFilter(date);
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                state: ref.watch(_isLoading),
                action: () async {
                  ref.read(_isLoading.notifier).state = true;
                  await notificiationViewModel.getNotifications(loadState: false);
                  ref.read(_isLoading.notifier).state = false;
                  router.pop();
                },
              ),
            ),
            SizedBox(height: 10),
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
