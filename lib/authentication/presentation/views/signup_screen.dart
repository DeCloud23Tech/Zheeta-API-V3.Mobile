import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validator_mixin.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> with Validator {
  bool _isPasswordObscure = true;
  bool agree = false;
  final formKey = GlobalKey<FormState>();
  late UserAuthViewModel userAuthViewModel;

  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController referralController = TextEditingController();
  PhoneNumber _phoneNumber =
      PhoneNumber(countryISOCode: '+234', countryCode: 'NG', number: '');
  Country? phoneCode;

  @override
  void initState() {
    userAuthViewModel = locator<UserAuthViewModel>();
    super.initState();
  }

  final validatorChange = ValueNotifier<dynamic>(null);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthentcationState>(
      listener: (context, state) {
        if (state is AuthenticationErrorState) {
          NotifyUser.showSnackbar(state.errorMessage);
        }
        if (state is AuthenticationRegisteredState) {
          userAuthViewModel.navigateToVerificationPageLogin();
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryLight,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(height: 60),
                    Image.asset("assets/images/full-logo.png", height: 36),
                    const SizedBox(height: 40),
                    Text(signupTitle, style: authTitleStyle),
                    const SizedBox(height: 5),
                    GestureDetector(
                      onTap: () {
                        router.push(const SignInRoute());
                      },
                      child: Text(signupSubtitle, style: authSubtitleStyle),
                    ),
                    const SizedBox(height: 32),
                    InputField(
                      hintText: 'Username',
                      validator: (data) => validateName(data, 'Username'),
                      controller: usernameController,
                      onChanged: (value) {
                        validatorChange.value = value;
                        userAuthViewModel.setUsername(value);
                      },
                    ),
                    InputField(
                      hintText: 'Password',
                      password: _isPasswordObscure,
                      validator: (data) => validatePassword(data),
                      controller: passwordController,
                      onChanged: (value) {
                        validatorChange.value = value;
                        userAuthViewModel.setPassword(value);
                      },
                    ),
                    InputField(
                      hintText: 'Retype Password',
                      password: _isPasswordObscure,
                      validator: (data) => validateConfirmPassword(
                          data, passwordController.text),
                      controller: confirmPasswordController,
                      onChanged: (value) {
                        validatorChange.value = value;
                        userAuthViewModel.setRetypePassword(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: 'Email Address',
                      validator: (data) => validateEmail(data),
                      controller: emailController,
                      onChanged: (value) {
                        validatorChange.value = value;
                        userAuthViewModel.setEmail(value);
                      },
                    ),
                    const SizedBox(height: 10),
                    IntlPhoneField(
                      disableLengthCheck: true,
                      decoration: InputDecoration(
                        isDense: true,
                        filled: true,
                        fillColor: AppColors.white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.grey.withOpacity(0.5),
                              width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: AppColors.primaryDark, width: 1.0),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: "Phone number",
                        hintStyle: TextStyle(
                            color: AppColors.grey.withOpacity(0.5),
                            fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.red),
                      ),
                      initialCountryCode:
                          userAuthViewModel.getPhoneNumber.countryCode,
                      validator: (phone) =>
                          isValidPhoneNumber(phone!.completeNumber),
                      controller: phoneController,
                      onChanged: (phone) {
                        validatorChange.value = phone;
                        userAuthViewModel.setPhoneNumber(phone);
                        setState(() {
                          _phoneNumber = phone;
                        });
                      },
                      onCountryChanged: (value) {
                        setState(() {
                          _phoneNumber.countryCode = '${value.code}';
                        });
                        userAuthViewModel.setCountryCode(value);
                      },
                      autovalidateMode: AutovalidateMode.disabled,
                    ),
                    const SizedBox(height: 10),
                    InputField(
                      hintText: 'Referral (Optional)',
                      controller: referralController,
                      onChanged: (value) {},
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Checkbox(
                          activeColor: AppColors.primaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => BorderSide(
                                width: 1.0, color: AppColors.primaryDark),
                          ),
                          value: agree,
                          onChanged: (value) {
                            validatorChange.value = value;
                            setState(() {
                              agree = value!;
                            });
                            userAuthViewModel.setAgree(value!);
                          },
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
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ValueListenableBuilder(
                        valueListenable: validatorChange,
                        builder: (context, _, __) {
                          return PrimaryButton(
                            title: 'Sign Up',
                            disabled: validateName(
                                        usernameController.text, 'Username') !=
                                    null ||
                                validatePassword(passwordController.text) !=
                                    null ||
                                validateConfirmPassword(
                                        confirmPasswordController.text,
                                        passwordController.text) !=
                                    null ||
                                validateEmail(emailController.text) != null ||
                                isValidPhoneNumber(
                                        _phoneNumber.completeNumber) !=
                                    null ||
                                !agree,
                            state: state is AuthenticationLoadingState,
                            action: () async {
                              if (formKey.currentState?.validate() ?? false) {
                                await userAuthViewModel.registerUser(context);
                              }
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
