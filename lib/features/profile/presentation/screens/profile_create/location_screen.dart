import 'dart:convert';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/location_helper.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/features/profile/data/models/country_states_model.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_location_cubit/profile_location_cubit.dart';
import 'package:zheeta/shared/bottom_sheets/location_bottomsheet.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/loading_screen.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  const LocationScreen({super.key});

  @override
  LocationScreenState createState() => LocationScreenState();
}

class LocationScreenState extends State<LocationScreen>
    with Validator, LocationHelperMixin {
  final ProfileLocationCubit profileLocationCubit =
      locator<ProfileLocationCubit>();
  final ProfileInterestCubit profileInterestCubit =
      locator<ProfileInterestCubit>();
  final ProfileCreateCubit profileCreateCubit = locator<ProfileCreateCubit>();
  final AuthenticateCountryCubit authenticateCountryCubit =
      locator<AuthenticateCountryCubit>();

  final _formKey = GlobalKey<FormState>();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postcode = TextEditingController();
  final _country = TextEditingController();

  double? _latitude;
  double? _longitude;
  String selectedState = '';
  String selectedCountry = '';
  List<String> allStates = [];
  List<String> allCountries = [];
  bool isLoadingLocation = false;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      _fetchLocation();
    });
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

  Future<void> _fetchLocation() async {
    bool? enable = await locationBottomSheet(context);

    if (enable ?? false) {
      setState(() => isLoadingLocation = true);
      try {
        final position = await getCurrentLocation(context);
        if (position != null) {
          _latitude = position.latitude;
          _longitude = position.longitude;

          await profileLocationCubit.getAddressFromLocationCoordinateCubit(
            latitude: _latitude!,
            longitude: _longitude!,
          );
        }
      } catch (e) {
        NotifyUser.showSnackBar('Failed to get location. Try again later.');
      } finally {
        setState(() => isLoadingLocation = false);
      }
    } else {
      NotifyUser.showSnackBar('Location permission denied.');
    }
  }

  void _saveAndContinue() {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    // Check for null or empty fields manually
    if (_address.text.trim().isEmpty) {
      NotifyUser.showSnackBar('Address is required');
      return;
    }
    if (_city.text.trim().isEmpty) {
      NotifyUser.showSnackBar('City is required');
      return;
    }
    if ((selectedState).isEmpty) {
      NotifyUser.showSnackBar('State is required');
      return;
    }
    if ((selectedCountry).isEmpty) {
      NotifyUser.showSnackBar('Country is required');
      return;
    }
    if (_postcode.text.trim().isEmpty) {
      NotifyUser.showSnackBar('Postcode is required');
      return;
    }
    if (_latitude == null || _longitude == null) {
      NotifyUser.showSnackBar('Please enable location');
      return;
    }

    profileCreateCubit.updateProfileLocationData(
      address: _address.text,
      city: _city.text,
      state: selectedState,
      country: selectedCountry,
      postcode: _postcode.text,
      longitude: _longitude!,
      latitude: _latitude!,
    );

    profileInterestCubit.getInterestsCubit().then((_) {
      if (!mounted) return;
      // context.router.replace(AboutRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileLocationCubit, ProfileLocationState>(
      listener: (context, state) {
        if (state is ProfileGotAddressLocationState) {
          _address.text = state.addressFromLocation.address ?? '';
          selectedCountry = state.addressFromLocation.country ?? '';
          _city.text = state.addressFromLocation.city ?? '';
          _postcode.text = state.addressFromLocation.postalCode ?? '';

          _country.text =
              selectedCountry; // Update the input field with the selected country

          // Access the countryMap from AuthenticateCountryCubit state
          final countryState = context.read<AuthenticateCountryCubit>().state;
          if (countryState.countries.isNotEmpty) {
            final countryMap = {
              for (var country in countryState.countries)
                country.name ?? '': country.code ?? ''
            };

            if (countryMap.containsKey(selectedCountry)) {
              authenticateCountryCubit
                  .fetchCountryDetails(countryMap[selectedCountry]!);
            }
          }

          _loadStatesForCountry(selectedCountry);
        }
      },
      builder: (context, state) {
        return Stack(
          children: [
            Scaffold(
              backgroundColor: AppColors.secondaryLight,
              body: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(height: 60),
                        const AppBackButton(),
                        const SizedBox(height: 40),
                        InputField(
                          controller: _address,
                          hintText: 'Enter Address',
                          validator: isValidInput,
                          onTap: () => _fetchLocation(),
                        ),

                        /// **City Dropdown using BlocBuilder**
                        BlocBuilder<AuthenticateCountryCubit,
                            AuthenticateCountryState>(
                          builder: (context, countryState) {
                            if (countryState.isLoading) {
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: SpinKitWave(
                                  color: AppColors.primaryDark,
                                  size: 20.0,
                                ),
                              );
                            }

                            if (countryState.selectedCountryDetails == null ||
                                (countryState.selectedCountryDetails!.cities
                                        ?.isEmpty ??
                                    true)) {
                              return Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 10.0),
                                child: Text('No cities available',
                                    style: TextStyle(color: Colors.grey)),
                              );
                            }

                            List<String> cities = countryState
                                .selectedCountryDetails!.cities!
                                .toList();

                            return DropdownInputField(
                              value: _city.text.isEmpty ? null : _city.text,
                              hintText: 'City',
                              searchHintText: 'Search cities...',
                              noResultsWidget: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 8.0),
                                child: Text(
                                  'No matching cities found',
                                  style: TextStyle(color: Colors.grey),
                                ),
                              ),
                              validator: isValidInput,
                              onChanged: (value) {
                                if (value != null) {
                                  setState(() => _city.text = value);
                                }
                              },
                              items: cities,
                            );
                          },
                        ),

                        InputField(
                          controller: _postcode,
                          hintText: 'Zip/Postcode',
                          validator: isValidInput,
                        ),

                        /// **State Dropdown**

                        DropdownInputField(
                          value: allStates.contains(selectedState)
                              ? selectedState
                              : null,
                          hintText: 'State',
                          searchHintText: 'Search states...',
                          noResultsWidget: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'No matching states found',
                              style: TextStyle(color: Colors.grey),
                            ),
                          ),
                          validator: isValidInput,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => selectedState = value);
                            }
                          },
                          items: allStates,
                        ),

                        BlocBuilder<AuthenticateCountryCubit,
                            AuthenticateCountryState>(
                          builder: (context, countryState) {
                            return InputField(
                              controller: _country,
                              hintText: 'Country',
                              validator: isValidInput,
                            );
                          },
                        ),

                        const SizedBox(height: 32),
                        BlocConsumer<ProfileInterestCubit,
                            ProfileInterestState>(
                          listener: (context, state) {
                            if (state is ProfileInterestError) {
                              NotifyUser.showSnackBar(state.errorMessage);
                            }
                          },
                          builder: (context, state) {
                            return SizedBox(
                              width: double.infinity,
                              child: PrimaryButton(
                                title: 'Continue',
                                state: state is ProfileInterestLoading,
                                action: _saveAndContinue,
                              ),
                            );
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is ProfileLoadingState || isLoadingLocation)
              const LoadingScreen(),
          ],
        );
      },
    );
  }
}
