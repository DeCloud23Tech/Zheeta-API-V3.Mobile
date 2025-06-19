import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authenticate_country_cubit.dart';
import 'package:zheeta/features/profile/presentation/bloc/profile_create_cubit/profile_create_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/date_picker_field.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/radio_button.dart';

@RoutePage()
class BioDataScreen extends StatefulWidget {
  const BioDataScreen({super.key});

  @override
  State<BioDataScreen> createState() => _BioDataScreenState();
}

class _BioDataScreenState extends State<BioDataScreen>
    with ValidationHelperMixin {
  final _formKey = GlobalKey<FormState>();
  final dobController = TextEditingController();
  final profileCreateCubit = locator<ProfileCreateCubit>();

  String? firstName;
  String? lastName;
  String? sexSelect = 'Male';

  @override
  void dispose() {
    dobController.dispose();
    super.dispose();
  }

  /// Handles sending data to the Cubit
  void _updateCubit() {
    profileCreateCubit.updateProfileBioData(
      firstName: firstName,
      lastName: lastName,
      gender: sexSelect,
      dob: dobController.text,
    );
  }

  /// Validates and processes form submission
  void _onContinue() {
    if (_formKey.currentState!.validate()) {
      _updateCubit();

      // Fetch countries before navigating
      final authenticateCountryCubit = locator<AuthenticateCountryCubit>();
      authenticateCountryCubit.fetchAllCountries().then((_) {
        if (!mounted) return;
        context.router.push(LocationRoute());
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60),
                AppBackButton(),
                const SizedBox(height: 40),
                InputField(
                  validator: isValidInput,
                  hintText: 'First Name',
                  onChanged: (value) => setState(() => firstName = value),
                ),
                InputField(
                  validator: isValidInput,
                  hintText: 'Last Name',
                  onChanged: (value) => setState(() => lastName = value),
                ),
                const SizedBox(height: 15),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    AppRadioButton(
                      value: "Male",
                      groupValue: sexSelect,
                      onChanged: (value) => setState(() => sexSelect = value),
                      title: 'Male',
                    ),
                    AppRadioButton(
                      value: "Female",
                      groupValue: sexSelect,
                      onChanged: (value) => setState(() => sexSelect = value),
                      title: 'Female',
                    ),
                  ],
                ),
                const SizedBox(height: 25),
                DatePickerField(
                  controller: dobController,
                  hintText: 'Date of Birth (DOB)',
                  validator: (data) =>
                  data?.isEmpty == true ? 'Please select a date' : null,
                ),
                const SizedBox(height: 32),
                BlocConsumer<AuthenticateCountryCubit, AuthenticateCountryState>(
                  listener: (context, state){
                    if (state.errorMessage != null && state.errorMessage!.isNotEmpty) {
                      NotifyUser.showSnackBar(state.errorMessage!);
                    }
                  },
                  builder: (context, state) {
                    return SizedBox(
                      width: double.infinity,
                      child: PrimaryButton(
                        state: state.isLoading,
                        title: 'Continue',
                        action: _onContinue,
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
