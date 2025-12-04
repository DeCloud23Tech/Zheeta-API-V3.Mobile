import 'package:flutter/material.dart';
import 'package:zheeta/core/utils/extensions/string_extension.dart';
import 'package:zheeta/core/utils/notification_utils.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

Future<int?> notificationFilterBottomSheet(BuildContext context,
    {int? selectedType}) {
  return showModalBottomSheet<int?>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints:
        BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.47),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return NotificationFilterBottomSheetView(selectedType: selectedType);
    },
  );
}

class NotificationFilterBottomSheetView extends StatefulWidget {
  final int? selectedType;

  const NotificationFilterBottomSheetView({super.key, this.selectedType});

  @override
  State<NotificationFilterBottomSheetView> createState() =>
      _NotificationFilterBottomSheetViewState();
}

class _NotificationFilterBottomSheetViewState
    extends State<NotificationFilterBottomSheetView> {
  NotificationType? _activeNotificationType;
  int? notificationType;

  @override
  void initState() {
    super.initState();
    if (widget.selectedType != null) {
      _activeNotificationType = NotificationType.values.firstWhere(
        (t) => t.value == widget.selectedType,
        orElse: () => NotificationType.activityPost, // fallback if invalid
      );
      notificationType = widget.selectedType;
    }
  }

  @override
  Widget build(BuildContext context) {
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
                AppBackButton(
                  onTap: () => Navigator.pop(context),
                ),
                Text(
                  'Notification Filter',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                SizedBox(width: 40, height: 40),
                // Placeholder for alignment
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Categories',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
            SizedBox(height: 10),
            Wrap(
              spacing: 10,
              runSpacing: 14,
              children: NotificationType.values.map((type) {
                return NotificationFilterChip(
                  text: type.name,
                  active: _activeNotificationType == type,
                  color: getNotificationColor(type.label),
                  onTap: () {
                    setState(() {
                      _activeNotificationType = type;
                      notificationType = type.value;
                    });
                    // Print the case value using the extension
                    print('Selected case value: ${type.value}');
                  },
                );
              }).toList(),
            ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                action: () {
                  // Pop the bottom sheet and return the selected notification type
                  Navigator.pop(context, notificationType);
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
  final Color color;

  const NotificationFilterChip({
    super.key,
    required this.text,
    this.onTap,
    required this.active,
    required this.color,
  });

  Color _getTextColor(Color bg) {
    // Compute brightness to decide text color automatically
    return ThemeData.estimateBrightnessForColor(bg) == Brightness.dark
        ? Colors.white
        : Colors.black;
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor = active ? color : color.withValues(alpha: 0.15);
    final textColor = _getTextColor(backgroundColor);

    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 7),
        decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(5),
          border:
              active ? null : Border.all(color: color.withValues(alpha: 0.5)),
        ),
        child: Text(
          text.capitalizeFirstOfEach,
          style: TextStyle(
            color: textColor,
            fontWeight: FontWeight.w500,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
