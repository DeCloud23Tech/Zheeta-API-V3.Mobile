import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/discover/presentation/bloc/matches_bloc/matches_cubit.dart';
import 'package:zheeta/discover/presentation/viewmodel/match_criteria_viewmodel.dart';
import 'package:zheeta/widgets/close_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

Future criteriaFilterBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints:
        BoxConstraints(minHeight: MediaQuery.of(context).size.height * 0.65),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return CriteriaFilterBottomSheetView();
    },
  );
}

class CriteriaFilterBottomSheetView extends StatefulWidget {
  const CriteriaFilterBottomSheetView({super.key});

  @override
  State<CriteriaFilterBottomSheetView> createState() =>
      _CriteriaFilterBottomSheetViewState();
}

class _CriteriaFilterBottomSheetViewState
    extends State<CriteriaFilterBottomSheetView> {
  late MatchCriteriaViewModel matchCriteriaViewModel;

  @override
  void initState() {
    matchCriteriaViewModel = MatchCriteriaViewModel();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      matchCriteriaViewModel.loadCountry();

      Future.delayed(
        Duration(milliseconds: 200),
        () => matchCriteriaViewModel.loadCity('Nigeria', clearCity: false),
      );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MatchesCubit, MatchesState>(builder: (context, state) {
      return Container(
        padding: EdgeInsets.all(20),
        decoration: const BoxDecoration(
          color: Color(0xffFFF1F7),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15), topRight: Radius.circular(15)),
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
                      color: Color(0xffDADADA)),
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
                    groupValue: matchCriteriaViewModel.gender,
                    onChanged: (value) {
                      matchCriteriaViewModel.setGender(value);
                    },
                  ),
                  AppRadioButton(
                    value: 'Female',
                    groupValue: matchCriteriaViewModel.gender,
                    onChanged: (value) {
                      matchCriteriaViewModel.setGender(value);
                    },
                  ),
                  AppRadioButton(
                    value: 'Everyone',
                    groupValue: matchCriteriaViewModel.gender,
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
                    if (matchCriteriaViewModel.minAge > 22 ||
                        matchCriteriaViewModel.maxAge < 40)
                      TextSpan(
                        text:
                            '(${matchCriteriaViewModel.minAge}, ${matchCriteriaViewModel.maxAge})',
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w400),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              RangeSlider(
                values: RangeValues(matchCriteriaViewModel.minAge.toDouble(),
                    matchCriteriaViewModel.maxAge.toDouble()),
                labels: RangeLabels("${matchCriteriaViewModel.minAge}",
                    "${matchCriteriaViewModel.maxAge}"),
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
                    if (matchCriteriaViewModel.distance != 0)
                      TextSpan(
                        text: '(${matchCriteriaViewModel.distance} Km)',
                        style: TextStyle(
                            fontSize: 12,
                            color: AppColors.primaryDark,
                            fontWeight: FontWeight.w400),
                      ),
                  ],
                ),
              ),
              SizedBox(height: 10),
              Slider(
                label: '${matchCriteriaViewModel.distance} Km away',
                value: matchCriteriaViewModel.distance.toDouble(),
                min: 0,
                max: 30,
                onChanged: (value) {
                  matchCriteriaViewModel.setDistance(value.roundToInt);
                },
              ),
              SizedBox(height: 26),
              DropdownInputField(
                items: matchCriteriaViewModel.countryList ?? [],
                hintText: 'Country',
                value: matchCriteriaViewModel.selectedCountry ?? null,
                onChanged: (value) {
                  matchCriteriaViewModel.setCountry(value!);
                  matchCriteriaViewModel.loadCity(value);
                },
              ),
              SizedBox(height: 20),
              DropdownInputField(
                items: matchCriteriaViewModel.statesList ?? [],
                value: matchCriteriaViewModel.selectedState ?? null,
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
                  state: state is MatchesLoadingState,
                  action: () async {
                    await matchCriteriaViewModel.updateMatchCriteria(context);
                    router.pop();
                  },
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
