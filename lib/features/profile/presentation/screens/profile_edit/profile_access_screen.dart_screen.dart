import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';

@RoutePage()
class ProfileAccessManagementScreen extends StatefulWidget {
  const ProfileAccessManagementScreen({super.key});

  @override
  ProfileAccessManagementScreenState createState() =>
      ProfileAccessManagementScreenState();
}

class ProfileAccessManagementScreenState
    extends State<ProfileAccessManagementScreen> with Validator {
  final AuthenticationCubit authCubit = locator<AuthenticationCubit>();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers
  final TextEditingController _currentPasswordController =
      TextEditingController();
  final TextEditingController _newPasswordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  static const bool _isPasswordObscure = true;

  @override
  void dispose() {
    _currentPasswordController.dispose();
    _newPasswordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleChangePassword() {
    if (_formKey.currentState?.validate() ?? false) {
      final request = ChangePasswordRequest(
        oldPassword: _currentPasswordController.text,
        newPassword: _newPasswordController.text,
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
        elevation: 0,
        leading: const AppBackButton(),
        centerTitle: true,
        title: const Text(
          'Access Management',
          style: TextStyle(
            color: AppColors.grayscale,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
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
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildFormFields(),
                const SizedBox(height: 20),
                _buildChangeButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormFields() {
    return Column(
      children: [
        InputField(
          hintText: 'Current Password',
          password: _isPasswordObscure,
          validator: (data) => isValidPassword(data!),
          controller: _currentPasswordController,
        ),
        const SizedBox(height: 16),
        InputField(
          hintText: 'New Password',
          password: _isPasswordObscure,
          validator: (data) => isValidPassword(data!),
          controller: _newPasswordController,
        ),
        const SizedBox(height: 16),
        InputField(
          hintText: 'Confirm New Password',
          password: _isPasswordObscure,
          validator: (data) => validateConfirmPassword(
            data,
            _newPasswordController.text,
          ),
          controller: _confirmPasswordController,
        ),
      ],
    );
  }

  Widget _buildChangeButton() {
    return BlocBuilder<AuthenticationCubit, AuthenticationState>(
      builder: (context, state) {
        final isLoading = state is AuthenticationLoadingState;
        return PrimaryButton(
          title: 'Change Password',
          action: _handleChangePassword,
          state: isLoading,
        );
      },
    );
  }
}
