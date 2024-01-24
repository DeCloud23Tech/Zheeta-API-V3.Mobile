import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/widgets/close_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

Future criteriaFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints: BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.65),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CriteriaFilterBottomSheetView();
    },
  );
}

class CriteriaFilterBottomSheetView extends ConsumerWidget {
  CriteriaFilterBottomSheetView({super.key});

  final gender = StateProvider<String?>((ref) => null);
  final age = StateProvider<RangeValues>((ref) => RangeValues(22, 40));
  final distance = StateProvider<double>((ref) => 0);

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
                  'Criteria filter',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 40, height: 40),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'I’m interested',
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
            ),
            SizedBox(height: 10),
            Row(
              children: [
                AppRadioButton(
                  value: 'Man',
                  groupValue: ref.watch(gender),
                  onChanged: (value) {
                    ref.read(gender.notifier).state = value;
                  },
                ),
                AppRadioButton(
                  value: 'Woman',
                  groupValue: ref.watch(gender),
                  onChanged: (value) {
                    ref.read(gender.notifier).state = value;
                  },
                ),
                AppRadioButton(
                  value: 'Everyone',
                  groupValue: ref.watch(gender),
                  onChanged: (value) {
                    ref.read(gender.notifier).state = value;
                  },
                ),
              ],
            ),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: 'Age ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                children: [
                  if (ref.watch(age).start.roundToInt > 22 || ref.watch(age).end.roundToInt < 40)
                    TextSpan(
                      text: '(${ref.watch(age).start.roundToInt}, ${ref.watch(age).end.roundToInt})',
                      style: TextStyle(fontSize: 12, color: AppColors.primaryDark, fontWeight: FontWeight.w400),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RangeSlider(
              values: ref.watch(age),
              labels: RangeLabels("${ref.watch(age).start.roundToInt}", "${ref.watch(age).end.roundToInt}"),
              min: 18,
              max: 100,
              onChanged: (value) {
                ref.read(age.notifier).state = value;
              },
            ),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: 'Distance ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                children: [
                  if (ref.watch(distance).roundToInt != 0)
                    TextSpan(
                      text: '(${ref.watch(distance).roundToInt} Km)',
                      style: TextStyle(fontSize: 12, color: AppColors.primaryDark, fontWeight: FontWeight.w400),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Slider(
              label: '${ref.watch(distance).roundToInt} Km away',
              value: ref.watch(distance),
              min: 0,
              max: 30,
              onChanged: (value) {
                ref.read(distance.notifier).state = value;
              },
            ),
            SizedBox(height: 26),
            DropdownInputField(
              items: [''],
              hintText: 'Country',
            ),
            SizedBox(height: 20),
            DropdownInputField(
              items: [''],
              hintText: 'State',
            ),
            SizedBox(height: 20),
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
