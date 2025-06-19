import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/data/model/country_model.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authenticate_country_cubit.dart';
import 'package:zheeta/features/buddy_events/presentation/views/create_event/create_event_screen.dart';
import 'package:zheeta/features/profile/data/model/country_states_model.dart';
import 'package:zheeta/widgets/country_dropdown.dart';
import 'package:zheeta/widgets/date_picker_field.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../create_event_globals.dart';

// Step 2 Screen
@RoutePage()
class DateTimeLocationScreen extends StatefulWidget {
  const DateTimeLocationScreen({super.key});

  @override
  State<DateTimeLocationScreen> createState() => _DateTimeLocationScreenState();
}

class _DateTimeLocationScreenState extends State<DateTimeLocationScreen>
    with ValidationHelperMixin {
  final AuthenticateCountryCubit authenticateCountryCubit =
      locator<AuthenticateCountryCubit>();

  @override
  void initState() {
    authenticateCountryCubit.fetchAllCountries();
    super.initState();
  }

  Future<void> _loadStatesForCountry(String country) async {
    final data =
        await rootBundle.loadString('assets/json/countries_states.json');
    final jsonData = jsonDecode(data) as List<dynamic>;

    final countryStates = jsonData
        .map((e) => CountryState.fromJson(e))
        .firstWhere((cs) => cs.name == country,
            orElse: () => CountryState(name: country, states: []));

    setState(() {
      allStates =
          countryStates.states?.map((state) => state.name ?? '').toList() ?? [];
      selectedState = allStates.isNotEmpty ? allStates[0] : '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context, 2),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
            key: formKeys[1],
          child: ListView(
            children: [
              const Text(
                'Date of event *',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              DateTimePickerField(
                controller: dateTimeController,
                hintText: "Date - Time",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please select a date and time';
                  }
                  return null;
                },
                onDateTimeSelected: (value) {
                  setState(() => eventDateTimeController.text = value);
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
                onChanged: (value) =>
                    setState(() => durationController.text = value),
                validator: (value) => isValidInput(value),
              ),
              const SizedBox(height: 10),
              const Text(
                'Event address *',
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
              ),
              InputField(
                hintText: 'Event address',
                onChanged: (value) =>
                    setState(() => eventAddressController.text = value),
                validator: (value) => isValidInput(value),
              ),
              const SizedBox(height: 10),
              buildDropdownField(
                'Country',
                selectedCountry,
                context.select<AuthenticateCountryCubit, List<String>>(
                  (cubit) =>
                      cubit.state.countries.map((c) => c.name ?? '').toList(),
                ),
                (value) {
                  if (value != null && value != selectedCountry) {
                    setState(() {
                      selectedCountry = value;
                    });
                    _loadStatesForCountry(value);

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
              Text('State',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              DropdownInputField(
                value: selectedState,
                hintText: 'Enter State',
                onChanged: (value) {
                  if (value != null) {
                    setState(() => selectedState = value);
                  }
                },
                items: allStates,
              ),
              const SizedBox(height: 10),
              Text('City',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
              BlocBuilder<AuthenticateCountryCubit, AuthenticateCountryState>(
                builder: (context, countryState) {
                  if (selectedCountry.isEmpty) return const SizedBox.shrink();

                  if (countryState.isLoading) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: SpinKitWave(
                        color: AppColors.primaryDark,
                        size: 20.0,
                      ),
                    );
                  }

                  final cityList =
                      countryState.selectedCountryDetails?.cities ?? [];
                  if (cityList.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('No cities available',
                          style: TextStyle(color: Colors.grey)),
                    );
                  }

                  return DropdownInputField(
                    hintText: 'City',
                    value: eventCityController.text.isNotEmpty
                        ? eventCityController.text
                        : null,
                    validator: isValidInput,
                    onChanged: (value) {
                      if (value != null) {
                        setState(() => eventCityController.text = value);
                      }
                    },
                    items: cityList.map((city) => city.toString()).toList(),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0),
        child: PrimaryButton(
          title: 'Next',
          action: () {
            if (formKeys[1].currentState?.validate() ?? false) {
              // Validate that necessary fields are filled
              if (dateTimeController.text.isEmpty) {
                NotifyUser.showSnackBar("Please select a date and time.");
                return;
              }

              if (durationController.text.isEmpty) {
                NotifyUser.showSnackBar("Please select the duration.");
                return;
              }

              if (eventAddressController.text.isEmpty) {
                NotifyUser.showSnackBar("Please enter an event address.");
                return;
              }

              if (selectedCountry.isEmpty) {
                NotifyUser.showSnackBar("Please select a country.");
                return;
              }

              if (selectedState.isEmpty) {
                NotifyUser.showSnackBar("Please select a state.");
                return;
              }

              if (eventCityController.text.isEmpty) {
                NotifyUser.showSnackBar("Please select a city.");
                return;
              }

              // Continue only if all necessary fields are filled
              context.router.push(const GuidelinesItemsRoute());
            }
          },
        ),
      ),
    );
  }
}
