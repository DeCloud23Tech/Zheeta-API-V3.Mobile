import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/data_load_mixin.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/events/presentation/bloc/multi_step_form_cubit/multi_step_form_cubit.dart';
import 'package:zheeta/events/presentation/widgets/multi_tag_selector.dart';
import 'package:zheeta/events/presentation/widgets/reusable_event_card.dart';
import 'package:zheeta/widgets/date_picker_field.dart';
import 'package:zheeta/widgets/guide_line_input_field.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/media_picker.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

import '../../../app/router/app_router.gr.dart';
import '../views/create_event/event_preview_screen.dart';

class StepForm extends StatefulWidget {
  final int currentStep;

  const StepForm({Key? key, required this.currentStep}) : super(key: key);

  @override
  _StepFormState createState() => _StepFormState();
}

class _StepFormState extends State<StepForm>
    with ValidationHelperMixin, AsyncDataLoaderMixin {
  final _formKeys = [
    GlobalKey<FormState>(), // Step 1
    GlobalKey<FormState>(), // Step 2
    GlobalKey<FormState>(), // Step 3
    GlobalKey<FormState>(), // Step 4
  ];
  final dateTimeController = TextEditingController();
  String selectedCountry = 'Any Country';
  String? sexSelect;
  String? maritalStatus;

  List<String> allCountries = [];
  final List<String> occupationList = AppLists.occupations..sort();
  final List<String> maritalStatusList = AppLists.maritalStatus;
  List<String> selectedTags = [];
  List<File> selectedMedia = [];

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    allCountries =
        await loadCountries(); // Await the Future to get the List<String>
    setState(() {}); // Trigger UI update after loading
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Form(
            key: _formKeys[widget.currentStep - 1],
            // Use the key for the current step
            child: _buildStepContent(widget.currentStep),
          ),
          const SizedBox(height: 20),
          BlocBuilder<MultiStepFormCubit, int>(
            builder: (context, currentStep) {
              final cubit = context.read<MultiStepFormCubit>();
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (currentStep > 1)
                    Expanded(
                      child: PrimaryButton(
                        title: 'Previous',
                        action: cubit.previousStep,
                      ),
                    ),
                  if (currentStep > 1) const SizedBox(width: 8),
                  Expanded(
                    child: PrimaryButton(
                      title: currentStep == 4 ? 'Publish event' : 'Next',
                      action: () {
                        if (_formKeys[currentStep - 1]
                            .currentState!
                            .validate()) {
                          if (currentStep == 4) {
                            // Handle form submission
                            ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(content: Text('Form submitted!')),
                            );
                          } else {
                            cubit.nextStep();
                          }
                        }
                      },
                    ),
                  ),
                ],
              );
            },
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildStepContent(int currentStep) {
    final event = Event(
      eventMainPhotoUrl: 'https://via.placeholder.com/150',
      // Placeholder image URL
      startDate: DateTime.now().add(Duration(days: 7)),
      // Event 7 days from now
      title: 'Music Concert',
      description:
          'Join us for an exciting music concert featuring top artists.',
      eventLocationAddress: '123 Concert Ave, New York, NY',
      noOfBuddiesJoined: 5,
      noOfBuddiesWanted: 20,
      eventParticipationCost: 50.00,
      category: 'Music',
    );

    switch (widget.currentStep) {
      case 1:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Step 1: Basic Event Info',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Category',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            DropdownInputField(
              items: occupationList,
              hintText: 'Select category',
              // onChanged: (value) => profileCubit.updateOccupation(value!),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Event type',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            DropdownInputField(
              items: occupationList,
              hintText: 'Select category',
              // onChanged: (value) => profileCubit.updateOccupation(value!),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Participation fee',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              hintText: 'Enter your tagline',
              // onChanged: (value) => profileCubit.updateTagline(value),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Event title',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              hintText: 'Enter your tagline',
              // onChanged: (value) => profileCubit.updateTagline(value),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Description',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              hintText: 'Type description',
              minLine: 4,
              maxLine: 4,
              // onChanged: (value) => profileCubit.updateTagline(value),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Event Tags',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            MultiSelectTags(
              tags: ['activities', 'recreation', 'outdoor', 'education'],
              onTagsChanged: (tags) {
                setState(() {
                  selectedTags = tags;
                });
              },
            ),
            const SizedBox(height: 20),
            // Text(
            //   'Selected Tags: ${selectedTags.join(', ')}',
            //   style: const TextStyle(fontSize: 16),
            // ),
            // const SizedBox(height: 20),
            const Text(
              'Number of buddies wanted',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              hintText: '0',
              keyboardType: TextInputType.number,
              // onChanged: (value) => profileCubit.updateTagline(value),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            MediaPicker(
              initialMediaFiles: selectedMedia,
              onMediaFilesChanged: (mediaFiles) {
                setState(() {
                  selectedMedia = mediaFiles;
                });
              },
            ),
            const SizedBox(height: 5),
            Text(
              'Max of 3 images',
              style: TextStyle(fontSize: 10, fontWeight: FontWeight.w400),
            ),
          ],
        );
      case 2:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Step 2: Date, time & location',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Date of event *',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            // DatePickerField(
            //   controller: dobController,
            //   hintText: 'DD/MM/YYYY',
            //   // validator: (data) =>
            //   //     data?.isEmpty == true ? 'Please select a date' : null,
            //   onDateSelected: (formattedDate) {
            //     // Handle date selection logic, e.g., updating a Cubit or state
            //     // profileCubit.updateDOB(formattedDate);
            //   },
            // ),
            DateTimePickerField(
              controller: dateTimeController,
              hintText: "Select date and time",
              // validator: (value) {
              //   if (value == null || value.isEmpty) {
              //     return 'Please select a date and time';
              //   }
              //   return null;
              // },
              onDateTimeSelected: (value) {
                print("Selected DateTime: $value");
              },
            ),

            const SizedBox(height: 10),
            const Text(
              'Duration of event (Hrs) *',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              keyboardType: TextInputType.number,
              hintText: 'Select duration',
              // onChanged: (value) => profileCubit.updateTagline(value),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            const Text(
              'Event address *',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            InputField(
              keyboardType: TextInputType.number,
              hintText: 'Event address',
              // onChanged: (value) => profileCubit.updateTagline(value),
              // validator: (value) => isValidInput(value),
            ),
            const SizedBox(height: 10),
            Text('Country',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            DropdownInputField(
              value: selectedCountry,
              hintText: 'Select Country',
              validator: (data) => isValidInput(data),
              onChanged: (value) async {
                if (value != null) {
                  setState(() {
                    selectedCountry = value;
                  });
                  // profileCubit.updateOriginCountry(value);
                }
              },
              items: allCountries,
            ),
            SizedBox(height: 10),
            Text('City',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            InputField(
              hintText: 'Enter City',
              // onChanged: (value) =>
              // profileCubit.updateOriginCity(value),
              // validator: (value) => isValidInput(value),
            ),
            SizedBox(height: 10),
            Text('State',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            InputField(
              hintText: 'Enter State',
              // onChanged: (value) =>
              // profileCubit.updateOriginCity(value),
              // validator: (value) => isValidInput(value),
            ),
          ],
        );
      case 3:
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Step 3: Guidelines & Items',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            SizedBox(height: 15),
            GuidelinesInputWithCheckbox(
              text: 'Include event Guidelines (Optional)',
              hintText: 'Enter guideline',
              onGuidelinesChanged: (guidelines) {
                print(guidelines); // Handle the list of guidelines here
              },
            ),
            SizedBox(height: 15),
            GuidelinesInputWithCheckbox(
              text: 'Items to bring (Optional)',
              hintText: 'Enter item',
              onGuidelinesChanged: (items) {
                print(items); // Handle the list of guidelines here
              },
            ),
          ],
        );
      case 4:
        bool _isChecked = false;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Step 4: Target insights & review',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
            const SizedBox(height: 20),
            Text('Target Country',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
            DropdownInputField(
              value: selectedCountry,
              hintText: 'Enter Country',
              validator: (data) => isValidInput(data),
              onChanged: (value) async {
                if (value != null) {
                  setState(() {
                    selectedCountry = value;
                  });
                  // profileCubit.updateOriginCountry(value);
                }
              },
              items: allCountries,
            ),
            const SizedBox(height: 10),
            const Text(
              'Gender',
              style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
            ),
            const SizedBox(height: 10),
            Row(
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppRadioButton(
                  value: "Man",
                  groupValue: sexSelect,
                  onChanged: (value) {
                    setState(() {
                      sexSelect = value;
                      // profileCubit.updateGender(value);
                    });
                  },
                  title: 'Man',
                ),
                SizedBox(width: 30),
                AppRadioButton(
                  value: "Woman",
                  groupValue: sexSelect,
                  onChanged: (value) {
                    setState(() {
                      sexSelect = value;
                      // profileCubit.updateGender(value);
                    });
                  },
                  title: 'Woman',
                ),
                SizedBox(width: 30),
                AppRadioButton(
                  value: "Everyone",
                  groupValue: sexSelect,
                  onChanged: (value) {
                    setState(() {
                      sexSelect = value;
                      // profileCubit.updateGender(value);
                    });
                  },
                  title: 'Everyone',
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
              children: maritalStatusList.map((value) {
                return AppRadioButton(
                  value: value,
                  groupValue: maritalStatus,
                  onChanged: (value) {
                    setState(() {
                      maritalStatus = value; // Update the selected body type
                      // profileCubit
                      //     .updateMaritalStatus(value); // Save in Cubit
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
              items: occupationList,
              hintText: 'Select occupation',
              // onChanged: (value) =>
              // profileCubit.updateOccupation(value!),
              // validator: (value) => isValidInput(value),
            ),
            SizedBox(height: 20),
            Text('Event preview',
                style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w400,
                    color: AppColors.black)),
            SizedBox(height: 18),
            Row(
              children: [
                Expanded(
                  child: FittedBox(
                    fit: BoxFit.fitHeight,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height * 0.4, // Adjust height based on screen size
                      width: MediaQuery.of(context).size.width * 0.75,  // Adjust width based on screen size
                      child: EventCard(
                        eventMainPhotoUrl: event.eventMainPhotoUrl,
                        startDate: event.startDate,
                        title: event.title,
                        description: event.description,
                        eventLocationAddress: event.eventLocationAddress,
                        noOfBuddiesJoined: event.noOfBuddiesJoined,
                        noOfBuddiesWanted: event.noOfBuddiesWanted,
                        eventParticipationCost: event.eventParticipationCost,
                        category: event.category,
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
                        'Go through your event preview before publishing events',
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                      const SizedBox(height: 10),
                      GestureDetector(
                        onTap: () {
                          // Navigate to Event Preview Page
                          context.router.push(EventPreviewRoute(event: event));
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
                  value: _isChecked,
                  onChanged: (bool? value) {
                    setState(() {
                      _isChecked = value ?? false;
                    });
                  },
                ),
                Text(
                  'Promote this event (',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ],
        );
      default:
        return const SizedBox.shrink();
    }
  }
}
