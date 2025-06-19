import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/lists.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/data/model/country_model.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authenticate_country_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/bloc/event_create_cubit/event_create_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/views/create_event/create_event_screen.dart';
import 'package:zheeta/features/buddy_events/presentation/views/create_event/event_preview_screen.dart';
import 'package:zheeta/features/buddy_events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/features/payment_and_subscriptions/presentation/bloc/charges/charges_cubit.dart';
import 'package:zheeta/widgets/country_dropdown.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

import '../create_event_globals.dart';

// Step 4 Screen
@RoutePage()
class TargetInsightsScreen extends StatefulWidget {
  const TargetInsightsScreen({super.key});

  @override
  State<TargetInsightsScreen> createState() => _TargetInsightsScreenState();
}

class _TargetInsightsScreenState extends State<TargetInsightsScreen>
    with ValidationHelperMixin {
  final ChargesCubit _chargesCubit = locator<ChargesCubit>();

  @override
  void initState() {
    _chargesCubit.getAllChargesCubit();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 4),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKeys[3],
          child: ListView(
            children: [
              buildDropdownField(
                'Target Country',
                selectedTargetCountry,
                context.select<AuthenticateCountryCubit, List<String>>(
                  (cubit) =>
                      cubit.state.countries.map((c) => c.name ?? '').toList(),
                ),
                (value) {
                  if (value != null && value != selectedTargetCountry) {
                    setState(() {
                      selectedTargetCountry = value;
                    });

                    final countryCode = context
                        .read<AuthenticateCountryCubit>()
                        .state
                        .countries
                        .firstWhere((c) => c.name == value,
                            orElse: () => CountryModel(code: ''))
                        .code;

                    if (countryCode != null && countryCode.isNotEmpty) {
                      context
                          .read<AuthenticateCountryCubit>()
                          .fetchCountryDetails(countryCode);
                    }
                  }
                },
              ),
              const SizedBox(height: 10),
              const Text(
                'Gender',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AppRadioButton(
                    value: "Male",
                    groupValue: sexSelectController.text,
                    onChanged: (value) {
                      setState(() {
                        sexSelectController.text = value;
                      });
                    },
                    title: 'Male',
                  ),
                  SizedBox(width: 30),
                  AppRadioButton(
                    value: "Female",
                    groupValue: sexSelectController.text,
                    onChanged: (value) {
                      setState(() {
                        sexSelectController.text = value;
                      });
                    },
                    title: 'Female',
                  ),
                  SizedBox(width: 30),
                  AppRadioButton(
                    value: "All",
                    groupValue: sexSelectController.text,
                    onChanged: (value) {
                      setState(() {
                        sexSelectController.text = value;
                      });
                    },
                    title: 'All',
                  ),
                ],
              ),
              SizedBox(height: 20),
              Text('Marital Status',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              SizedBox(height: 10),
              Wrap(
                spacing: 15,
                runSpacing: 10,
                children: AppLists.maritalStatus.map((value) {
                  return AppRadioButton(
                    value: value,
                    groupValue: maritalStatusController.text,
                    onChanged: (value) {
                      setState(() {
                        maritalStatusController.text =
                            value; // Update the selected body type
                      });
                    },
                    title: value,
                  );
                }).toList(),
              ),
              SizedBox(height: 20),
              Text('Occupation',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              DropdownInputField(
                value: occupationController.text.isNotEmpty
                    ? occupationController.text
                    : null,
                items: AppLists.occupations,
                hintText: 'Select occupation',
                onChanged: (value) =>
                    setState(() => occupationController.text = value ?? ''),
                validator: (value) => isValidInput(value),
              ),
              SizedBox(height: 20),
              Text(
                'Event preview',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black),
              ),
              SizedBox(height: 18),
              Row(
                children: [
                  Expanded(
                    child: FittedBox(
                      fit: BoxFit.fitHeight,
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height *
                            0.4, // Adjust height based on screen size
                        width: MediaQuery.of(context).size.width *
                            0.75, // Adjust width based on screen size
                        child: EventCard(
                          eventMainPhotoUrl: '',
                          eventMainPhoto: selectedMedia[0],
                          startDate:
                              DateTime.tryParse(eventDateTimeController.text) ??
                                  DateTime.now(),
                          title: eventTitleController.text,
                          description: descriptionController.text,
                          eventLocationAddress: eventAddressController.text,
                          noOfBuddiesJoined: 0,
                          noOfBuddiesWanted:
                              int.tryParse(buddiesWantedController.text) ?? 0,
                          eventParticipationCost: double.tryParse(
                                  participationFeeController.text) ??
                              0.0,
                          category: eventTypeController.text,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Go through your event preview before publishing buddy events',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        const SizedBox(height: 10),
                        GestureDetector(
                          onTap: () {
                            context.router.push(
                              EventPreviewRoute(
                                event: EventPreview(
                                  startDate: DateTime.tryParse(
                                          eventDateTimeController.text) ??
                                      DateTime.now(),
                                  title: eventTitleController.text,
                                  description: descriptionController.text,
                                  eventLocationAddress:
                                      eventAddressController.text,
                                  noOfBuddiesJoined: 0,
                                  noOfBuddiesWanted: int.tryParse(
                                          buddiesWantedController.text) ??
                                      0,
                                  eventParticipationCost: double.tryParse(
                                          participationFeeController.text) ??
                                      0.0,
                                  category: eventTypeController.text,
                                  guidelines: guidelines,
                                  itemsToBring: itemsToBring,
                                  selectedTags: selectedTags,
                                  selectedMedia: selectedMedia,
                                ),
                              ),
                            );
                          },
                          child: Text(
                            'Preview event',
                            style: TextStyle(
                              fontSize: 13,
                              fontWeight: FontWeight.w400,
                              color: AppColors.primaryDark,
                              decoration: TextDecoration.underline,
                              decorationColor: AppColors.primaryDark,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Checkbox(
                    checkColor: AppColors.primaryDark,
                    activeColor: AppColors.secondaryLight,
                    side: BorderSide(
                      color: AppColors.primaryDark,
                      width: 1.0,
                    ),
                    value: isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        isChecked = value ?? false;
                      });
                    },
                  ),
                  BlocBuilder<ChargesCubit, ChargesState>(
                    builder: (context, state) {
                      return RichText(
                        text: TextSpan(
                          children: [
                            const TextSpan(
                              text: "Promote this event ",
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: AppColors.black),
                            ),
                            TextSpan(
                              text: '(',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: SvgPicture.asset(
                                "assets/images/icons/zheeta-coin-bold.svg",
                                height: 10, // Adjust height as needed
                              ),
                            ),
                            TextSpan(
                              text: state is ChargesSuccess
                                  ? ' ${state.charges.data.firstWhere(
                                        (charge) =>
                                            charge.title ==
                                            'BuddyEvent-Promotion',
                                      ).amount})'
                                  : '',
                              style: const TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w500,
                                color: AppColors.black,
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: BlocConsumer<EventCreateCubit, EventCreateState>(
          listener: (context, createState) {
            if (createState is EventCreateSuccess) {
              NotifyUser.showSnackBar('Event created successfully!');
              context.router.popUntil((route) => route.isFirst);
              context.router.replace(HomeRoute());
            } else if (createState is EventCreateFailure) {
              NotifyUser.showSnackBar(createState.errorMessage);
            }
          },
          builder: (context, state) {
            return PrimaryButton(
              title: 'Publish event',
              state: state is EventCreateLoading,
              action: () {
                final isValid = formKeys[3].currentState?.validate() ?? false;

                if (!isValid) return;

                if (selectedTargetCountry.isEmpty) {
                  NotifyUser.showSnackBar('Please select a target country.');
                  return;
                }

                if (sexSelectController.text.isEmpty) {
                  NotifyUser.showSnackBar('Please select a gender preference.');
                  return;
                }

                if (maritalStatusController.text.isEmpty) {
                  NotifyUser.showSnackBar('Please select a marital status.');
                  return;
                }

                if (occupationController.text.isEmpty) {
                  NotifyUser.showSnackBar('Please select an occupation.');
                  return;
                }

                final stepData = {
                  'category': categoryController.text,
                  'eventType': eventTypeController.text,
                  'eventTitle': eventTitleController.text,
                  'description': descriptionController.text,
                  'selectedTags': selectedTags,
                  'participationFee': participationFeeController.text.isNotEmpty
                      ? participationFeeController.text
                      : null,
                  'buddiesWanted':
                      int.tryParse(buddiesWantedController.text) ?? 0,
                  'selectedMedia': selectedMedia,
                  'dateTime': eventDateTimeController.text,
                  'duration': int.tryParse(durationController.text) ?? 0,
                  'eventAddress': eventAddressController.text,
                  'city': eventCityController.text,
                  'state': selectedState,
                  'country': selectedCountry,
                  'guidelines': guidelines,
                  'itemsToBring': itemsToBring,
                  'gender': sexSelectController.text.isNotEmpty
                      ? sexSelectController.text
                      : null,
                  'maritalStatus': maritalStatusController.text.isNotEmpty
                      ? maritalStatusController.text
                      : null,
                  'occupation': occupationController.text.isNotEmpty
                      ? occupationController.text
                      : null,
                  'isChecked': isChecked,
                };

                // Submit final form data to the Cubit
                eventCreateCubit.createEventData(
                  category: stepData['category'] as String? ?? '',
                  eventType: stepData['eventType'] as String? ?? '',
                  eventTitle: stepData['eventTitle'] as String? ?? '',
                  description: stepData['description'] as String? ?? '',
                  selectedTags:
                      (stepData['selectedTags'] as List<String>?) ?? [],
                  participationFee: stepData['participationFee'] as String?,
                  buddiesWanted: stepData['buddiesWanted'] as int?,
                  selectedMedia:
                      (stepData['selectedMedia'] as List<File>?) ?? [],
                  dateTime: stepData['dateTime'] as String? ?? '',
                  duration: stepData['duration'] as int? ?? 0,
                  eventAddress: stepData['eventAddress'] as String? ?? '',
                  country: stepData['country'] as String? ?? '',
                  city: stepData['city'] as String? ?? '',
                  state: stepData['state'] as String? ?? '',
                  guidelines: (stepData['guidelines'] as List<String>?) ?? [],
                  itemsToBring:
                      (stepData['itemsToBring'] as List<String>?) ?? [],
                  targetCountry: stepData['country'] as String?,
                  gender: stepData['gender'] as String?,
                  maritalStatus: stepData['maritalStatus'] as String?,
                  occupation: stepData['occupation'] as String?,
                  isChecked: stepData['isChecked'] as bool? ?? false,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
