import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http_parser/http_parser.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/image_picker.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/utils/token_utils.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/profile/domain/usecase/ref_usecases/user_profile_usecases.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/profile/presentation/widgets/profile_image_container.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loader.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

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

  final _formKey = GlobalKey<FormState>();
  File? _profilePicture;
  late int activeTab;

  double height = 5.0;
  double weight = 45;
  String? bodyType;
  String? complexion;
  String? religion;
  List<String> interest = [];

  final List<String> bodyTypeList = AppLists.bodyTypes;
  final List<String> complexionList = AppLists.complexions;
  final List<String> religionList = AppLists.religions;

  Future<void> _chooseImage() async {
    final pickedImage = await pickImageFromGallery(); // Use mixin method
    if (pickedImage != null) {
      setState(() {
        _profilePicture = pickedImage;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('No image selected')),
      );
    }
  }

  _clearImage() {
    setState(() {
      _profilePicture = null;
    });
  }

  @override
  void initState() {
    activeTab = widget.activeTab;
    loadInterests();
    super.initState();
  }

  Future<void> loadInterests() async {
    await context.read<ProfileCubit>().getInterestsCubit();
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
            BlocConsumer<ProfileCubit, ProfileState>(
              listener: (context, state) {},
              builder: (context, state) {
                if (state is ProfileLoadingCompositeState) {
                  return LoadingIndicator();
                } else if (state is ProfileCompositeState) {
                  final theUser = state.userProfile!.data;
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Center(
                              child: GestureDetector(
                                onTap: _chooseImage,
                                child: theUser?.profile?.profilePhotoURL == null
                                    ? buildImageContainer(
                                        'assets/images/photo-container.png',
                                        null)
                                    : _profilePicture != null
                                        ? ClipOval(
                                            child: Image.file(
                                              _profilePicture!,
                                              width: 100,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          )
                                        : buildImageContainer(
                                            theUser?.profile!.profilePhotoURL!,
                                            theUser?.profile!.profilePhotoURL),
                              ),
                            ),
                            SizedBox(height: 15),
                            Center(
                              child: Text(
                                _profilePicture != null
                                    ? 'Save new images'
                                    : 'Change Display Picture',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontWeight: FontWeight.w400,
                                    color: AppColors.white),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            SizedBox(height: 15),
                            Visibility(
                              visible: _profilePicture != null,
                              child: SizedBox(
                                height: 30,
                                width: MediaQuery.of(context).size.width / 0.9,
                                child: PrimaryButton(
                                  invert: true,
                                  title: 'Update',
                                  state: state is ProfileLoadingState,
                                  action: () async {
                                    final _userId = await TokenUtil.getUserId();
                                    if (_profilePicture != null) {
                                      context
                                          .read<ProfileCubit>()
                                          .updateUserProfilePictureCubit(
                                              UploadProfilePictureParam(
                                            userId: _userId!,
                                            file: await MultipartFile.fromFile(
                                                _profilePicture!.path,
                                                contentType:
                                                    MediaType('image', 'jpg')),
                                          ));
                                      _clearImage();
                                    } else {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                            content:
                                                Text('Please select a photo')),
                                      );
                                    }
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                } else {
                  return SizedBox.shrink();
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
      width: double.infinity,
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
      ),
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
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          SizedBox(height: 5),
          Text(
            text,
            style: TextStyle(
              color: isActive ? AppColors.grayscale : AppColors.grey,
              fontSize: 16,
              fontWeight: FontWeight.w600,
            ),
          ),
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
        if (state is! ProfileCompositeState) return SizedBox.shrink();
        final userProfile = state.userProfile?.data;
        final profile = userProfile?.profile;
        final user = userProfile?.profile?.user;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ..._buildProfileFields(userProfile, profile, user),
            _buildHeightSlider(profile?.height ?? 0),
            _buildWeightSlider(profile?.weight ?? 0),
            _buildRadioGroup(
              "Body Type",
              bodyTypeList,
              bodyType ?? '',
              (value) {
                setState(() => bodyType = value); // Update the local state
                profileCubit.updateBodyType(value); // Notify the cubit
              },
            ),
            _buildRadioGroup(
              "Complexion",
              complexionList,
              complexion ?? '',
              (value) {
                setState(() => complexion = value); // Update the local state
                profileCubit.updateComplexion(value); // Notify the cubit
              },
            ),
            _buildRadioGroup(
              "Religion",
              religionList,
              religion ?? '',
              (value) {
                setState(() => religion = value); // Update the local state
                profileCubit.updateReligion(value); // Notify the cubit
              },
            ),
            _buildUpdateButton(
                "Update Profile", () => profileCubit.updateProfile()),
          ],
        );
      },
    );
  }

  List<Widget> _buildProfileFields(userProfile, profile, user) {
    return [
      _buildTextField("First name", profile?.firstName,
          (value) => profileCubit.updateFirstName(value)),
      _buildTextField("Last name", profile?.lastName,
          (value) => profileCubit.updateLastName(value)),
      _buildTextField("Username", user?.userName,
          (value) => profileCubit.updateUserName(value)),
      _buildTextField("Email", user?.normalizedEmail?.toLowerCase(),
          (value) => profileCubit.updateEmail(value)),
      _buildTextField(
          "Phone Number",
          keyboardType: TextInputType.phone,
          "${user?.phoneCountryCode}${user?.phoneNumber}",
          (value) => profileCubit.updatePhoneNumber(value)),
      _buildTextField(
          "Bio", profile?.aboutMe, (value) => profileCubit.updateBio(value),
          minLines: 4, maxLines: 5),
      _buildTextField("Origin City", userProfile?.originAddress?.city,
          (value) => profileCubit.updateCity(value)),
      _buildTextField("Origin Country", userProfile?.originAddress?.country,
          (value) => profileCubit.updateCountry(value)),
    ];
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

  Widget _buildHeightSlider(double initialValue) {
    return _buildSlider(
      "Height ${height.toStringAsFixed(2)} ft", // Use the local state variable
      height, // Use the local state variable
      0,
      10,
      (value) {
        setState(() => height = value); // Update the state variable
        profileCubit.updateHeight(value); // Notify the cubit
      },
    );
  }

  Widget _buildWeightSlider(double initialValue) {
    return _buildSlider(
      "Weight ${weight.round()} kg", // Use the local state variable
      weight, // Use the local state variable
      0,
      150,
      (value) {
        setState(() => weight = value); // Update the state variable
        profileCubit.updateWeight(value); // Notify the cubit
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
          action: action,
        ),
      ),
    );
  }

  Widget _buildInterestSection() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is! ProfileCompositeState) return SizedBox.shrink();
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
            _buildUpdateButton(
                "Update Interests", () => profileCubit.updateProfile()),
          ],
        );
      },
    );
  }

  Widget _buildInterestsList() {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        if (state is! ProfileCompositeState) return SizedBox.shrink();
        final interests = state.userProfile?.data?.interests;

        // // // Ensure all interests are added by default
        // interests!.forEach((interestModel) {
        //   if (!interest.contains(interestModel.title)) {
        //     interest.add(interestModel.title);
        //   }
        // });
        return Wrap(
          spacing: 15,
          runSpacing: 10,
          children: interests!.map((interestModel) {
            bool isActive = interest.contains(interestModel.title);
            return AppMultipleSelectRadioButton(
              borderColor: AppColors.white.withOpacity(0.8),
              activeColor: AppColors.white,
              textColor: AppColors.white,
              value: interestModel.title!,
              isActive: isActive,
              title: interestModel.title,
              onChanged: (selectedValue) {
                setState(() {
                  if (isActive)
                    interest.remove(interestModel.title);
                  else
                    interest.add(interestModel.title!);
                  profileCubit.updateInterests(interests
                      .where((model) => interest.contains(model.title))
                      .map((model) => model.interestId)
                      .toList());
                });
              },
            );
          }).toList(),
        );
      },
    );
  }
}
