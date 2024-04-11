import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/extensions/num_extension.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/about_screen_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_interest_viewmodel.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class AboutScreen extends StatefulWidget {
  UserProfileViewModel userProfileViewModel;
  AboutScreen({
    super.key,
    required this.userProfileViewModel,
  });

  @override
  State<AboutScreen> createState() => _AboutScreenState();
}

class _AboutScreenState extends State<AboutScreen> with ValidationHelperMixin {
  late AbountScreenViewModel vm;
  late UserProfileViewModel userProfileViewModel;

  @override
  void initState() {
    vm = AbountScreenViewModel();
    userProfileViewModel = widget.userProfileViewModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // final userInterestState = ref.watch(userInterestViewModelProvider);
    // final userProfileState = ref.watch(userProfileViewModelProvider);
    return BlocBuilder(builder: (context, state) {
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
              key: vm.formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 40),
                  Text.rich(
                    TextSpan(
                      text: 'Height ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      children: [
                        if (vm.height.roundToInt != 0)
                          TextSpan(
                            text: '(${vm.height.roundTo2dp}\'\')',
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.w400),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Slider(
                    label: '${vm.height.roundTo2dp}',
                    value: vm.height,
                    min: 0,
                    max: 10,
                    onChanged: (value) {
                      setState(() {
                        vm.height = value;
                      });
                      userProfileViewModel.setHeight(value);
                    },
                  ),
                  SizedBox(height: 25),
                  Text.rich(
                    TextSpan(
                      text: 'Weight ',
                      style:
                          TextStyle(fontSize: 14, fontWeight: FontWeight.w400),
                      children: [
                        if (vm.weight.roundToInt != 0)
                          TextSpan(
                            text: '(${vm.weight.roundToInt}kg)',
                            style: TextStyle(
                                fontSize: 12,
                                color: AppColors.primaryDark,
                                fontWeight: FontWeight.w400),
                          ),
                      ],
                    ),
                  ),
                  SizedBox(height: 15),
                  Slider(
                    label: '${vm.weight.roundToInt}',
                    value: vm.weight,
                    min: 0,
                    max: 150,
                    onChanged: (value) {
                      setState(() {
                        vm.weight = value;
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
                    children: vm.bodyTypeList.map((value) {
                      return AppRadioButton(
                        value: value,
                        groupValue: vm.bodyType ?? '',
                        onChanged: (value) {
                          setState(() {
                            vm.bodyType = value;
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
                    children: vm.complexionList.map((value) {
                      return AppRadioButton(
                        value: value,
                        groupValue: vm.complexion ?? '',
                        onChanged: (value) {
                          setState(() {
                            vm.complexion = value;
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
                    children: vm.religionList.map((value) {
                      return AppRadioButton(
                        value: value,
                        groupValue: vm.religion ?? '',
                        onChanged: (value) {
                          setState(() {
                            vm.religion = value;
                          });
                          userProfileViewModel.setReligion(value);
                        },
                      );
                    }).toList(),
                  ),
                  if (vm.religion == 'Other') SizedBox(height: 5),
                  if (vm.religion == 'Other')
                    InputField(
                      hintText: 'Other',
                      onChanged: (value) => vm.setReligion(value),
                    ),
                  SizedBox(height: 25),
                  Text(
                    'Interest, I’m looking for',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  SizedBox(height: 10),
                  Wrap(
                    direction: Axis.horizontal,
                    children: vm.interestsList?.data.map((value) {
                          return AppMultipleSelectRadioButton(
                            value: value.title,
                            isActive: vm.interest.contains(value.title),
                            onChanged: (value) {
                              if (vm.interest.contains(value)) {
                                vm.interest.remove(value);
                              } else {
                                vm.interest.add(value);
                              }
                              setState(() {});
                              userProfileViewModel.setInterest(
                                vm.interestsList?.data.firstWhere((element) {
                                  return element.title == value;
                                }).id,
                              );
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
                    items: vm.occupationList,
                    hintText: 'Select occupation',
                    onChanged: (value) =>
                        userProfileViewModel.setOccupation(value!),
                    validator: (value) => isValidInput(value),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Language',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  InputField(
                    controller: vm.languagesController,
                    hintText: 'Select language',
                    validator: (value) => isValidInput(value),
                    readonly: true,
                    onTap: () async {
                      final _lang = await router.push<List<String>?>(
                          SelectLanguageRoute(languages: vm.languages ?? []));
                      if (_lang != null) {
                        vm.languages = _lang;
                        userProfileViewModel.setLanguage(_lang);
                        vm.languagesController.text = vm.languages!.join(', ');
                      }
                    },
                  ),
                  SizedBox(height: 10),
                  Text(
                    'About Me',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  InputField(
                    hintText: 'Write about yourself',
                    onChanged: (value) => userProfileViewModel.setAbout(value),
                    validator: (value) => isValidInput(value),
                  ),
                  SizedBox(height: 10),
                  Text(
                    'Tagline',
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600),
                  ),
                  InputField(
                    hintText: 'Enter your tagline',
                    onChanged: (value) =>
                        userProfileViewModel.setTagline(value),
                    validator: (value) => isValidInput(value),
                  ),
                  SizedBox(height: 23),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: 'Done',
                      state: state is ProfileLoadingState,
                      action: () async {
                        if (vm.formKey.currentState!.validate()) {
                          await userProfileViewModel.createUserProfile(context);
                          //if (isCreated) router.push(ProfilePhotoRoute());
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
    });
  }
}
