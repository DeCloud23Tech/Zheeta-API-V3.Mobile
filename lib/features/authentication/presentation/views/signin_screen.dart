import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/constansts.dart';
import 'package:zheeta/common/constants/strings.dart';
import 'package:zheeta/common/constants/text_style.dart';
import 'package:zheeta/common/mixins/validator_mixin.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/common/services/push_notification_service.dart';
import 'package:zheeta/core/injection/di.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/data/request/login_request.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
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
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<bool> _isPasswordObscure = ValueNotifier(true);

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    _isPasswordObscure.dispose();
    super.dispose();
  }

  void _handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final pushNotificationService = locator<PushNotificationService>();
      final deviceToken = await pushNotificationService.getDeviceToken();
      final platform = Platform.isIOS ? 'APNS' : 'GCM';

      if(!context.mounted) return;
      context.read<AuthenticationCubit>().loginUserCubit(
        request: LoginRequest(
          email: emailController.text.trim(),
          password: passwordController.text.trim(),
          userDeviceToken: deviceToken ?? '',
          platform: platform,
        ),
      );
    }
  }

  Widget _buildDivider() {
    return Expanded(
      child: Divider(color: Colors.grey.shade400, thickness: 1),
    );
  }

  Widget _buildSocialButtons() {
    const double buttonSpacing = 30.0;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: const [
        SocialButton(icon: 'assets/images/google.png', width: 50, height: 25),
        SizedBox(width: buttonSpacing),
        SocialButton(icon: "assets/images/fb.png", width: 50, height: 25),
        SizedBox(width: buttonSpacing),
        SocialButton(icon: "assets/images/twitter.png", width: 50, height: 25),
      ],
    );
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
            context.router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (route) => false, // Removes all previous routes
            );
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
                  Image.asset("assets/images/full-logo.png", height: 36),
                  const SizedBox(height: 40),
                  const Text(signinTitle, style: authTitleStyle),
                  const SizedBox(height: 5),
                  GestureDetector(
                    onTap: () => router.replace(SignUpRoute()),
                    child: const Text(signinSubtitle, style: authSubtitleStyle),
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    hintText: 'Email',
                    validator: validateEmail,
                    controller: emailController,
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isPasswordObscure,
                    builder: (context, isObscure, _) {
                      return InputField(
                        hintText: 'Password',
                        password: isObscure,
                        suffixIcon: IconButton(
                          icon: Icon(isObscure
                              ? Icons.visibility_off
                              : Icons.visibility),
                          onPressed: () =>
                              _isPasswordObscure.value = !isObscure,
                        ),
                        validator: validatePassword,
                        controller: passwordController,
                      );
                    },
                  ),
                  const SizedBox(height: 32),
                  BlocBuilder<AuthenticationCubit, AuthenticationState>(
                    builder: (context, state) {
                      return PrimaryButton(
                        title: 'Login',
                        state: state is AuthenticationLoadingState,
                        action: () => _handleLogin(context),
                      );
                    },
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TransparentButton(
                      title: 'Forgot Password?',
                      action: () {
                        router.push(const ForgotPasswordRoute());
                      },
                    ),
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildDivider(),
                      const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 8),
                        child: Text(//signinAlt,
                          'Contact Support',
                           style: authAltStyle),
                      ),
                      _buildDivider(),
                    ],
                  ),
                  // const SizedBox(height: 20),
                  // _buildSocialButtons(),
                  const SizedBox(height: 50),
                  SocialButton(
                    icon: 'assets/images/whatsapp.png',
                    text: 'WhatsApp',
                    color: Colors.green.shade300,
                    height: 28,
                    width: MediaQuery.of(context).size.width,
                    link: launchWhatsApp,
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
