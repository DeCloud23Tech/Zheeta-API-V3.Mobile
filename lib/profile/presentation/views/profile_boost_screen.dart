import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

import '../../../activity/data/models/activity_model.dart';
import '../../../app/injection/di.dart';
import '../../../widgets/close_button.dart';
import '../../../widgets/media_container.dart';
import '../../data/request/create_profile_boost_request.dart';
import '../viewmodel/user_profile_viewmodel.dart';

@RoutePage()
class ProfileBoostScreen extends StatefulWidget {
  const ProfileBoostScreen({Key? key}) : super(key: key);

  @override
  _ProfileBoostScreenState createState() => _ProfileBoostScreenState();
}

class _ProfileBoostScreenState extends State<ProfileBoostScreen> {
  late UserProfileViewModel userProfileViewModel;
  List<ActivityModel> selectedMedias = [];
  final formKey = GlobalKey<FormState>();

  String selectedCountry = '';
  String selectedGender = 'Male';
  String selectedMaritalStatus = 'Single';

  final captionController = TextEditingController();
  final targetCityController = TextEditingController();
  final minAgeController = TextEditingController();
  final maxAgeController = TextEditingController();
  final manualNumberController = TextEditingController();
  final durationController = TextEditingController();

  int calculatedCost = 0;

  @override
  void initState() {
    super.initState();
    userProfileViewModel = locator<UserProfileViewModel>();
    loadCountryData();
    // Add a listener to the durationController to update the cost in real-time
    durationController.addListener(_updateCost);
  }

  void loadCountryData() async {
    await userProfileViewModel.loadCountry();
    setState(() {
      selectedCountry = 'United States';
    });
  }

  void _updateCost() {
    setState(() {
      calculatedCost = (int.tryParse(durationController.text) ?? 0) * 11;
    });
  }

  String? validateTextField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    return null;
  }

  String? validateNumberField(String? value) {
    if (value == null || value.isEmpty) {
      return 'This field is required';
    }
    if (int.tryParse(value) == null) {
      return 'Please enter a valid number';
    }
    return null;
  }

  String? validateCountryField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a country';
    }
    return null;
  }

  String? validateGenderField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a gender';
    }
    return null;
  }

  String? validateMaritalStatusField(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please select a marital status';
    }
    return null;
  }

  @override
  void dispose() {
    targetCityController.dispose();
    minAgeController.dispose();
    maxAgeController.dispose();
    manualNumberController.dispose();
    durationController.removeListener(_updateCost);
    durationController.dispose();
    captionController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: EdgeInsets.all(5),
              height: 30,
              width: 30,
              decoration: BoxDecoration(
                color: AppColors.white,
                borderRadius: BorderRadius.circular(100),
              ),
              child: Icon(Icons.arrow_back_ios_new, color: AppColors.grey),
            ),
          ),
        ),
        title: Text(
          'Promote Profile',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 24,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          userPostsBottomSheet(context, selectedMedias,
                              (List<ActivityModel> selectedImages) {
                            setState(() {
                              selectedMedias = selectedImages;
                            });
                          });
                        },
                        child: DottedBorder(
                          dashPattern: [8, 4],
                          strokeWidth: 1.5,
                          color: AppColors.grey.withOpacity(0.5),
                          strokeCap: StrokeCap.round,
                          borderType: BorderType.RRect,
                          radius: Radius.circular(10),
                          child: Container(
                            color: AppColors.white,
                            width: 100,
                            height: 100,
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: SvgPicture.asset(
                                          'assets/images/icons/add-media.svg'),
                                    ),
                                    TextSpan(
                                      text: ' Add',
                                      style: TextStyle(
                                          color: AppColors.primaryDark,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' file',
                                      style: TextStyle(
                                        color: AppColors.grey,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 15),
                      Expanded(
                        child: Wrap(
                          spacing: 10,
                          runSpacing: 10,
                          children:
                              List.generate(selectedMedias.length, (index) {
                            return Stack(
                              children: [
                                Container(
                                  width: 100,
                                  height: 100,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(selectedMedias[index]
                                          .mediaCollectionURL[0]),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  top: 0,
                                  right: 0,
                                  child: GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        selectedMedias.removeAt(index);
                                      });
                                    },
                                    child: Container(
                                      padding: EdgeInsets.all(4),
                                      decoration: BoxDecoration(
                                        color: AppColors.white,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        Icons.close,
                                        color: AppColors.grey,
                                        size: 10,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            );
                          }),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  InputField(
                    controller: captionController,
                    hintText: 'Write a caption (add hashtags if any)',
                    minLine: 4,
                    maxLine: 4,
                    validator: validateTextField,
                    onChanged: (value) {},
                  ),
                  DropdownInputField(
                    value: selectedCountry,
                    hintText: 'Target Country',
                    onChanged: (value) {
                      setState(() {
                        selectedCountry = value!;
                        userProfileViewModel.setCountry(value);
                        userProfileViewModel.loadSelectedCountryStates(value,
                            clearState: true);
                      });
                    },
                    validator: validateCountryField,
                    items: userProfileViewModel.allCountries.isNotEmpty
                        ? userProfileViewModel.allCountries
                        : [],
                  ),
                  DropdownInputField(
                    value: selectedGender,
                    hintText: 'Target Gender',
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                    validator: validateGenderField,
                    items: ['Male', 'Female'],
                  ),
                  InputField(
                    controller: targetCityController,
                    hintText: 'Target City',
                    validator: validateTextField,
                    onChanged: (value) {},
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          controller: minAgeController,
                          hintText: 'Min Age',
                          validator: validateNumberField,
                          onChanged: (value) {},
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: InputField(
                          controller: maxAgeController,
                          hintText: 'Max Age',
                          validator: validateNumberField,
                          onChanged: (value) {},
                        ),
                      ),
                    ],
                  ),
                  DropdownInputField(
                    value: selectedMaritalStatus,
                    hintText: 'Marital Status',
                    onChanged: (value) {
                      setState(() {
                        selectedMaritalStatus = value!;
                      });
                    },
                    validator: validateMaritalStatusField,
                    items: [
                      'Single',
                      'Married',
                      'Divorced',
                      'Widowed',
                      'Separated',
                      'Other'
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Icon(
                              Icons.check_circle_outline,
                              color: AppColors.primaryDark,
                              size: 30,
                            ),
                            Text(
                              ' Target all',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grayscale,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          'Total Matched Users: ${userProfileViewModel.matchedProfileBoostCount}',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: AppColors.primaryDark,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InputField(
                    controller: manualNumberController,
                    hintText: 'Manually Enter Number',
                    validator: validateNumberField,
                    onChanged: (value) {},
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Boost Charges',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                            color: AppColors.primaryDark,
                          ),
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/icons/zheeta-coin-light.svg',
                              height: 12,
                            ),
                            Text(
                              '11/day',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w400,
                                color: AppColors.grayscale,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InputField(
                    controller: durationController,
                    hintText: 'Duration (Days)',
                    validator: validateNumberField,
                    onChanged: (value) {},
                  ),
                  SizedBox(height: 15),
                  Divider(color: AppColors.grey.withOpacity(0.5)),
                  SizedBox(height: 10),
                  Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'Total Promotion cost',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                          color: AppColors.primaryDark,
                        ),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/icons/zheeta-coin-bold.svg',
                            height: 12,
                          ),
                          Text(
                            '${calculatedCost}',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                              color: AppColors.grayscale,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    title: 'Boost Profile',
                    action: () {
                      if (formKey.currentState!.validate()) {
                        context.read<ProfileCubit>().createProfileBoostCubit(
                              CreateProfileBoostRequest(
                                  userId: userProfileViewModel.userId!,
                                  targetCountry: selectedCountry,
                                  targetGender: selectedGender,
                                  targetCity: targetCityController.text,
                                  minAge: int.tryParse(minAgeController.text)!,
                                  maxAge: int.tryParse(maxAgeController.text)!,
                                  maritalStatus: selectedMaritalStatus,
                                  targetUsersNumber: int.tryParse(
                                      manualNumberController.text)!,
                                  duration:
                                      int.tryParse(durationController.text)!,
                                  adsCost: calculatedCost.toDouble(),
                                  photoUrlForAds: selectedMedias
                                      .map((media) =>
                                          media.mediaCollectionURL[0] as String)
                                      .toList(),
                                  userCount: 10,
                                  caption: captionController
                                      .text // Explicitly cast to String
                                  ),
                            );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class UserPostsBottomSheetView extends StatefulWidget {
  final Function(List<ActivityModel>) onSelect;
  List<ActivityModel> selectedMedias;

  UserPostsBottomSheetView({
    Key? key,
    required this.selectedMedias,
    required this.onSelect,
  }) : super(key: key);

  @override
  _UserPostsBottomSheetViewState createState() =>
      _UserPostsBottomSheetViewState();
}

class _UserPostsBottomSheetViewState extends State<UserPostsBottomSheetView> {
  late UserProfileViewModel userProfileViewModel;

  @override
  Widget build(BuildContext context) {
    userProfileViewModel = locator<UserProfileViewModel>();

    return Container(
      decoration: const BoxDecoration(
        color: Color(0xffFFF1F7),
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15), topRight: Radius.circular(15)),
      ),
      child: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 50,
                height: 4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2),
                    color: Color(0xffDADADA)),
              ),
            ),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                AppCloseButton(),
                Flexible(
                  child: Text(
                    'Select Media for Promote profile',
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 20),
              ],
            ),
            SizedBox(height: 5),
            Divider(color: AppColors.grey.withOpacity(0.5)),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 0, horizontal: 20),
              child: SelectPostsWidget(
                medias: userProfileViewModel.userActivityModel?.data,
                selectedMedias: widget.selectedMedias,
                onSelectionChanged: (selectedMedias) {
                  setState(() {
                    widget.selectedMedias = selectedMedias;
                  });
                },
              ),
            ),
            Visibility(
              visible: widget.selectedMedias.length != 0,
              child: Container(
                color: AppColors.secondarySwirl,
                height: 70,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: widget.selectedMedias.length,
                            itemBuilder: (context, index) {
                              final media = widget.selectedMedias[index];
                              return Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(8),
                                  child: Image.network(
                                    media.mediaCollectionURL.isNotEmpty
                                        ? media.mediaCollectionURL[0]
                                        : 'assets/images/placeholder.png',
                                    height: 54,
                                    width: 54,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      IconButton(
                        onPressed: () {
                          widget.onSelect(widget.selectedMedias);
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          size: 48,
                          Icons.check_circle,
                          color: AppColors.primaryDark,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class SelectPostsWidget extends StatefulWidget {
  final bool isVideo;
  final List<ActivityModel>? medias;
  final List<ActivityModel> selectedMedias;
  final Function(List<ActivityModel>) onSelectionChanged;

  const SelectPostsWidget({
    Key? key,
    this.isVideo = false,
    required this.medias,
    required this.selectedMedias,
    required this.onSelectionChanged,
  }) : super(key: key);

  @override
  _SelectPostsWidgetState createState() => _SelectPostsWidgetState();
}

class _SelectPostsWidgetState extends State<SelectPostsWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20),
      child: SizedBox(
        width: double.infinity,
        child: Wrap(
          runSpacing: 10,
          alignment: WrapAlignment.spaceBetween,
          children: widget.medias!
              .map(
                (e) => GestureDetector(
                  onTap: () {
                    setState(() {
                      if (widget.selectedMedias.contains(e)) {
                        widget.selectedMedias.remove(e);
                      } else {
                        widget.selectedMedias.add(e);
                      }
                      widget.onSelectionChanged(widget.selectedMedias);
                    });
                  },
                  child: Stack(
                    children: [
                      if (e.mediaCollectionURL != null &&
                          e.mediaCollectionURL.isNotEmpty)
                        MediaContainer(mediaPath: e.mediaCollectionURL[0]),
                      if (widget.selectedMedias.contains(e))
                        Positioned(
                          bottom: 0,
                          right: 8,
                          child: Container(
                            padding: EdgeInsets.all(2),
                            decoration: BoxDecoration(
                              color: AppColors.primaryDark,
                              shape: BoxShape.circle,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(7.0),
                              child: Text(
                                // Show the selection order
                                (widget.selectedMedias.indexOf(e) + 1)
                                    .toString(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}

Future userPostsBottomSheet(
    BuildContext context,
    List<ActivityModel> selectedMedias,
    Function(List<ActivityModel>) onSelect) {
  return showModalBottomSheet(
    context: context,
    isDismissible: false,
    isScrollControlled: true,
    constraints: BoxConstraints(
      minHeight: MediaQuery.of(context).size.height * 0.47,
      maxHeight: MediaQuery.of(context).size.height * 0.9,
    ),
    backgroundColor: Colors.transparent,
    builder: (context) {
      return UserPostsBottomSheetView(
        selectedMedias: selectedMedias,
        onSelect: onSelect,
      );
    },
  );
}
