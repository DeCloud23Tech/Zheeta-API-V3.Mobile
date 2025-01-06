import 'package:flutter/material.dart';
import 'package:zheeta/widgets/close_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

Future<int?> eventFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet<int?>(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints:
    BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.47),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return EventFilterBottomSheetView();
    },
  );
}

class EventFilterBottomSheetView extends StatefulWidget {
  const EventFilterBottomSheetView({super.key});

  @override
  State<EventFilterBottomSheetView> createState() =>
      _EventFilterBottomSheetViewState();
}

class _EventFilterBottomSheetViewState
    extends State<EventFilterBottomSheetView> {
  // EventType? _activeEventType;
  int? eventType;

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
                AppCloseButton(
                  onTap: () => Navigator.pop(context),
                ),
                Text(
                  'Event Filter',
                  style: TextStyle(
                    fontSize: 24,
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
            // Wrap(
            //   spacing: 10,
            //   runSpacing: 14,
            //   children: EventType.values.map((type) {
            //     return EventFilterChip(
            //       text: type.name,
            //       active: _activeEventType == type,
            //       color: getEventColor(type.name),
            //       onTap: () {
            //         setState(() {
            //           _activeEventType = type;
            //           eventType = type.value;
            //         });
            //         print('Selected case value: ${type.value}');
            //       },
            //     );
            //   }).toList(),
            // ),
            SizedBox(height: 60),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                action: () {
                  // Pop the bottom sheet and return the selected event type
                  Navigator.pop(context, eventType);
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

class EventFilterChip extends StatelessWidget {
  final String text;
  final VoidCallback? onTap;
  final bool active;
  final Color color;

  const EventFilterChip({
    super.key,
    required this.text,
    this.onTap,
    required this.active,
    required this.color,
  });

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
