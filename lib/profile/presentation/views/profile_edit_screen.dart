import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

import '../../../app/common/color.dart';
import '../widgets/profile_image_container.dart';

@RoutePage()
class ProfileEditScreen extends ConsumerStatefulWidget {
  const ProfileEditScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<ProfileEditScreen> {
  double height = 0;
  double weight = 0;
  String? bodyType;
  String? complexion;
  String? religion;
  List<String> interest = [];
  List<String>? languages;
  // late UserProfileViewModel userProfileViewModel;
  // late UserInterestViewModel userInterestViewModel;
  late TextEditingController languagesController;

  final formKey = GlobalKey<FormState>();

  File? _image;

  final picker = ImagePicker();

  Future _chooseImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
      // userProfileViewModel.setProfilePicture(_image!);
    }
  }

  @override
  void initState() {
    // userProfileViewModel = ref.read(userProfileViewModelProvider.notifier);
    // userInterestViewModel = ref.read(userInterestViewModelProvider.notifier);
    languagesController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userInterestState = ref.watch(userInterestViewModelProvider);
    // final userProfileState = ref.watch(userProfileViewModelProvider);
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
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 40),
                Center(
                  child: GestureDetector(
                    onTap: _chooseImage,
                    child: _image == null
                        ? buildImageContainer(
                            'assets/images/photo-container.png')
                        : buildImageContainer(_image!.path),
                  ),
                ),
                SizedBox(height: 15),
                Center(
                  child: Text(
                    'Change Display Picture',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'First name',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'First name',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Last name',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Last name',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Username',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Username',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Email',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Email',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Phone Number',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Phone Number',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Bio',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Bio',
                  minLine: 4,
                  maxLine: 5,
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Origin City',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Origin City',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text(
                  'Origin Country',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                InputField(
                  hintText: 'Origin Country',
                  suffixIcon: Icon(
                    Icons.edit_outlined,
                    color: AppColors.grey,
                  ),
                ),
                SizedBox(height: 10),
                Text.rich(
                  TextSpan(
                    text: 'Height ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                    children: [
                      if (height.roundToInt != 0)
                        TextSpan(
                          text: '(${height.roundTo2dp}\'\')',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Slider(
                  label: '${height.roundTo2dp}',
                  value: height,
                  activeColor: AppColors.white,
                  inactiveColor: AppColors.white.withOpacity(0.3),
                  thumbColor: AppColors.white.withOpacity(0.5),
                  min: 0,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                    // userProfileViewModel.setHeight(value);
                  },
                ),
                SizedBox(height: 25),
                Text.rich(
                  TextSpan(
                    text: 'Weight ',
                    style: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: AppColors.white),
                    children: [
                      if (weight.roundToInt != 0)
                        TextSpan(
                          text: '(${weight.roundToInt}kg)',
                          style: TextStyle(
                              fontSize: 12,
                              color: AppColors.white,
                              fontWeight: FontWeight.w400),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Slider(
                  label: '${weight.roundToInt}',
                  value: weight,
                  activeColor: AppColors.white,
                  inactiveColor: AppColors.white.withOpacity(0.3),
                  thumbColor: AppColors.white.withOpacity(0.5),
                  min: 0,
                  max: 150,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                    // userProfileViewModel.setWeight(value);
                  },
                ),
                SizedBox(height: 25),
                Text(
                  'Body Type',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                SizedBox(height: 10),
                // Wrap(
                //   direction: Axis.horizontal,
                //   children: userProfileViewModel.bodyTypeList.map((value) {
                //     return AppRadioButton(
                //       value: value,
                //       borderColor: AppColors.white,
                //       backgroundColor: AppColors.white,
                //       groupValue: bodyType ?? '',
                //       onChanged: (value) {
                //         setState(() {
                //           bodyType = value;
                //         });
                //         userProfileViewModel.setBodyType(value);
                //       },
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 25),
                Text(
                  'Complexion',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                SizedBox(height: 10),
                // Wrap(
                //   direction: Axis.horizontal,
                //   children: userProfileViewModel.complexionList.map((value) {
                //     return AppRadioButton(
                //       value: value,
                //       borderColor: AppColors.white,
                //       backgroundColor: AppColors.white,
                //       groupValue: complexion ?? '',
                //       onChanged: (value) {
                //         setState(() {
                //           complexion = value;
                //         });
                //         userProfileViewModel.setComplexion(value);
                //       },
                //     );
                //   }).toList(),
                // ),
                SizedBox(height: 25),
                Text(
                  'Religion',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                SizedBox(height: 10),
                // Wrap(
                //   direction: Axis.horizontal,
                //   children: userProfileViewModel.religionList.map((value) {
                //     return AppRadioButton(
                //       value: value,
                //       borderColor: AppColors.white,
                //       backgroundColor: AppColors.white,
                //       groupValue: religion ?? '',
                //       onChanged: (value) {
                //         setState(() {
                //           religion = value;
                //         });
                //         userProfileViewModel.setReligion(value);
                //       },
                //     );
                //   }).toList(),
                // ),
                if (religion == 'Other') SizedBox(height: 5),
                if (religion == 'Other')
                  InputField(
                    hintText: 'Other',
                    // onChanged: (value) =>
                    //     userProfileViewModel.setReligion(value),
                  ),
                SizedBox(height: 15),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: SizedBox(
                //     width: MediaQuery.of(context).size.width * .4,
                //     height: 30,
                //     child: PrimaryButton(
                //       title: 'Update Profile',
                //       color: AppColors.white.withOpacity(0.9),
                //       invert: true,
                //       state: userProfileState.createUserProfileState.isLoading,
                //       action: () async {
                //         if (formKey.currentState!.validate()) {
                //           final isCreated =
                //           await userProfileViewModel.createUserProfile();
                //           if (isCreated) router.push(ProfilePhotoRoute());
                //         }
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(height: 15),
                Divider(color: AppColors.white),
                SizedBox(height: 25),
                Text(
                  'Interest',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: AppColors.white),
                ),
                SizedBox(height: 10),
                // Wrap(
                //   direction: Axis.horizontal,
                //   children: userInterestState.getInterestState.data?.data
                //           .map((value) {
                //         return AppMultipleSelectRadioButton(
                //           value: value.title,
                //           borderColor: AppColors.white,
                //           backgroundColor: AppColors.white,
                //           isActive: interest.contains(value.title),
                //           onChanged: (value) {
                //             if (interest.contains(value)) {
                //               interest.remove(value);
                //             } else {
                //               interest.add(value);
                //             }
                //             setState(() {});
                //             userInterestViewModel.setInterest(
                //               userInterestState.getInterestState.data!.data
                //                   .firstWhere((element) {
                //                 return element.title == value;
                //               }).id,
                //             );
                //           },
                //         );
                //       }).toList() ??
                //       [],
                // ),
                SizedBox(height: 15),
                // Align(
                //   alignment: Alignment.bottomRight,
                //   child: SizedBox(
                //     width: MediaQuery.of(context).size.width * .4,
                //     height: 30,
                //     child: PrimaryButton(
                //       title: 'Update Interest',
                //       color: AppColors.white.withOpacity(0.9),
                //       invert: true,
                //       state: userProfileState.createUserProfileState.isLoading,
                //       action: () async {
                //         if (formKey.currentState!.validate()) {
                //           final isCreated =
                //               await userProfileViewModel.createUserProfile();
                //           if (isCreated) router.push(ProfilePhotoRoute());
                //         }
                //       },
                //     ),
                //   ),
                // ),
                SizedBox(height: 15),
                Divider(color: AppColors.white),
                SizedBox(height: 25),
                Text(
                  'Access Management',
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: AppColors.white),
                ),
                SizedBox(height: 15),
                Text(
                  'Update Password',
                  style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                      color: AppColors.white),
                ),
                SizedBox(height: 50),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
