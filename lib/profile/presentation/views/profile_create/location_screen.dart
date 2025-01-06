import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/location_helper.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/data/model/country_states_model.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/location_bottomsheet.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class LocationScreen extends StatefulWidget {
  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen>
    with ValidationHelperMixin, LocationHelperMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();
  final _formKey = GlobalKey<FormState>();
  final _address = TextEditingController();
  final _city = TextEditingController();
  final _postcode = TextEditingController();

  String selectedState = '';
  String selectedCountry = 'Any Country';
  List<String> allStates = [];
  List<String> allCountries = [];
  bool _isLoading = false;

  @override
  void initState() {
    super.initState();
    loadCountries(); // Load countries initially
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await populateLocationField();
    });
  }

  Future<void> populateLocationField() async {
    bool? enable = await locationBottomSheet(context);

    if (enable == true) {
      setState(() {
        _isLoading = true; // Start loading
      });

      try {
        Position? position = await getLocation();
        if (position != null) {
          context.read<ProfileCubit>().getAddressFromLocationCoordinateCubit(
              latitude: position.latitude, longitude: position.longitude);

          // After fetching the address, stop loading
          setState(() {
            _isLoading = false;
          });
        }
      } catch (e) {
        // Handle location fetching error
        print("Error fetching location: $e");
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  Future<void> loadCountries() async {
    final data = await rootBundle.loadString('assets/json/countries.json');
    final jsonData = jsonDecode(data) as Map<String, dynamic>;
    setState(() {
      allCountries = jsonData.keys.toList();
    });
  }

  Future<void> loadSelectedCountryStates(String country,
      {bool clearState = true}) async {
    if (clearState) setState(() => allStates = []);

    final data =
        await rootBundle.loadString('assets/json/countries_states.json');
    final jsonData = jsonDecode(data) as List<dynamic>;

    var listOfCountriesWithState = jsonData
        .map((countryState) => CountryState.fromJson(countryState))
        .toList();

    var theCountry = listOfCountriesWithState.firstWhere(
        (element) => element.name == country,
        orElse: () => CountryState(name: country, states: []));

    if (theCountry.states != null) {
      setState(() {
        allStates = theCountry.states!
            .map((state) => state.name)
            .where((name) => name != null)
            .cast<String>()
            .toList();
        if (allStates.isNotEmpty) {
          selectedState = allStates[0]; // Set the first state as selected
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) async {
        if (state is ProfileGotAddressLocationState) {
          // Populate fields from the address data when location is fetched
          _address.text = state.data.address ?? '';
          selectedCountry = state.data.country ?? 'Any Country';
          _city.text = state.data.city ?? '';
          _postcode.text = state.data.postalCode ?? '';

          // Load the states for the selected country
          await loadSelectedCountryStates(selectedCountry, clearState: false);

          // Update the selected state only if it's present in the loaded states
          if (allStates.contains(state.data.state)) {
            setState(() {
              selectedState = state.data.state ?? '';
            });
          } else if (allStates.isNotEmpty) {
            // Set the first state if no matching state is found
            setState(() {
              selectedState = allStates[0];
            });
          }
          profileCubit.updateAddress(_address.text);
          profileCubit.updateCountry(selectedCountry);
          profileCubit.updateState(selectedState);
          profileCubit.updateCity(_city.text);
          profileCubit.updatePostCode(_postcode.text);
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
                        SizedBox(height: 60),
                        CustomBackButton(),
                        SizedBox(height: 40),
                        InputField(
                          controller: _address,
                          hintText: 'Enter Address',
                          validator: (data) => isValidInput(data),
                          onChanged: (value) =>
                              profileCubit.updateAddress(value),
                        ),
                        DropdownInputField(
                          value: selectedCountry,
                          hintText: 'Country',
                          validator: (data) => isValidInput(data),
                          onChanged: (value) async {
                            if (value != null) {
                              setState(() {
                                selectedCountry = value;
                              });
                              profileCubit.updateCountry(value);
                              await loadSelectedCountryStates(value);
                            }
                          },
                          items: allCountries,
                        ),
                        DropdownInputField(
                          value: selectedState,
                          hintText: 'State',
                          validator: (data) => isValidInput(data),
                          onChanged: (value) {
                            if (value != null) {
                              setState(() {
                                selectedState = value;
                                profileCubit.updateState(value);
                              });
                            }
                          },
                          items: allStates,
                        ),
                        InputField(
                          controller: _city,
                          hintText: 'City',
                          validator: (data) => isValidInput(data),
                          onChanged: (value) => profileCubit.updateCity(value),
                        ),
                        InputField(
                          controller: _postcode,
                          hintText: 'Zip/Postcode',
                          validator: (data) => isValidInput(data),
                          onChanged: (value) =>
                              profileCubit.updatePostCode(value),
                        ),
                        SizedBox(height: 32),
                        SizedBox(
                          width: double.infinity,
                          child: PrimaryButton(
                            title: 'Continue',
                            state: state is ProfileLoadingState,
                            action: () async {
                              if (_formKey.currentState!.validate()) {
                                context.router.push(AboutRoute());
                              }
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
            if (state is ProfileLoadingState) LoadingScreen(),
            if (_isLoading) LoadingScreen(), // Use unified loading states
          ],
        );
      },
    );
  }
}
