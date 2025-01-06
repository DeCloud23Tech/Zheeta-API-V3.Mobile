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
class ProfileAccessManagementScreen extends StatefulWidget {
  const ProfileAccessManagementScreen();

  @override
  _ProfileAccessManagementScreenState createState() => _ProfileAccessManagementScreenState();
}

class _ProfileAccessManagementScreenState extends State<ProfileAccessManagementScreen>
    with ValidationHelperMixin, AsyncDataLoaderMixin {
  final ProfileCubit profileCubit = locator<ProfileCubit>();

  final formKey = GlobalKey<FormState>();
  bool _isPasswordObscure = true;

  String _password = '';
  String _confirmPassword = '';
  @override
  void initState() {
    super.initState();
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
          'Access management',
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
                  InputField(
                    hintText: 'Password',
                    password: _isPasswordObscure,
                    // validator: (data) => validatePassword(data),
                    // controller: passwordController,
                    onChanged: (value) {
                      setState(() {
                        _password = value;
                      });
                    },
                  ),
                  InputField(
                    hintText: 'Retype Password',
                    password: _isPasswordObscure,
                    // validator: (data) =>
                    //     validateConfirmPassword(data, passwordController.text),
                    // controller: confirmPasswordController,
                    onChanged: (value) {
                      setState(() {
                        _confirmPassword = value;
                      });
                    },
                  ),
                  SizedBox(height: 20),
                  PrimaryButton(
                    title: 'Change Password',
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
