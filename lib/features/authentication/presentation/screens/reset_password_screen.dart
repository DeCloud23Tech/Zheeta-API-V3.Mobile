import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/constansts.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/constants/text_style.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/services/push_notification_service.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/utils/logout_utils.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/otp_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';
import 'package:zheeta/shared/widgets/back_button.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/social_button.dart';
import 'package:zheeta/shared/widgets/transparent_button.dart';

@RoutePage()
class ResetPasswordScreen extends StatefulWidget {
  final ResetPasswordRequest request;

  const ResetPasswordScreen({super.key, required this.request});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with Validator {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    passwordController.dispose();
    confirmPasswordController.dispose();
    super.dispose();
  }

  void _handleResetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      widget.request.newPassword = passwordController.text;

      context
          .read<AuthenticationCubit>()
          .resetPasswordCubit(request: widget.request);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationErrorState) {
            NotifyUser.showSnackBar(state.errorMessage);
          } else if (state is AuthenticationLoggedInState) {
            NotifyUser.showSnackBar('Password reset successfully');
            logout(context);
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  const CustomBackButton(),
                  const SizedBox(height: 40),
                  Center(
                    child: Column(
                      children: [
                        Text('Reset Password', style: forgotTitleStyle),
                        const SizedBox(height: 10),
                        Text('Create a new password',
                            style: forgotSubtitleStyle),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    hintText: 'New Password',
                    password: true,
                    validator: validatePassword,
                    controller: passwordController,
                  ),
                  const SizedBox(height: 16),
                  InputField(
                    hintText: 'Retype Password',
                    password: true,
                    validator: (value) => validateConfirmPassword(
                      value,
                      passwordController.text,
                    ),
                    controller: confirmPasswordController,
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        title: 'Reset Password',
                        state: state is AuthenticationLoadingState,
                        action: () => _handleResetPassword(context),
                      );
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
