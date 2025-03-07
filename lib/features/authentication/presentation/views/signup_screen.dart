import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/strings.dart';
import 'package:zheeta/common/constants/text_style.dart';
import 'package:zheeta/common/mixins/validator_mixin.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/data/request/register_user_request.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

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
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationErrorState) {
            NotifyUser.showSnackBar(state.errorMessage);
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
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
                  onChanged: (value) {
                    setState(() {
                      _usernameController.text = value;
                    });
                  },
                ),
                InputField(
                  hintText: 'Password',
                  password: _isPasswordObscure,
                  validator: (data) => validatePassword(data),
                  controller: _passwordController,
                  onChanged: (value) {
                    setState(() {
                      _passwordController.text = value;
                    });
                  },
                ),
                InputField(
                  hintText: 'Retype Password',
                  password: _isPasswordObscure,
                  validator: (data) =>
                      validateConfirmPassword(data, _passwordController.text),
                  controller: _confirmPasswordController,
                  onChanged: (value) {
                    setState(() {
                      _confirmPasswordController.text = value;
                    });
                  },
                ),
                const SizedBox(height: 10),
                InputField(
                  hintText: 'Email Address',
                  validator: (data) => validateEmail(data),
                  controller: _emailController,
                  onChanged: (value) {
                    setState(() {
                      _emailController.text = value;
                    });
                  },
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
                          color: AppColors.grey.withOpacity(0.5), width: 1.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide:
                          BorderSide(color: AppColors.primaryDark, width: 1.0),
                    ),
                    border: const OutlineInputBorder(),
                    hintText: "Phone number",
                    hintStyle: TextStyle(
                        color: AppColors.grey.withOpacity(0.5), fontSize: 14),
                    errorStyle: const TextStyle(color: Colors.red),
                  ),
                  initialCountryCode: 'US',
                  controller: _phoneController,
                  onChanged: (phone) => setState(() => _phoneNumber = phone),
                  validator: (phone) {
                    if (phone == null) {
                      return 'Phone number is required';
                    }
                    return isValidPhoneNumber(phone.completeNumber);
                  },
                  onCountryChanged: (value) {
                    setState(() {
                      _phoneNumber = PhoneNumber(
                        countryISOCode: value.code,
                        countryCode: value.dialCode,
                        number: _phoneController.text,
                      );
                    });
                  },
                  autovalidateMode: AutovalidateMode.disabled,
                ),
                const SizedBox(height: 10.0),
                InputField(
                  hintText: 'Referral (Optional)',
                  controller: _referralController,
                  onChanged: (value) =>
                      setState(() => _referralController.text = value),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
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
                      onChanged: (value) => setState(() => _agree = value!),
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
                          onTap: () {},
                        ),
                      ],
                    )
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

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Ensure required fields are not empty
      if (_usernameController.text.trim().isEmpty ||
          _emailController.text.trim().isEmpty ||
          _passwordController.text.trim().isEmpty ||
          _phoneNumber.number.trim().isEmpty ||
          _phoneNumber.countryCode.trim().isEmpty) {
        // Show an error message or feedback
        NotifyUser.showSnackBar("All fields except referral are required");
        return; // Stop submission
      }

      _formKey.currentState?.save();
      final request = RegisterUserRequest(
        userName: _usernameController.text.trim(),
        email: _emailController.text.toLowerCase().trim(),
        password: _passwordController.text.trim(),
        phoneNumber: _phoneNumber.number.trim(),
        phoneCountryCode: _phoneNumber.countryCode.trim(),
        referralCode: _referralController.text.isNotEmpty
            ? _referralController.text.trim()
            : null,
      );

      context.read<AuthenticationCubit>().registerUserCubit(request: request);
    }
  }
}
