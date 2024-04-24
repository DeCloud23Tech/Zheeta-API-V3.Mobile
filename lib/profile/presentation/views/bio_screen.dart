import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit.dart';
import 'package:zheeta/profile/presentation/viewmodel/user_profile_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class BioDataScreen extends StatefulWidget {
  const BioDataScreen({super.key});

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen> {
  late UserProfileViewModel userProfileViewModel;
  final formKey = GlobalKey<FormState>();
  final dobController = TextEditingController();

  String? sexSelect;

  @override
  void initState() {
    super.initState();
    userProfileViewModel = locator<UserProfileViewModel>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.secondaryLight,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  CustomBackButton(),
                  SizedBox(height: 40),
                  InputField(
                    validator: (data) =>
                        userProfileViewModel.validateFirstName(),
                    onChanged: (value) =>
                        userProfileViewModel.setFirstName(value),
                    hintText: 'First Name',
                  ),
                  InputField(
                    validator: (data) =>
                        userProfileViewModel.validateLastName(),
                    onChanged: (value) =>
                        userProfileViewModel.setLastName(value),
                    hintText: 'Last Name',
                  ),
                  Theme(
                    data: Theme.of(context)
                        .copyWith(unselectedWidgetColor: AppColors.primaryDark),
                    child: Row(
                      children: [
                        radioItem('Male'),
                        radioItem('Female'),
                        radioItem('Not specified'),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                      validator: (_) => userProfileViewModel.validateDob(),
                      controller: dobController,
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: AppColors.white,
                          enabledBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: AppColors.grey, width: 0.5),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.primaryDark, width: 1.0),
                          ),
                          hintText: 'Date of Birth (DOB)',
                          hintStyle: TextStyle(
                              color: AppColors.grey.withOpacity(0.5),
                              fontSize: 14),
                          errorStyle: const TextStyle(color: Colors.red),
                          prefixIcon: Icon(Icons.calendar_today)),
                      readOnly: true,
                      onTap: () async {
                        userProfileViewModel.setDob = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(1900),
                          lastDate: DateTime(2101),
                        );
                        dobController.text = userProfileViewModel.getDob;
                      }),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      title: 'Continue',
                      action: () {
                        if (formKey.currentState!.validate() &&
                            userProfileViewModel.isValidGender()) {
                          router.push(LocationRoute());
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }

  Row radioItem(data) {
    return Row(
      children: [
        Radio(
            value: data,
            groupValue: sexSelect,
            onChanged: (value) {
              setState(() {
                sexSelect = value;
              });
              userProfileViewModel.setGender(value);
            }),
        Text(data, style: TextStyle(fontSize: 12)),
        SizedBox(width: 5)
      ],
    );
  }
}
