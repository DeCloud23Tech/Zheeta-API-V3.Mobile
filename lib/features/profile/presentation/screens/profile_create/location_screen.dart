import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/location/location_cubit.dart';
import 'package:zheeta/core/location/location_state.dart';
import 'package:zheeta/core/mixin/location_helper.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_location_cubit/profile_location_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/bottom_sheets/location_bottomsheet.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
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
  String? selectedCity;
  List<String> allStates = [];
  List<String> allCountries = [];
  bool isLoadingLocation = false;
  bool _useManualLocationInputs = false;

  bool get _isFormComplete =>
      _address.text.trim().isNotEmpty &&
      _city.text.trim().isNotEmpty &&
      _postcode.text.trim().isNotEmpty &&
      selectedCountry.trim().isNotEmpty;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      if (authenticateCountryCubit.state.countries.isEmpty) {
        authenticateCountryCubit.fetchAllCountries();
      }
      _fetchLocation();
    });
  }

  Future<void> _fetchLocation() async {
    context.read<LocationCubit>().fetchLocation();
    // bool? enable = await locationBottomSheet(context);

    // if (enable ?? false) {
    //   setState(() => isLoadingLocation = true);
    //   try {
    //     final position = await getCurrentLocation(context);
    //     if (position != null) {
    //       _latitude = position.latitude;
    //       _longitude = position.longitude;

    //       await profileLocationCubit.getAddressFromLocationCoordinateCubit(
    //         latitude: _latitude!,
    //         longitude: _longitude!,
    //       );
    //     }
    //   } catch (e) {
    //     NotifyUser.showSnackBar('Failed to get location. Try again later.');
    //   } finally {
    //     setState(() => isLoadingLocation = false);
    //   }
    // } else {
    //   NotifyUser.showSnackBar('Location permission denied.');
    // }
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
    // if ((selectedState).isEmpty) {
    //   NotifyUser.showSnackBar('State is required');
    //   return;
    // }
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
      state: '',
      country: selectedCountry,
      postcode: _postcode.text,
      longitude: _longitude!,
      latitude: _latitude!,
    );

    profileInterestCubit.getInterestsCubit().then((_) {
      if (!mounted) return;
      context.router.replace(const AboutRoute());
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<LocationCubit, LocationState>(
      listener: (context, state) async {
        if (state is LocationLoaded) {
          _latitude = state.position.latitude;
          _longitude = state.position.longitude;

          await profileLocationCubit.getAddressFromLocationCoordinateCubit(
            latitude: _latitude!,
            longitude: _longitude!,
          );
        }

        if (state is LocationPermissionDenied) {
          final enableLocation = await locationBottomSheet(context);
          if (!mounted) return;

          setState(() {
            _useManualLocationInputs = enableLocation != true;
          });

          if (enableLocation == true) {
            _fetchLocation();
          }
        }
      },
      child: BlocConsumer<ProfileLocationCubit, ProfileLocationState>(
        listener: (context, state) {
          if (state is ProfileGotAddressLocationState) {
            setState(() {
              _useManualLocationInputs = false;
              _address.text = state.addressFromLocation.address ?? '';
              selectedCountry = state.addressFromLocation.country ?? '';
              _city.text = state.addressFromLocation.city ?? '';
              selectedCity = _city.text.isEmpty ? null : _city.text;
              _postcode.text = state.addressFromLocation.postalCode ?? '';
              _country.text = selectedCountry;
            });
          }
        },
        builder: (context, state) {
          final countryState = context.watch<AuthenticateCountryCubit>().state;
          final locationState = context.watch<LocationCubit>().state;
          final isPageLoading = state is ProfileLocationLoadingState ||
              state is ProfileLoadingState ||
              countryState.isLoading ||
              locationState is LocationLoading ||
              isLoadingLocation;

          return Scaffold(
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
                      if (isPageLoading)
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Center(
                            child: SpinKitWave(
                              color: AppColors.primaryDark,
                              size: 20.0,
                            ),
                          ),
                        ),
                      const SizedBox(height: 40),
                      _buildCountryField(),
                      _buildCityField(),

                      InputField(
                        controller: _postcode,
                        hintText: 'Zip/Postal code',
                        validator: isValidInput,
                        onChanged: (_) => setState(() {}),
                      ),

                      InputField(
                        controller: _address,
                        hintText: 'Enter Address',
                        validator: isValidInput,
                        onTap: () => _fetchLocation(),
                        onChanged: (_) => setState(() {}),
                      ),

                          /// **State Dropdown**

                          // DropdownInputField(
                          //   value: allStates.contains(selectedState)
                          //       ? selectedState
                          //       : null,
                          //   hintText: 'State',
                          //   searchHintText: 'Search states...',
                          //   noResultsWidget: Padding(
                          //     padding:
                          //         const EdgeInsets.symmetric(vertical: 8.0),
                          //     child: Text(
                          //       'No matching states found',
                          //       style: TextStyle(color: Colors.grey),
                          //     ),
                          //   ),
                          //   validator: isValidInput,
                          //   onChanged: (value) {
                          //     if (value != null) {
                          //       setState(() => selectedState = value);
                          //     }
                          //   },
                          //   items: allStates,
                          // ),

                      const SizedBox(height: 32),
                      BlocConsumer<ProfileInterestCubit, ProfileInterestState>(
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
                              state: state is ProfileInterestLoading ||
                                  state is LocationLoading,
                              disabled: !_isFormComplete,
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
	          );
        },
      ),
    );
  }

  Widget _buildCountryField() {
    if (!_useManualLocationInputs) {
      return InputField(
        controller: _country,
        hintText: 'Country',
        validator: isValidInput,
        onChanged: (value) {
          setState(() {
            selectedCountry = value;
          });
        },
      );
    }

    return BlocBuilder<AuthenticateCountryCubit, AuthenticateCountryState>(
      builder: (context, countryState) {
        final countries =
            countryState.countries.map((country) => country.name ?? '').toList();

        return DropdownInputField(
          value: _country.text.isEmpty ? null : _country.text,
          hintText: 'Country',
          searchHintText: 'Search countries...',
          noResultsWidget: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'No matching countries found',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          validator: isValidInput,
          onChanged: (value) {
            if (value == null) return;
            setState(() {
              selectedCountry = value;
              _country.text = value;
              _city.clear();
              selectedCity = null;
            });

            final countryCode = context
                .read<AuthenticateCountryCubit>()
                .state
                .countries
                .firstWhere(
                  (country) => country.name == value,
                  orElse: () => CountryModel(code: ''),
                )
                .code;

            if (countryCode != null && countryCode.isNotEmpty) {
              context
                  .read<AuthenticateCountryCubit>()
                  .fetchCountryDetails(countryCode);
            }
          },
          items: countries,
        );
      },
    );
  }

  Widget _buildCityField() {
    if (!_useManualLocationInputs) {
      return InputField(
        controller: _city,
        hintText: 'City',
        validator: isValidInput,
        onChanged: (_) => setState(() {}),
      );
    }

    return BlocBuilder<AuthenticateCountryCubit, AuthenticateCountryState>(
      builder: (context, countryState) {
        if (countryState.isLoading) {
          return const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: SpinKitWave(
              color: AppColors.primaryDark,
              size: 20.0,
            ),
          );
        }

        if (countryState.selectedCountryDetails == null ||
            (countryState.selectedCountryDetails!.cities?.isEmpty ?? true)) {
          return const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0),
            child: Text(
              'No cities available',
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        final cities = countryState.selectedCountryDetails!.cities!.toList();

        return DropdownInputField(
          value: selectedCity,
          hintText: 'City',
          searchHintText: 'Search cities...',
          noResultsWidget: const Padding(
            padding: EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'No matching cities found',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          validator: isValidInput,
          onChanged: (value) {
            if (value != null) {
              setState(() {
                selectedCity = value;
                _city.text = value;
              });
            }
          },
          items: cities,
        );
      },
    );
  }
}
