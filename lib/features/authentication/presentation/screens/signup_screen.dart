import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/constansts.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/constants/text_style.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/services/push_notification_service.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/social_button.dart';
import 'package:zheeta/shared/widgets/transparent_button.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  final String? referralCode;

  const SignUpScreen({super.key, this.referralCode});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Validator {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _emailController = TextEditingController();
  final _usernameController = TextEditingController();
  final _phoneController = TextEditingController();
  final _referralController = TextEditingController();
  bool _agree = false;
  final bool _isPasswordObscure = true;

  PhoneNumber _phoneNumber =
      PhoneNumber(countryISOCode: '', countryCode: '', number: '');

  @override
  void initState() {
    super.initState();
    if (widget.referralCode != null) {
      _referralController.text = widget.referralCode!;
    }
  }

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _emailController.dispose();
    _usernameController.dispose();
    _phoneController.dispose();
    _referralController.dispose();
    super.dispose();
  }

  void _submitForm() {
    if (!(_formKey.currentState?.validate() ?? false)) return;

    final username = _usernameController.text.trim();
    final email = _emailController.text.trim();
    final password = _passwordController.text.trim();
    final phone = _phoneNumber.number.trim();
    final code = _phoneNumber.countryCode.trim();

    if (username.isEmpty ||
        email.isEmpty ||
        password.isEmpty ||
        phone.isEmpty ||
        code.isEmpty) {
      NotifyUser.showSnackBar("All fields except referral are required",
          type: SnackBarType.error);
      return;
    }

    final request = RegisterUserRequest(
      userName: username,
      email: email.toLowerCase(),
      password: password,
      phoneNumber: phone,
      phoneCountryCode: code,
      referralCode: _referralController.text.trim().isNotEmpty
          ? _referralController.text.trim()
          : null,
    );

    context.read<AuthenticationCubit>().registerUserCubit(request: request);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationErrorState) {
            NotifyUser.showSnackBar(state.errorMessage,
                type: SnackBarType.error);
          } else if (state is AuthenticationRegisteredState) {
            router.popAndPush(VerificationRoute(
              isPhoneNumber: true,
              phoneNumber: state.data.phoneNumber,
              countryCode: state.data.phoneCountryCode,
              email: state.data.email,
            ));
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Form(
            key: _formKey,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 60.0),
                Image.asset("assets/images/full-logo.png", height: 36.0),
                const SizedBox(height: 40.0),
                Text(signupTitle, style: authTitleStyle),
                const SizedBox(height: 5.0),
                GestureDetector(
                  onTap: () => router.replace(const SignInRoute()),
                  child: Text(signupSubtitle, style: authSubtitleStyle),
                ),
                const SizedBox(height: 32.0),
                InputField(
                  hintText: 'Username',
                  validator: (data) => validateName(data, 'Username'),
                  controller: _usernameController,
                ),
                InputField(
                  hintText: 'Password',
                  password: _isPasswordObscure,
                  validator: validatePassword,
                  controller: _passwordController,
                ),
                InputField(
                  hintText: 'Retype Password',
                  password: _isPasswordObscure,
                  validator: (data) =>
                      validateConfirmPassword(data, _passwordController.text),
                  controller: _confirmPasswordController,
                ),
                const SizedBox(height: 10),
                InputField(
                  hintText: 'Email Address',
                  validator: validateEmail,
                  controller: _emailController,
                ),
                const SizedBox(height: 10.0),
                IntlPhoneField(
                  disableLengthCheck: true,
                  decoration: InputDecoration(
                    isDense: true,
                    filled: true,
                    fillColor: AppColors.white,
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(
                          color: AppColors.grey.withValues(alpha: 0.5),
                          width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryDark, width: 1.0),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: "Phone number",
                    hintStyle: TextStyle(
                        color: AppColors.grey.withValues(alpha: 0.5),
                        fontSize: 14),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                  initialCountryCode: 'US',
                  controller: _phoneController,
                  onChanged: (phone) => _phoneNumber = phone,
                  validator: (phone) {
                    if (phone == null) return 'Phone number is required';
                    return isValidPhoneNumber(phone.completeNumber);
                  },
                  onCountryChanged: (value) {
                    _phoneNumber = PhoneNumber(
                      countryISOCode: value.code,
                      countryCode: value.dialCode,
                      number: _phoneController.text,
                    );
                  },
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                ),
                const SizedBox(height: 10.0),
                InputField(
                  hintText: 'Referral (Optional)',
                  controller: _referralController,
                ),
                Row(
                  children: [
                    Checkbox(
                      activeColor: AppColors.primaryDark,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100.0),
                      ),
                      side: WidgetStateBorderSide.resolveWith(
                        (states) => BorderSide(
                            width: 1.0, color: AppColors.primaryDark),
                      ),
                      value: _agree,
                      onChanged: (value) =>
                          setState(() => _agree = value ?? false),
                    ),
                    Row(
                      children: [
                        Text(
                          'Agree to our',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: AppColors.black),
                        ),
                        GestureDetector(
                          child: Text(
                            ' terms?',
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(color: AppColors.primaryDark),
                          ),
                          onTap: () {
                            // TODO: open terms and conditions page
                          },
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 12.0),
                BlocBuilder<AuthenticationCubit, AuthenticationState>(
                  builder: (context, state) {
                    return PrimaryButton(
                      title: 'Sign Up',
                      disabled: !_agree,
                      state: state is AuthenticationLoadingState,
                      action: _agree ? _submitForm : null,
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
