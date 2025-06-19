import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/features/authentication/data/request/change_password_request.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ProfileAccessManagementScreen extends StatefulWidget {
  const ProfileAccessManagementScreen({super.key});

  @override
  ProfileAccessManagementScreenState createState() =>
      ProfileAccessManagementScreenState();
}

class ProfileAccessManagementScreenState
    extends State<ProfileAccessManagementScreen>
    with ValidationHelperMixin {
  final AuthenticationCubit authCubit = locator<AuthenticationCubit>();

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // Separate controllers
  final TextEditingController currentPasswordController =
  TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();

  final bool _isPasswordObscure = true;

  @override
  void dispose() {
    currentPasswordController.dispose();
    newPasswordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleChangePassword() {
    if (formKey.currentState!.validate()) {
      final request = ChangePasswordRequest(
        oldPassword: currentPasswordController.text,
        newPassword: newPasswordController.text,
      );
      authCubit.changePasswordCubit(request: request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      appBar: AppBar(
        backgroundColor: AppColors.secondaryLight,
        elevation: 0.0,
        leading: const AppBackButton(),
        title: const Text(
          'Access Management',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        centerTitle: true,
      ),
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        bloc: authCubit,
        listener: (context, state) {
          if (state is AuthenticationChangePasswordState) {
            NotifyUser.showSnackBar('Password changed successfully!');
            Navigator.pop(context);
        } else if (state is AuthenticationErrorState) {
          NotifyUser.showSnackBar(state.errorMessage);
          }
        },
        child: SafeArea(
          child: Padding(
            padding:
            const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    InputField(
                      hintText: 'Current Password',
                      password: _isPasswordObscure,
                      validator: (data) => isValidPassword(data!),
                      controller: currentPasswordController,
                    ),
                    InputField(
                      hintText: 'New Password',
                      password: _isPasswordObscure,
                      validator: (data) => isValidPassword(data!),
                      controller: newPasswordController,
                    ),
                    InputField(
                      hintText: 'Confirm New Password',
                      password: _isPasswordObscure,
                      validator: (data) =>
                          validateConfirmPassword(
                              data, newPasswordController.text),
                      controller: confirmPasswordController,
                    ),
                    const SizedBox(height: 20),
                    BlocBuilder<AuthenticationCubit, AuthenticationState>(
                      builder: (context, state) {
                        return PrimaryButton(
                          title: 'Change Password',
                          action: _handleChangePassword,
                          state: state is AuthenticationLoadingState,
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
