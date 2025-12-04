import 'dart:io';

import 'package:flutter/material.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/buddy_events/presentation/cubits/event_create_cubit/event_create_cubit.dart';

final EventCreateCubit eventCreateCubit = locator<EventCreateCubit>();
final TextEditingController dateTimeController = TextEditingController();

final formKeys = [
  GlobalKey<FormState>(), // Step 1
  GlobalKey<FormState>(), // Step 2
  GlobalKey<FormState>(), // Step 3
  GlobalKey<FormState>(), // Step 4
];

String selectedState = '';
String selectedCountry = 'Any Country';
String selectedTargetCountry = 'Any Country';
List<String> allStates = [];
List<String> allCountries = [];

// TextEditingController for all text fields
final TextEditingController categoryController = TextEditingController();
final TextEditingController eventTypeController = TextEditingController();
final TextEditingController participationFeeController =
    TextEditingController();
final TextEditingController eventTitleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();
final TextEditingController buddiesWantedController = TextEditingController();
final TextEditingController eventDateController = TextEditingController();
final TextEditingController eventDateTimeController = TextEditingController();
final TextEditingController durationController = TextEditingController();
final TextEditingController eventAddressController = TextEditingController();
final TextEditingController eventCityController = TextEditingController();
final TextEditingController selectedTargetCountryController =
    TextEditingController();
final TextEditingController sexSelectController = TextEditingController();
final TextEditingController maritalStatusController = TextEditingController();
final TextEditingController occupationController = TextEditingController();

List<String> selectedTags = [];
List<File> selectedMedia = [];

bool get isPaid => eventTypeController.text == 'Paid';

List<String>? guidelines = [];
List<String>? itemsToBring = [];

bool isChecked = false;
