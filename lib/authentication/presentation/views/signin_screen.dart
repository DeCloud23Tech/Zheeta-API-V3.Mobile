import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validator_mixin.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/common/utils/navigation_utils.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/social_button.dart';
import 'package:zheeta/widgets/transparent_button.dart';

@RoutePage()
class SignInScreen extends StatefulWidget {
  const SignInScreen({super.key});

  @override
  State<SignInScreen> createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> with Validator {
  final _formKey = GlobalKey<FormState>();

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  bool _isPasswordObscure = true;

  // Example device token; replace with actual Firebase token if needed
  String _userDeviceToken =
      '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) {
          if (state is AuthenticationErrorState) {
            if (state.errorMessage == "Email is not verified") {
              navigateToVerificationPageLogin;
            } else {
              NotifyUser.showSnackbar(state.errorMessage);
            }
          }
          if (state is AuthenticationLoggedInState) {
            router.replace(const HomeRoute());
          }
        },
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 60),
                  Image.asset("assets/images/full-logo.png", height: 36),
                  const SizedBox(height: 40),
                  const Text(signupTitle, style: authTitleStyle),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () {
                      router.replace(const SignUpRoute());
                    },
                    child: Text(signinSubtitle, style: authSubtitleStyle),
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    hintText: 'Email',
                    validator: (data) => validateEmail(data),
                    controller: emailController,
                    onChanged: (value) {},
                  ),
                  InputField(
                    hintText: 'Password',
                    password: _isPasswordObscure,
                    suffixIcon: IconButton(
                      icon: Icon(_isPasswordObscure
                          ? Icons.visibility_off
                          : Icons.visibility),
                      onPressed: () {
                        setState(() {
                          _isPasswordObscure = !_isPasswordObscure;
                        });
                      },
                    ),
                    validator: (data) => validatePassword(data),
                    controller: passwordController,
                    onChanged: (value) {},
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        title: 'Login',
                        state: state is AuthenticationLoadingState,
                        action: () async {
                          if (_formKey.currentState!.validate()) {
                            context.read<AuthenticationCubit>().loginUserCubit(
                                  request: LoginRequest(
                                    email: emailController.text,
                                    password: passwordController.text,
                                    userDeviceToken: _userDeviceToken,
                                    platform: 'APNS', // Platform for iOS
                                  ),
                                );
                          }
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: TransparentButton(
                      title: 'Forgot Password?',
                      action: () {
                        router.push(ForgotPasswordRoute());
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Divider()),
                      Text(signinAlt, style: authAltStyle),
                      SizedBox(
                          width: MediaQuery.of(context).size.width * 0.3,
                          child: Divider()),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(
                        icon: 'assets/images/google.png',
                        width: 50,
                        height: 25,
                      ),
                      const SizedBox(width: 30),
                      SocialButton(
                        icon: "assets/images/fb.png",
                        width: 50,
                        height: 25,
                      ),
                      const SizedBox(width: 30),
                      SocialButton(
                        icon: "assets/images/twitter.png",
                        width: 50,
                        height: 25,
                      ),
                    ],
                  ),
                  const SizedBox(height: 40),
                  SocialButton(
                    icon: 'assets/images/whatsapp.png',
                    text: 'WhatsApp support',
                    color: Colors.green.shade300,
                    height: 28,
                    width: MediaQuery.of(context).size.width,
                    link: 'https://api.whatsapp.com/send?phone=447767594803',
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
