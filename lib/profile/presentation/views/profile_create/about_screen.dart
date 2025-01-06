import 'dart:convert';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/data_load_mixin.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/data/model/user_interest_model.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  @override
  _AboutScreenState createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen>
    with ValidationHelperMixin, AsyncDataLoaderMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();
  final _formKey = GlobalKey<FormState>();
  double height = 5.0;
  double weight = 45;
  String? bodyType;
  String? maritalStatus;
  String? complexion;
  String? religion;
  List<String> interest = [];
  List<String>? languages;
  String selectedCountry = 'Any Country';
  late List<String> allCountries;
  final List<String> bodyTypeList = AppLists.bodyTypes;
  final List<String> maritalStatusList = AppLists.maritalStatus;
  final List<String> complexionList = AppLists.complexions;
  final List<String> religionList = AppLists.religions;
  final List<String> occupationList = AppLists.occupations..sort();
  final List<String> languageList = AppLists.languages..sort();
  TextEditingController languagesController = TextEditingController();

  @override
  void initState() {
    super.initState();
    loadInterests(context);
    initializeData(); // Load countries initially
  }

  Future<void> initializeData() async {
    allCountries =
        await loadCountries(); // Await the Future to get the List<String>
    setState(() {}); // Trigger UI update after loading
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ProfileCubit, ProfileState>(
      listener: (context, state) {
        if (state is ProfileErrorState) {
          // context.router.pop(); // Navigate away after success
        } else if (state is ProfileCreatedState) {
          router.push(ProfilePhotoRoute());
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryLight,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            backgroundColor: AppColors.secondaryLight,
            leadingWidth: MediaQuery.of(context).size.width * 0.2,
            leading: Row(
              children: [
                AppBackButton(),
              ],
            ),
            title: Text(
              'Let\'s know you',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40),
                    Text.rich(
                      TextSpan(
                        text: 'Height ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        children: [
                          if (height.roundToInt != 0)
                            TextSpan(
                              text: '(${height.roundTo2dp}\'\')',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.primaryDark),
                            ),
                        ],
                      ),
                    ),
                    Slider(
                      label: '${height.roundTo2dp}',
                      value: height,
                      min: 0,
                      max: 10,
                      onChanged: (value) {
                        setState(() {
                          height = value;
                        });
                        profileCubit.updateHeight(value); // Save in Cubit
                      },
                    ),
                    SizedBox(height: 15),
                    Text.rich(
                      TextSpan(
                        text: 'Weight ',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                        children: [
                          if (weight.roundToInt != 0)
                            TextSpan(
                              text: '(${weight.roundToInt}kg)',
                              style: TextStyle(
                                  fontSize: 12, color: AppColors.primaryDark),
                            ),
                        ],
                      ),
                    ),
                    Slider(
                      label: '${weight.roundToInt}',
                      value: weight,
                      min: 0,
                      max: 150,
                      onChanged: (value) {
                        setState(() {
                          weight = value;
                        });
                        profileCubit.updateWeight(value); // Save in Cubit
                      },
                    ),
                    SizedBox(height: 20),
                    Text('Body Type',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),
                    Wrap(
                      spacing: 15,
                      runSpacing: 10,
                      children: bodyTypeList.map((value) {
                        return AppRadioButton(
                          value: value,
                          groupValue: bodyType,
                          onChanged: (value) {
                            setState(() {
                              bodyType = value; // Update the selected body type
                              profileCubit
                                  .updateBodyType(value); // Save in Cubit
                            });
                          },
                          title: value,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Text('Complexion',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),

                    Wrap(
                      spacing: 15,
                      runSpacing: 10,
                      children: complexionList.map((value) {
                        return AppRadioButton(
                          value: value,
                          groupValue: complexion,
                          onChanged: (value) {
                            setState(() {
                              complexion = value;
                              profileCubit.updateComplexion(value);
                            });
                          },
                          title: value,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    Text('Marital Status',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
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
                              maritalStatus =
                                  value; // Update the selected body type
                              profileCubit
                                  .updateMaritalStatus(value); // Save in Cubit
                            });
                          },
                          title: value,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 20),
                    SizedBox(height: 20),
                    Text('Religion',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),

                    Wrap(
                      spacing: 15,
                      runSpacing: 10,
                      children: religionList.map((value) {
                        return AppRadioButton(
                          value: value,
                          groupValue: religion,
                          onChanged: (value) {
                            setState(() {
                              religion = value;
                              profileCubit
                                  .updateReligion(value); // Save in Cubit
                            });
                          },
                          title: value,
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 10),
                    Visibility(
                      visible: religion == 'Other',
                      child: InputField(
                        hintText: 'Other',
                        validator: (data) =>
                            religion == 'Other' ? isValidInput(data) : null,
                        onChanged: (value) =>
                            profileCubit.updateReligion(value),
                      ),
                    ),
                    SizedBox(height: 15),
                    Text('Interest, I’m looking for',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    SizedBox(height: 10),

                    BlocBuilder<ProfileCubit, ProfileState>(
                      builder: (context, state) {
                        if (state is ProfileCompositeState) {
                          // Extract the interest list from the state
                          final interestList = state
                              .userInterestsList; // Adjusted to access interests
                          // Create a list to hold selected IDs
                          List<dynamic> selectedIds = [];

                          return Wrap(
                            spacing: 15,
                            runSpacing: 10,
                            children: interestList.map(
                              (interestModel) {
                                // Check if the interest is selected based on its title
                                bool isActive =
                                    interest.contains(interestModel.title);

                                return AppMultipleSelectRadioButton(
                                  value: interestModel.title,
                                  // Use title as the value for comparison
                                  isActive: isActive,
                                  title: interestModel.title,
                                  onChanged: (selectedValue) {
                                    if (isActive) {
                                      // If the interest is already selected, remove it
                                      interest.remove(interestModel.title);
                                    } else {
                                      // If it's not selected, add it
                                      interest.add(interestModel.title);
                                    }

                                    // Update the list of selected IDs based on current interests
                                    selectedIds = interestList
                                        .where((model) =>
                                            interest.contains(model.title))
                                        .map((model) => model.id) // Map to IDs
                                        .toList();

                                    setState(() {
                                      // Pass the selected IDs to updateInterests
                                      profileCubit.updateInterests(selectedIds);
                                    });
                                  },
                                );
                              },
                            ).toList(),
                          );
                        }
                        return SizedBox
                            .shrink(); // Return a placeholder if no state matches
                      },
                    ),

                    SizedBox(height: 20),
                    Text('Occupation',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    DropdownInputField(
                      items: occupationList,
                      hintText: 'Select occupation',
                      onChanged: (value) =>
                          profileCubit.updateOccupation(value!),
                      validator: (value) => isValidInput(value),
                    ),
                    SizedBox(height: 10),
                    Text('Language',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    DropdownInputField(
                      items: languageList,
                      hintText: 'Select language',
                      onChanged: (value) => profileCubit.updateLanguages(value),
                      validator: (value) => isValidInput(value),
                    ),
                    SizedBox(height: 10),
                    Text('Origin Country',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    DropdownInputField(
                      value: selectedCountry,
                      hintText: 'Origin Country',
                      validator: (data) => isValidInput(data),
                      onChanged: (value) async {
                        if (value != null) {
                          setState(() {
                            selectedCountry = value;
                          });
                          profileCubit.updateOriginCountry(value);
                        }
                      },
                      items: allCountries,
                    ),
                    SizedBox(height: 10),
                    Text('Origin City',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    InputField(
                      hintText: 'Origin City',
                      onChanged: (value) =>
                          profileCubit.updateOriginCity(value),
                      validator: (value) => isValidInput(value),
                    ),

                    SizedBox(height: 10),
                    Text('Tagline',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    InputField(
                      hintText: 'Enter your tagline',
                      onChanged: (value) => profileCubit.updateTagline(value),
                      validator: (value) => isValidInput(value),
                    ),

                    SizedBox(height: 10),
                    Text('About Me',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w600)),
                    InputField(
                      hintText: 'Enter your bio',
                      minLine: 4,
                      maxLine: 5,
                      onChanged: (value) => profileCubit.updateAbout(value),
                      validator: (value) => isValidInput(value),
                    ),
                    SizedBox(height: 23),

                    // Submit Button
                    SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        title: 'Done',
                        state: state is ProfileLoadingState,
                        action: () async {
                          if (_formKey.currentState!.validate()) {
                            profileCubit.submitProfile(); // Submit the profile
                          }
                        },
                      ),
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
}
