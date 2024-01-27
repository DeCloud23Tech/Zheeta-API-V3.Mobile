import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/discover/presentation/view_model/match_criteria_viewmodel.dart';
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

class CriteriaFilterBottomSheetView extends ConsumerStatefulWidget {
  const CriteriaFilterBottomSheetView({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CriteriaFilterBottomSheetViewState();
}

class _CriteriaFilterBottomSheetViewState extends ConsumerState<CriteriaFilterBottomSheetView> {
  late MatchCriteriaViewModel matchCriteriaViewModel;

  @override
  void initState() {
    matchCriteriaViewModel = ref.read(matchCriteriaViewModelProvider.notifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      matchCriteriaViewModel.loadCountry();
      final matchCriteriaState = ref.watch(matchCriteriaViewModelProvider);
      Future.delayed(
        Duration(milliseconds: 200),
        () => matchCriteriaViewModel.loadCity(matchCriteriaState.matchCriteriaState.data!.country, clearCity: false),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final matchCriteriaState = ref.watch(matchCriteriaViewModelProvider);
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
                  value: 'Male',
                  groupValue: matchCriteriaState.matchCriteriaState.data?.gender,
                  onChanged: (value) {
                    matchCriteriaViewModel.setGender(value);
                  },
                ),
                AppRadioButton(
                  value: 'Female',
                  groupValue: matchCriteriaState.matchCriteriaState.data?.gender,
                  onChanged: (value) {
                    matchCriteriaViewModel.setGender(value);
                  },
                ),
                AppRadioButton(
                  value: 'Everyone',
                  groupValue: matchCriteriaState.matchCriteriaState.data?.gender,
                  onChanged: (value) {
                    matchCriteriaViewModel.setGender(value);
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
                  if (matchCriteriaState.matchCriteriaState.data!.minAge > 22 || matchCriteriaState.matchCriteriaState.data!.maxAge < 40)
                    TextSpan(
                      text: '(${matchCriteriaState.matchCriteriaState.data?.minAge}, ${matchCriteriaState.matchCriteriaState.data?.maxAge})',
                      style: TextStyle(fontSize: 12, color: AppColors.primaryDark, fontWeight: FontWeight.w400),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            RangeSlider(
              values: RangeValues(matchCriteriaState.matchCriteriaState.data!.minAge.toDouble(), matchCriteriaState.matchCriteriaState.data!.maxAge.toDouble()),
              labels: RangeLabels("${matchCriteriaState.matchCriteriaState.data?.minAge}", "${matchCriteriaState.matchCriteriaState.data?.maxAge}"),
              min: 10,
              max: 100,
              onChanged: (value) {
                matchCriteriaViewModel.setMinAge(value.start.roundToInt);
                matchCriteriaViewModel.setMaxAge(value.end.roundToInt);
              },
            ),
            SizedBox(height: 20),
            Text.rich(
              TextSpan(
                text: 'Distance ',
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600),
                children: [
                  if (matchCriteriaState.matchCriteriaState.data?.distance != 0)
                    TextSpan(
                      text: '(${matchCriteriaState.matchCriteriaState.data?.distance} Km)',
                      style: TextStyle(fontSize: 12, color: AppColors.primaryDark, fontWeight: FontWeight.w400),
                    ),
                ],
              ),
            ),
            SizedBox(height: 10),
            Slider(
              label: '${matchCriteriaState.matchCriteriaState.data?.distance} Km away',
              value: matchCriteriaState.matchCriteriaState.data!.distance.toDouble(),
              min: 0,
              max: 30,
              onChanged: (value) {
                matchCriteriaViewModel.setDistance(value.roundToInt);
              },
            ),
            SizedBox(height: 26),
            DropdownInputField(
              items: matchCriteriaState.countryState.data ?? [],
              hintText: 'Country',
              value: matchCriteriaState.matchCriteriaState.data?.country ?? null,
              onChanged: (value) {
                matchCriteriaViewModel.setCountry(value!);
                matchCriteriaViewModel.loadCity(value);
              },
            ),
            SizedBox(height: 20),
            DropdownInputField(
              items: matchCriteriaState.cityState.data ?? [],
              value: matchCriteriaState.matchCriteriaState.data?.city ?? null,
              hintText: 'City',
              onChanged: (value) {
                matchCriteriaViewModel.setCity(value!);
              },
            ),
            SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: PrimaryButton(
                title: 'Apply',
                state: matchCriteriaState.updateMatchCriteriaState.isLoading,
                action: () async {
                  await matchCriteriaViewModel.updateMatchCriteria();
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
