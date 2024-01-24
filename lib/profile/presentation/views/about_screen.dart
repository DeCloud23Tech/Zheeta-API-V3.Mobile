import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/view_model/user_interest_viewmodel.dart';
import 'package:zheeta/profile/presentation/view_model/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class AboutScreen extends ConsumerStatefulWidget {
  const AboutScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _AboutScreenState();
}

class _AboutScreenState extends ConsumerState<AboutScreen> {
  double height = 0;
  double weight = 0;
  String? bodyType;
  String? complexion;
  String? religion;
  String? interest;
  late UserProfileViewModel userProfileViewModel;

  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    userProfileViewModel = ref.read(userProfileViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userInterestState = ref.watch(userInterestViewModelProvider);
    final userProfileState = ref.watch(userProfileViewModelProvider);
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: AppColors.secondaryLight,
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
          'Let\'s know you',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
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
                Text.rich(
                  TextSpan(
                    text: 'Height ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    children: [
                      if (height.roundToInt != 0)
                        TextSpan(
                          text: '(${height.roundTo2dp}\'\')',
                          style: TextStyle(fontSize: 12, color: AppColors.primaryDark, fontWeight: FontWeight.w400),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Slider(
                  label: '${height.roundTo2dp}',
                  value: height,
                  min: 0,
                  max: 10,
                  onChanged: (value) {
                    setState(() {
                      height = value;
                    });
                    userProfileViewModel.setHeight(value);
                  },
                ),
                SizedBox(height: 25),
                Text.rich(
                  TextSpan(
                    text: 'Weight ',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                    children: [
                      if (weight.roundToInt != 0)
                        TextSpan(
                          text: '(${weight.roundToInt}kg)',
                          style: TextStyle(fontSize: 12, color: AppColors.primaryDark, fontWeight: FontWeight.w400),
                        ),
                    ],
                  ),
                ),
                SizedBox(height: 15),
                Slider(
                  label: '${weight.roundToInt}',
                  value: weight,
                  min: 0,
                  max: 150,
                  onChanged: (value) {
                    setState(() {
                      weight = value;
                    });
                    userProfileViewModel.setWeight(value);
                  },
                ),
                SizedBox(height: 25),
                Text(
                  'Body Type',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Wrap(
                  direction: Axis.horizontal,
                  children: userProfileViewModel.bodyTypeList.map((value) {
                    return AppRadioButton(
                      value: value,
                      groupValue: bodyType ?? '',
                      onChanged: (value) {
                        setState(() {
                          bodyType = value;
                        });
                        userProfileViewModel.setBodyType(value);
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 25),
                Text(
                  'Complexion',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Wrap(
                  direction: Axis.horizontal,
                  children: userProfileViewModel.complexionList.map((value) {
                    return AppRadioButton(
                      value: value,
                      groupValue: complexion ?? '',
                      onChanged: (value) {
                        setState(() {
                          complexion = value;
                        });
                        userProfileViewModel.setComplexion(value);
                      },
                    );
                  }).toList(),
                ),
                SizedBox(height: 25),
                Text(
                  'Religion',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Wrap(
                  direction: Axis.horizontal,
                  children: userProfileViewModel.religionList.map((value) {
                    return AppRadioButton(
                      value: value,
                      groupValue: religion ?? '',
                      onChanged: (value) {
                        setState(() {
                          religion = value;
                        });
                        userProfileViewModel.setReligion(value);
                      },
                    );
                  }).toList(),
                ),
                if (religion == 'Other') SizedBox(height: 5),
                if (religion == 'Other')
                  InputField(
                    hintText: 'Other',
                    onChanged: (value) => userProfileViewModel.setReligion(value),
                  ),
                SizedBox(height: 25),
                Text(
                  'Interest, I’m looking for',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                SizedBox(height: 10),
                Wrap(
                  direction: Axis.horizontal,
                  children: userInterestState.getInterestState.data?.data.map((value) {
                        return AppRadioButton(
                          value: value.title,
                          groupValue: interest ?? '',
                          onChanged: (value) {
                            setState(() {
                              interest = value;
                            });
                            userProfileViewModel.setInterest(value);
                          },
                        );
                      }).toList() ??
                      [],
                ),
                SizedBox(height: 25),
                Text(
                  'Occupation',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                DropdownInputField(
                  items: userProfileViewModel.occupationList,
                  hintText: 'Select occupation',
                  onChanged: (value) => userProfileViewModel.setOccupation(value!),
                  validator: (value) => userProfileViewModel.validateOccupation(),
                ),
                SizedBox(height: 10),
                Text(
                  'Language',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                DropdownInputField(
                  items: userProfileViewModel.languageList,
                  hintText: 'Select language',
                  onChanged: (value) => userProfileViewModel.setLanguage(value!),
                  validator: (value) => userProfileViewModel.validateLanguage(),
                ),
                SizedBox(height: 10),
                Text(
                  'Tagline',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                ),
                InputField(
                  hintText: 'Enter your tagline',
                  onChanged: (value) => userProfileViewModel.setTagline(value),
                  validator: (value) => userProfileViewModel.validateTagline(),
                ),
                SizedBox(height: 23),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Done',
                    state: userProfileState.createUserProfileState.isLoading,
                    action: () async {
                      if (formKey.currentState!.validate()) {
                        final isCreated = await userProfileViewModel.createUserProfile();
                        if (isCreated) router.push(ProfilePhotoRoute());
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
  }
}
