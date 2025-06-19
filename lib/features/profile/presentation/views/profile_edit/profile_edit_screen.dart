import 'dart:io';
import 'package:auto_route/annotations.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/lists.dart';
import 'package:zheeta/common/extensions/string_extension.dart';
import 'package:zheeta/common/mixins/image_picker.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/profile/data/request/update_user_interest_request.dart';
import 'package:zheeta/features/profile/data/request/update_user_profile_request.dart';
import 'package:zheeta/features/profile/domain/usecase/user_profile_usecases.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_edit_cubit/profile_edit_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_interest_cubit/profile_interest_cubit.dart';
import 'package:zheeta/features/profile/presentation/widgets/profile_image_selection.dart';
import 'package:zheeta/utils/format_utils.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';
import 'package:zheeta/utils/token_utils.dart';
import 'package:http_parser/http_parser.dart' as http_parser;

@RoutePage()
class ProfileEditScreen extends StatefulWidget {
  final int activeTab;

  const ProfileEditScreen({super.key, required this.activeTab});

  @override
  State<ProfileEditScreen> createState() => _ProfileEditScreenState();
}

class _ProfileEditScreenState extends State<ProfileEditScreen>
    with ValidationHelperMixin, ImagePickerMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();
  final ProfileEditCubit profileEditCubit = locator<ProfileEditCubit>();
  final ProfileInterestCubit profileInterestCubit =
      locator<ProfileInterestCubit>();

  final _formKey = GlobalKey<FormState>();
  File? _profilePicture;
  late int activeTab;

  String? firstName,
      lastName,
      userName,
      email,
      phoneNumber,
      bio,
      originCity,
      originCountry,
      bodyType,
      complexion,
      religion,
      customReligion;

  double height = 0.0;
  double weight = 0;
  List<String> interest = [];
  List<String> interests = [];
  List<dynamic> selectedIds = [];

  @override
  void initState() {
    super.initState();
    activeTab = widget.activeTab;
    profileInterestCubit.getInterestsCubit();
  }

  Future<void> _chooseImage() async {
    final pickedImage = await pickImageFromGallery();
    if (pickedImage != null) {
      setState(() {
        _profilePicture = pickedImage;
      });
    } else {
      NotifyUser.showSnackBar('No image selected.');
    }
  }

  _clearImage() {
    setState(() {
      _profilePicture = null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryDark,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.primaryDark,
        surfaceTintColor: AppColors.secondaryLight,
        scrolledUnderElevation: 0.5,
        shadowColor: Colors.grey,
        leadingWidth: MediaQuery.of(context).size.width * 0.2,
        leading: Row(
          children: [
            AppBackButton(),
          ],
        ),
        title: Text(
          'Edit Profile',
          style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: AppColors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                if (state is ProfileLoadedState) {
                  final theUser = state.profile!.data;
                  final profile = state.profile?.data?.profile;

                  height = profile?.height.toDouble();
                  weight = profile?.weight.toDouble();
                  bodyType = profile?.bodyType;
                  complexion = profile?.complexion;
                  religion = profile?.religion;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: Form(
                      key: _formKey,
                      child: BlocListener<ProfileEditCubit, ProfileEditState>(
                        listener: (context, state) {
                          if (state is ProfilePictureUpdateSuccess) {
                            profileCubit.getSingleUserProfileCubit();
                          } else if (state is ProfileUpdateError) {
                            NotifyUser.showSnackBar(state.errorMessage);
                          }
                        },
                        child: ProfileImageSection(
                          profilePhotoUrl: theUser?.profile?.profilePhotoURL,
                          profilePicture: _profilePicture,
                          onChooseImage: _chooseImage,
                          onUpdate: () async {
                            final userId = await TokenUtil.getUserId();
                            if (_profilePicture != null) {
                              profileEditCubit.updateUserProfilePictureCubit(
                                UploadProfilePictureParam(
                                  userId: userId!,
                                  file: await MultipartFile.fromFile(
                                    _profilePicture!.path,
                                    contentType:
                                        http_parser.MediaType('image', 'jpg'),
                                  ),
                                ),
                              );
                              _clearImage();
                            } else {
                              NotifyUser.showSnackBar('Please select a photo');
                            }
                          },
                        ),
                      ),
                    ),
                  );
                } else {
                  return loadingIndicator();
                }
              },
            ),
            _buildTabBar(),
            SizedBox(height: 20),
            _buildTabContent()
          ],
        ),
      ),
    );
  }

  Widget _buildTabBar() {
    return Container(
      height: 40,
      decoration: BoxDecoration(
          color: AppColors.white, borderRadius: BorderRadius.circular(8)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _buildTabButton(1, "Profile"),
          _buildTabButton(2, "Interests"),
        ],
      ),
    );
  }

  Widget _buildTabButton(int tabIndex, String text) {
    bool isActive = activeTab == tabIndex;
    return GestureDetector(
      onTap: () => setState(() => activeTab = tabIndex),
      child: Column(
        children: [
          Container(
            height: 3,
            width: MediaQuery.of(context).size.width * 0.44,
            decoration: BoxDecoration(
                color: isActive ? AppColors.primaryDark : Colors.transparent,
                borderRadius: BorderRadius.circular(8)),
          ),
          SizedBox(height: 5),
          Text(text,
              style: TextStyle(
                  color: isActive ? AppColors.primaryDark : AppColors.grey,
                  fontSize: 16,
                  fontWeight: FontWeight.w600)),
        ],
      ),
    );
  }

  Widget _buildTabContent() {
    return activeTab == 1 ? _buildProfileSection() : _buildInterestSection();
  }

  Widget _buildProfileSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is! ProfileLoadedState) return loadingIndicator();
        final profile = state.profile?.data?.profile;
        final userProfile = state.profile?.data;

        return BlocListener<ProfileEditCubit, ProfileEditState>(
          listener: (context, state) {
            if (state is ProfileUpdateSuccess) {
              profileCubit.getSingleUserProfileCubit();
            } else if (state is ProfileUpdateError) {
              NotifyUser.showSnackBar(state.errorMessage);
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildTextField("First name", profile?.firstName, (value) {
                setState(() => firstName = value);
              }),
              _buildTextField("Last name", profile?.lastName, (value) {
                setState(() => lastName = value);
              }),
              _buildTextField("Username", userProfile?.user?.userName, (value) {
                setState(() => userName = value);
              }),
              // _buildTextField(
              //     "Email", profile?.user?.normalizedEmail.toLowerCase(), (value) {
              //   setState(() => email = value);
              // }),
              // _buildTextField(
              //     "Phone Number",
              //     keyboardType: TextInputType.phone,
              //     "${profile?.user?.phoneCountryCode}${profile?.user?.phoneNumber}",
              //         (value) {
              //       setState(() => phoneNumber = value);
              //     }),
              _buildTextField("Bio", profile?.aboutMe, (value) {
                setState(() => bio = value);
              }, minLines: 4, maxLines: 5),
              _buildTextField("Origin City", profile?.originAddress?.city,
                  (value) {
                setState(() => originCity = value);
              }),
              _buildTextField("Origin Country", profile?.originAddress?.country,
                  (value) {
                setState(() => originCountry = value);
              }),
              _buildHeightSlider(),
              _buildWeightSlider(),
              _buildRadioGroup("Body Type", AppLists.bodyTypes, bodyType ?? '',
                  (value) {
                setState(() => bodyType = value);
              }),
              _buildRadioGroup(
                  "Complexion", AppLists.complexions, complexion ?? '',
                  (value) {
                setState(() => complexion = value);
              }),
              _buildRadioGroup("Religion", AppLists.religions, religion ?? '',
                  (value) {
                setState(() => religion = value);
              }),
              Visibility(
                visible: religion == 'Other',
                child: InputField(
                  hintText: 'Specify',
                  validator: isValidInput,
                  onChanged: (value) => customReligion = value,
                ),
              ),
              _buildUpdateButton("Update Profile", () {
                final selectedReligion = religion == 'Other' ? customReligion : religion;

                // Constructing the UpdateUserProfileRequest object with non-null values
                final updatedProfile = UpdateUserProfileRequest(
                  userId: userProfile?.user?.userId,
                  firstName: firstName ?? profile?.firstName,
                  lastName: lastName ?? profile?.firstName,
                  userName: userName ?? userProfile?.user?.userName,
                  aboutMe: bio ?? profile?.aboutMe,
                  originCity: originCity ?? profile?.originAddress?.city,
                  originCountry:
                      originCountry ?? profile?.originAddress?.country,
                  height: height.toStringAsFixed(2).toDouble,
                  weight: weight.toStringAsFixed(0).toDouble,
                  bodyType: bodyType ?? profile?.bodyType,
                  complexion: complexion ?? profile?.complexion,
                  religion: selectedReligion ?? profile?.religion,
                  dateOfBirth: formatDateOfBirth(profile?.dateOfBirth),
                  gender: profile?.gender,
                  languageCSV: profile?.languageCSV,
                  occupation: profile?.occupation,
                  tagline: profile?.tagline,
                  state: profile?.residentialAddress?.state,
                  city: profile?.residentialAddress?.city,
                  country: profile?.residentialAddress?.country,
                );

                print('Updated Profile: $updatedProfile');
                // Send the updated values to the cubit
                profileEditCubit.updateUserProfileCubit(updatedProfile);
              }),
            ],
          ),
        );
      },
    );
  }

  Widget _buildTextField(
      String label, String? hint, Function(String)? onChanged,
      {int minLines = 1,
      int maxLines = 1,
      TextInputType keyboardType = TextInputType.text}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label,
            style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w300,
                color: AppColors.white)),
        InputField(
          keyboardType: keyboardType,
          hintText: hint,
          onChanged: onChanged,
          minLine: minLines,
          maxLine: maxLines,
          validator: (data) => isValidInput(data),
          suffixIcon: Icon(Icons.edit_outlined, color: AppColors.grey),
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _buildHeightSlider() {
    return _buildSlider(
      "Height ${height.toStringAsFixed(2)} ft",
      height, // Use the local state variable
      0,
      10,
      (value) {
        setState(() => height = value); // Update the state variable
      },
    );
  }

  Widget _buildWeightSlider() {
    return _buildSlider(
      "Weight ${weight.round()} kg", // Use the local state variable
      weight, // Use the local state variable
      0,
      150,
      (value) {
        setState(() => weight = value); // Update the state variable
      },
    );
  }

  Widget _buildSlider(
    String label,
    double value,
    double min,
    double max,
    Function(double) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w300,
            color: AppColors.white,
          ),
        ),
        Slider(
          label: label,
          value: value,
          min: min,
          max: max,
          activeColor: AppColors.secondaryLight,
          inactiveColor: AppColors.white.withOpacity(0.3),
          onChanged: onChanged,
        ),
        SizedBox(height: 25),
      ],
    );
  }

  Widget _buildRadioGroup(String label, List<String> options,
      String selectedValue, Function(String) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.white,
          ),
        ),
        SizedBox(height: 10),
        Wrap(
          spacing: 15,
          runSpacing: 10,
          children: options.map((value) {
            return AppRadioButton(
              borderColor: AppColors.white.withOpacity(0.8),
              activeColor: AppColors.white,
              textColor: AppColors.white,
              value: value,
              groupValue: selectedValue,
              onChanged: (newValue) {
                setState(() {
                  selectedValue = newValue; // Update local state
                });
                onChanged(newValue); // Notify the cubit
              },
              title: value,
            );
          }).toList(),
        ),
        SizedBox(height: 20),
      ],
    );
  }

  Widget _buildUpdateButton(String title, VoidCallback action) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 24),
        padding: EdgeInsets.symmetric(vertical: 8),
        height: 50,
        width: MediaQuery.of(context).size.width * 0.38,
        child: PrimaryButton(
            color: AppColors.secondaryLight,
            invert: true,
            title: title,
            fontSize: 12,
            action: action),
      ),
    );
  }

  Widget _buildInterestSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is! ProfileLoadedState) return loadingIndicator();
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Interests",
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.white)),
            SizedBox(height: 10),
            _buildInterestsList(),
            _buildUpdateButton("Update Interests", () {
              if (selectedIds.isEmpty) {
                NotifyUser.showSnackBar("Please select at least one interest.");
                return;
              }

              final selectedInterestIds =
                  selectedIds.map<int>((e) => e as int).toList();

              profileInterestCubit.updateUserInterestCubit(
                request: UpdateUserInterestRequest(
                  userId: profileCubit.state.profile?.data?.user?.userId,
                  interestIds: selectedInterestIds,
                ),
              );
            }),
          ],
        );
      },
    );
  }

  Widget _buildInterestsList() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        if (profileState is! ProfileLoadedState) return loadingIndicator();

        // Extract user's selected interest IDs from profile
        final userSelectedIds =
            profileState.profile?.data?.interests?.map((i) => i.id).toList() ??
                [];

        return BlocConsumer<ProfileInterestCubit, ProfileInterestState>(
          listener: (context, state) {
            if (state is ProfileInterestUpdated) {
              profileCubit.getSingleUserProfileCubit();
              profileInterestCubit.getInterestsCubit();
            } else if (state is ProfileInterestUpdateError) {
              NotifyUser.showSnackBar(state.errorMessage);
            }
          },
          builder: (context, interestState) {
            if (interestState is ProfileInterestLoading) {
              return SpinKitWave(
                color: AppColors.white,
                size: 20.0,
              );
            } else if (interestState is ProfileInterestLoaded) {
              final interestList = interestState.userInterestsList;

              // Ensure selectedIds is initialized once with user's interests
              if (selectedIds.isEmpty) {
                selectedIds.addAll(userSelectedIds);
              }

              return Wrap(
                spacing: 15,
                runSpacing: 10,
                children: interestList.map((interestModel) {
                  // Check if interestModel.id is in selectedIds
                  bool isActive = selectedIds.contains(interestModel.id);

                  return AppMultipleSelectRadioButton(
                    borderColor: AppColors.white.withOpacity(0.8),
                    activeColor: AppColors.white,
                    textColor: AppColors.white,
                    value: interestModel.id.toString(),
                    // Use ID as the value
                    isActive: isActive,
                    title: interestModel.title,
                    // Still display the title
                    onChanged: (selectedValue) {
                      setState(() {
                        if (isActive) {
                          selectedIds.remove(interestModel.id);
                        } else {
                          selectedIds.add(interestModel.id);
                        }
                      });
                    },
                  );
                }).toList(),
              );
            } else if (interestState is ProfileInterestError) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Failed to load interests.\nPlease try again.',
                    style: TextStyle(color: Colors.red, fontSize: 14),
                  ),
                  SizedBox(height: 10),
                  InkWell(
                    onTap: () {
                      profileInterestCubit.getInterestsCubit();
                    },
                    child: Text(
                      'Retry',
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
        );
      },
    );
  }
}
