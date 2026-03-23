import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/lists.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/extensions/double_extension.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/models/country_model.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authenticate_country_cubit/authenticate_country_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/features/profile/presentation/cubits/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/country_dropdown.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/radio_button.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  const AboutScreen({super.key});

  @override
  AboutScreenState createState() => AboutScreenState();
}

class AboutScreenState extends State<AboutScreen> with Validator {
  final ProfileCreateCubit profileCubit = locator<ProfileCreateCubit>();
  final ProfileInterestCubit profileInterestCubit =
      locator<ProfileInterestCubit>();
  final AuthenticateCountryCubit authenticateCountryCubit =
      locator<AuthenticateCountryCubit>();

  final _formKey = GlobalKey<FormState>();

  // State variables
  int weight = 45; // Change to int
  double height = 5.0; // Keep as double
  String? bodyType,
      maritalStatus,
      complexion,
      religion,
      customReligion,
      occupation,
      bio,
      tagline,
      originCity;
  String? language = 'English';
  List<String> interests = [];
  List<dynamic> selectedIds = [];
  String selectedCountry = 'United States';
  List<String> allCountries = [];

  void onDonePressed() {
    if (_formKey.currentState!.validate()) {
      final selectedReligion = religion == 'Other' ? customReligion : religion;

      profileCubit.updateProfileAdditionalData(
        height: height.roundTo2dp,
        weight: weight.round(),
        bodyType: bodyType,
        complexion: complexion,
        maritalStatus: maritalStatus,
        religion: selectedReligion,
        selectedInterestIds: selectedIds,
        occupation: occupation,
        originCountry: selectedCountry,
        originCity: originCity,
        language: language,
        tagline: tagline,
        bio: bio,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCreateCubit, ProfileCreateState>(
      listener: (context, state) {
        if (state is ProfileCreateError) {
          NotifyUser.showSnackBar(state.errorMessage);
        } else if (state is ProfileCreateSuccess) {
          if (!mounted) return;
          context.router.replace(const ProfilePhotoRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryLight,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.secondaryLight,
            leading: AppBackButton(),
            title: Text(
              'Let\'s know you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildHeightSlider(),
                    SizedBox(height: 20),
                    _buildWeightSlider(),
                    SizedBox(height: 20),
                    _buildSelectionField(
                        'Body Type', bodyType, AppLists.bodyTypes, (value) {
                      setState(() => bodyType = value);
                    }),
                    SizedBox(height: 20),
                    _buildSelectionField(
                        'Complexion', complexion, AppLists.complexions,
                        (value) {
                      setState(() => complexion = value);
                    }),
                    SizedBox(height: 20),
                    _buildSelectionField(
                        'Marital Status', maritalStatus, AppLists.maritalStatus,
                        (value) {
                      setState(() => maritalStatus = value);
                    }),
                    SizedBox(height: 20),
                    _buildSelectionField(
                        'Religion', religion, AppLists.religions, (value) {
                      setState(() => religion = value);
                    }),
                    SizedBox(height: 20),
                    Visibility(
                      visible: religion == 'Other',
                      child: InputField(
                        hintText: 'Specify Religion',
                        validator: isValidInput,
                        onChanged: (value) => customReligion = value,
                      ),
                    ),
                    _buildInterestsSection(),
                    SizedBox(height: 20),
                    Text('Occupation',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    DropdownInputField(
                      value: occupation,
                      items: AppLists.occupations,
                      hintText: 'Select occupation',
                      onChanged: (value) => setState(() => occupation = value),
                      validator: isValidInput,
                    ),
                    SizedBox(height: 10),
                    Text('Language',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    DropdownInputField(
                      value: language,
                      items: AppLists.languages,
                      hintText: 'Select language',
                      onChanged: (value) => setState(() => language = value),
                      validator: isValidInput,
                    ),
                    SizedBox(height: 10),
                    buildDropdownField(
                      'Origin Country',
                      selectedCountry,
                      context.select<AuthenticateCountryCubit, List<String>>(
                        (cubit) => cubit.state.countries
                            .map((c) => c.name ?? '')
                            .toList(),
                      ),
                      (value) {
                        if (value != null && value != selectedCountry) {
                          setState(() {
                            selectedCountry = value;
                            originCity = null; // Reset city selection
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
                    SizedBox(height: 10),
                    Text('Origin City',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    BlocBuilder<AuthenticateCountryCubit,
                        AuthenticateCountryState>(
                      builder: (context, countryState) {
                        if (countryState.isLoading) {
                          return Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: SpinKitWave(
                              color: AppColors.primaryDark,
                              size: 20.0,
                            ),
                          );
                        }

                        if (countryState.selectedCountryDetails == null ||
                            (countryState
                                    .selectedCountryDetails!.cities?.isEmpty ??
                                true)) {
                          return Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Text('No cities available',
                                style: TextStyle(color: Colors.grey)),
                          );
                        }

                        List<String> cities = countryState
                            .selectedCountryDetails!.cities!
                            .toList();

                        return DropdownInputField(
                          value: originCity,
                          hintText: 'Origin City',
                          validator: isValidInput,
                          onChanged: (value) {
                            if (value != null) {
                              setState(() => originCity = value);
                            }
                          },
                          items: cities,
                        );
                      },
                    ),
                    SizedBox(height: 10),
                    Text('Tagline (Describe Yourself in One Line)',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    InputField(
                      hintText: 'Enter your tagline',
                      onChanged: (value) => tagline = value,
                      validator: isValidInput,
                    ),
                    SizedBox(height: 10),
                    Text('About Me',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    InputField(
                      hintText: 'Enter your bio',
                      minLine: 4,
                      maxLine: 5,
                      onChanged: (value) => bio = value,
                      validator: isValidInput,
                    ),
                    SizedBox(height: 30),
                    PrimaryButton(
                      title: 'Done',
                      state: state is ProfileCreateLoading,
                      action: onDonePressed,
                    ),
                    SizedBox(height: 30),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHeightSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Height (${height.roundTo2dp}\'\')',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            IconButton(
              iconSize: 16,
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  height = (height - 0.1).clamp(0.0, 10.0);
                });
              },
            ),
            Expanded(
              child: Slider(
                value: height,
                min: 0,
                max: 10,
                onChanged: (value) => setState(() => height = value),
              ),
            ),
            IconButton(
              iconSize: 16,
              icon: Icon(
                Icons.add,
              ),
              onPressed: () {
                setState(() {
                  height = (height + 0.1).clamp(0.0, 10.0);
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildWeightSlider() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Weight (${weight}kg)',
          style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
        ),
        Row(
          children: [
            IconButton(
              iconSize: 16,
              icon: Icon(Icons.remove),
              onPressed: () {
                setState(() {
                  weight = (weight - 1).clamp(0, 150);
                });
              },
            ),
            Expanded(
              child: Slider(
                value: weight.toDouble(),
                min: 0,
                max: 150,
                onChanged: (value) => setState(() => weight = value.round()),
              ),
            ),
            IconButton(
              iconSize: 16,
              icon: Icon(Icons.add),
              onPressed: () {
                setState(() {
                  weight = (weight + 1).clamp(0, 150);
                });
              },
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildSelectionField(String title, String? selectedValue,
      List<String> options, Function(String?) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title,
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        SizedBox(height: 10),
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: options.map((value) {
            return AppRadioButton(
              value: value,
              groupValue: selectedValue,
              onChanged: onChanged,
              title: value,
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildInterestsSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Interest, I’m looking for',
            style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
        SizedBox(height: 10),
        BlocBuilder<ProfileInterestCubit, ProfileInterestState>(
          builder: (context, state) {
            if (state is ProfileInterestLoading) {
              return SpinKitWave(
                color: AppColors.primaryDark,
                size: 20.0,
              );
            } else if (state is ProfileInterestLoaded) {
              final interestList = state.userInterestsList;

              return Wrap(
                spacing: 15,
                runSpacing: 10,
                children: interestList.map(
                  (interestModel) {
                    bool isActive = interests.contains(interestModel.title);

                    return AppMultipleSelectRadioButton(
                      value: interestModel.title,
                      isActive: isActive,
                      title: interestModel.title,
                      onChanged: (selectedValue) {
                        if (isActive) {
                          interests.remove(interestModel.title);
                        } else {
                          interests.add(interestModel.title);
                        }

                        selectedIds = interestList
                            .where((model) => interests.contains(model.title))
                            .map((model) => model.id)
                            .toList();

                        setState(() {});
                      },
                    );
                  },
                ).toList(),
              );
            } else if (state is ProfileInterestError) {
              return Wrap(
                children: [
                  Text(
                    'Failed to load interests. \nPlease try again.  ',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      // Trigger the retry action
                      profileInterestCubit.getInterestsCubit();
                    },
                    child: Text(
                      ' Retry',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              );
            }
            return SizedBox.shrink(); // Placeholder when no state matches
          },
        ),
      ],
    );
  }
}
