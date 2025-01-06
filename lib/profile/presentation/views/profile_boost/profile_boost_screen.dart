import 'package:auto_route/annotations.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/common/lists.dart';
import 'package:zheeta/app/common/mixins/data_load_mixin.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/profile/data/model/user_profile_model.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/profile/presentation/widgets/post_bottom_sheet.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/close_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/media_container.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class ProfileBoostScreen extends StatefulWidget {
  const ProfileBoostScreen();

  @override
  _ProfileBoostScreenState createState() => _ProfileBoostScreenState();
}

class _ProfileBoostScreenState extends State<ProfileBoostScreen>
    with ValidationHelperMixin, AsyncDataLoaderMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();

  List<UserCarousels> selectedMedias = [];
  List<String> allCountries = [];
  final List<String> maritalStatusList = AppLists.maritalStatus;

  String? maritalStatus;

  final formKey = GlobalKey<FormState>();

  String selectedCountry = 'Any Country';
  String selectedGender = 'Male';
  String selectedMaritalStatus = 'Single';

  int calculatedCost = 0;

  @override
  void initState() {
    super.initState();
    initializeData();
  }

  Future<void> initializeData() async {
    allCountries =
    await loadCountries(); // Await the Future to get the List<String>
    setState(() {}); // Trigger UI update after loading
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: AppBackButton(),
        title: Text(
          'Promote Profile',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
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
              // key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          userPostsBottomSheet(context, 'gold', selectedMedias,
                              (List<UserCarousels> selectedImages) {
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
                            width: 80,
                            height: 80,
                            padding: EdgeInsets.all(12),
                            child: Center(
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: SvgPicture.asset(
                                          height: 12,
                                          width: 12,
                                          'assets/images/icons/add-media.svg'),
                                    ),
                                    TextSpan(
                                      text: ' Add',
                                      style: TextStyle(
                                          fontSize: 11,
                                          color: AppColors.primaryDark,
                                          fontWeight: FontWeight.w600),
                                    ),
                                    TextSpan(
                                      text: ' file',
                                      style: TextStyle(
                                        fontSize: 11,
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
                                  width: 80,
                                  height: 80,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    image: DecorationImage(
                                      image: NetworkImage(selectedMedias[index]
                                          .carouselPhotoUrl),
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
                    hintText: 'Write a caption (add hashtags if any)',
                    minLine: 4,
                    maxLine: 4,
                    // validator: validateTextField,
                  ),
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

                  DropdownInputField(
                    value: selectedGender,
                    hintText: 'Target Gender',
                    onChanged: (value) {
                      setState(() {
                        selectedGender = value!;
                      });
                    },
                    // validator: validateGenderField,
                    items: ['Male', 'Female'],
                  ),
                  InputField(
                    hintText: 'Target City',
                    onChanged: (value) => profileCubit.updateOriginCity(value),
                    validator: (value) => isValidInput(value),
                  ),

                  Row(
                    children: [
                      Expanded(
                        child: InputField(
                          hintText: 'Min Age',
                          onChanged: (value) =>
                              profileCubit.updateOriginCity(value),
                          validator: (value) => isValidInput(value),
                        ),
                      ),
                      SizedBox(width: 20),
                      Expanded(
                        child: InputField(
                          hintText: 'Max Age',
                          onChanged: (value) =>
                              profileCubit.updateOriginCity(value),
                          validator: (value) => isValidInput(value),
                        ),
                      ),
                    ],
                  ),
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
                        // Text(
                        //   'Total Matched Users: ${userProfileViewModel.matchedProfileBoostCount}',
                        //   style: TextStyle(
                        //     fontSize: 16,
                        //     fontWeight: FontWeight.w400,
                        //     color: AppColors.primaryDark,
                        //   ),
                        // ),
                      ],
                    ),
                  ),
                  InputField(
                    hintText: 'Manually Enter Number',
                    onChanged: (value) =>
                        profileCubit.updateOriginCity(value),
                    validator: (value) => isValidInput(value),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // BlocBuilder<ChargesCubit, ChargesState>(
                        //   builder: (context, state) {
                        //     return Text(
                        //       'Boost Charges',
                        //       style: TextStyle(
                        //         fontSize: 16,
                        //         fontWeight: FontWeight.w700,
                        //         color: AppColors.primaryDark,
                        //       ),
                        //     );
                        //   },
                        // ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/icons/zheeta-coin-light.svg',
                              height: 12,
                            ),
                            // BlocBuilder<ChargesCubit, ChargesState>(
                            //   builder: (context, state) {
                            //     if (state is ChargesSuccess) {
                            //       final boostPerDayCharge = state.charges.data
                            //           .firstWhere((charge) =>
                            //               charge.title ==
                            //               'Cost-Of-Boost-PerDay')
                            //           .amount;
                            //       return Text(
                            //         '${boostPerDayCharge}0/day',
                            //         style: TextStyle(
                            //           fontSize: 16,
                            //           fontWeight: FontWeight.w400,
                            //           color: AppColors.grayscale,
                            //         ),
                            //       );
                            //     } else {
                            //       return SizedBox.shrink();
                            //     }
                            //   },
                            // ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  InputField(
                    hintText: 'Duration (Days)',
                    onChanged: (value) =>
                        profileCubit.updateOriginCity(value),
                    validator: (value) => isValidInput(value),
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
                        // profileCubit.createProfileBoost(
                        // CreateProfileBoostRequest(
                        //     userId: userProfileViewModel.userId!,
                        //     targetCountry: selectedCountry,
                        //     targetGender: selectedGender,
                        //     targetCity: targetCityController.text,
                        //     minAge: int.tryParse(minAgeController.text)!,
                        //     maxAge: int.tryParse(maxAgeController.text)!,
                        //     maritalStatus: selectedMaritalStatus,
                        //     targetUsersNumber:
                        //         int.tryParse(manualNumberController.text)!,
                        //     duration:
                        //         int.tryParse(durationController.text)!,
                        //     adsCost: calculatedCost.toDouble(),
                        //     photoUrlForAds: selectedMedias
                        //         .map((media) =>
                        //             media.mediaCollectionURL[0] as String)
                        //         .toList(),
                        //     caption: captionController.text,
                        //   ),
                        //);
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
