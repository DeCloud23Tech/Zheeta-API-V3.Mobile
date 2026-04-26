import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/constansts.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/constants/text_style.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/services/agreement_service.dart';
import 'package:zheeta/core/services/push_notification_service.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/pending_verification_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/social_button.dart';
import 'package:zheeta/shared/widgets/transparent_button.dart';

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
  bool _rememberMe = false;

  final IUserStorage userStorage = locator<IUserStorage>();
  final ITokenStorage storage = locator<ITokenStorage>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _restorePendingVerificationIfAny();
    });
    _loadSavedCredentials();
  }

  Future<void> _restorePendingVerificationIfAny() async {
    final pendingVerification = await PendingVerificationUtils.read();
    if (pendingVerification == null || !mounted) return;

    context.router.pushAndPopUntil(
      VerificationRoute(
        isPhoneNumber: pendingVerification.isPhoneNumber,
        phoneNumber: pendingVerification.phoneNumber,
        countryCode: pendingVerification.countryCode,
        email: pendingVerification.email,
      ),
      predicate: (route) => false,
    );
  }

  Future<void> _loadSavedCredentials() async {
    final rememberedEmail = await userStorage.getRememberedEmail();
    final rememberedPassword = await userStorage.getRememberedPassword();

    if (rememberedEmail != null &&
        rememberedEmail.isNotEmpty &&
        rememberedPassword != null &&
        rememberedPassword.isNotEmpty) {
      emailController.text = rememberedEmail;
      passwordController.text = rememberedPassword;
      if (mounted) {
        setState(() {
          _rememberMe = true;
        });
      }
      return;
    }

    final savedEmail = await userStorage.getEmail();
    if (savedEmail != null && savedEmail.isNotEmpty && mounted) {
      emailController.text = savedEmail;
      setState(() {});
    }
  }

  @override
  void dispose() {
    passwordController.dispose();
    emailController.dispose();
    _isPasswordObscure.dispose();
    super.dispose();
  }

  Future<void> _handleLogin(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      final pushNotificationService = locator<PushNotificationService>();

      String? deviceToken;
      try {
        deviceToken = await pushNotificationService.getDeviceToken();
        if (deviceToken == null || deviceToken.isEmpty) {
          NotifyUser.showSnackBar("Unable to retrieve device token",
              type: SnackBarType.warning);
        }
      } catch (e, s) {
        debugPrint("Error fetching device token: $e\n$s");
        NotifyUser.showSnackBar("Error retrieving device token.",
            type: SnackBarType.warning);
      }

      final platform = Platform.isIOS ? 'APNS' : 'GCM';

      if (!context.mounted) return;

      context.read<AuthenticationCubit>().loginUserCubit(
            request: LoginRequest(
              email: emailController.text.trim(),
              password: passwordController.text.trim(),
              userDeviceToken: deviceToken ??
                  '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef',
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: BlocListener<AuthenticationCubit, AuthenticationState>(
        listener: (context, state) async {
          if (state is AuthenticationErrorState) {
            NotifyUser.showSnackBar(state.errorMessage,
                type: SnackBarType.error);
          } else if (state is AuthenticationLoggedInState) {
            // Save the user's email (existing logic)
            userStorage.saveEmail(emailController.text);

            if (_rememberMe) {
              await userStorage.saveRememberedCredentials(
                email: emailController.text.trim(),
                password: passwordController.text.trim(),
              );
            } else {
              await userStorage.clearRememberedCredentials();
            }

            // Reset the agreement status so it shows on the next app launch/home screen load
            // if the user has just logged in or signed up.
            await locator<AgreementService>().resetAgreementStatus();

            if (!context.mounted) return;
            // Navigate to HomeRoute and remove all previous routes from the stack
            context.router.pushAndPopUntil(
              const HomeRoute(),
              predicate: (route) => false,
            );
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.onUserInteraction,
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
                    prefixIcon: const Icon(
                      Icons.person_outline,
                      color: AppColors.grey,
                    ),
                  ),
                  ValueListenableBuilder<bool>(
                    valueListenable: _isPasswordObscure,
                    builder: (context, isObscure, _) {
                      return InputField(
                        hintText: 'Password',
                        password: isObscure,
                        prefixIcon: const Icon(
                          Icons.password_outlined,
                          color: AppColors.grey,
                        ),
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
                  const SizedBox(height: 12),
                  Row(
                    children: [
                      SizedBox(
                        width: 27,
                        height: 27,
                        child: Checkbox(
                          value: _rememberMe,
                          activeColor: AppColors.primaryDark,
                          side: const BorderSide(
                            color: AppColors.primaryDark,
                            width: 1.2,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _rememberMe = value ?? false;
                            });
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      const Text(
                        'Remember me',
                        style: TextStyle(
                          color: AppColors.grayscale,
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 28),
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
                        child: Text('Contact Support', style: authAltStyle),
                      ),
                      _buildDivider(),
                    ],
                  ),
                  const SizedBox(height: 20),
                  // _buildSocialButtons(),
                  SocialButton(
                    icon: 'assets/images/whatsapp.png',
                    text: 'WhatsApp Support',
                    color: Colors.green.shade300,
                    height: 28,
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
