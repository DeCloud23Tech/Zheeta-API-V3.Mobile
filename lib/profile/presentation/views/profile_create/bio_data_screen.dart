import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/profile/presentation/bloc/profile_cubit/profile_cubit.dart';
import 'package:zheeta/widgets/date_picker_field.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class BioDataScreen extends StatefulWidget {
  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen>
    with ValidationHelperMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();
  final _formKey = GlobalKey<FormState>();
  final dobController = TextEditingController();
  String? sexSelect;

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                // const CustomBackButton(),
                const SizedBox(height: 40),
                InputField(
                  validator: (data) => isValidInput(data),
                  hintText: 'First Name',
                  onChanged: (value) => profileCubit.updateFirstName(value),
                ),
                InputField(
                  validator: (data) => isValidInput(data),
                  hintText: 'Last Name',
                  onChanged: (value) => profileCubit.updateLastName(value),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppRadioButton(
                      value: "Male",
                      groupValue: sexSelect,
                      onChanged: (value) {
                        setState(() {
                          sexSelect = value;
                          profileCubit.updateGender(value);
                        });
                      },
                      title: 'Male',
                    ),
                    AppRadioButton(
                      value: "Female",
                      groupValue: sexSelect,
                      onChanged: (value) {
                        setState(() {
                          sexSelect = value;
                          profileCubit.updateGender(value);
                        });
                      },
                      title: 'Female',
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                DatePickerField(
                  controller: dobController,
                  hintText: 'Date of Birth (DOB)',
                  validator: (data) => data?.isEmpty == true ? 'Please select a date' : null,
                  onDateSelected: (formattedDate) {
                    // Handle date selection logic, e.g., updating a Cubit or state
                    profileCubit.updateDOB(formattedDate);
                  },
                ),
                const SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Continue',
                    action: () {
                      if (_formKey.currentState!.validate()) {
                        // Proceed to the next step (location screen in this case)
                        context.router.push(LocationRoute());
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
  }
}
