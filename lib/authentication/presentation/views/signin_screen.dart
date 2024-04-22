import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validator_mixin.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
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
  bool _isPasswordObscure = true;
  final formKey = GlobalKey<FormState>();
  late UserAuthViewModel userAuthViewModel;
  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();

  String _userDeviceToken =
      '0123456789abcdef0123456789abcdef0123456789abcdef0123456789abcdef';

  @override
  void initState() {
    userAuthViewModel = locator<UserAuthViewModel>();
    super.initState();
  }

  final validatorChange = ValueNotifier<dynamic>(0);

  @override
  Widget build(BuildContext context) {
    //final userAuthState = ref.watch(userAuthViewModelProvider);
    return BlocConsumer<AuthenticationCubit, AuthentcationState>(
        listener: (context, state) {
      if (state is AuthenticationErrorState) {
        if (state.errorMessage == "Email is not verified") {
          userAuthViewModel.navigateToVerificationPageLogin();
        } else {
          WidgetsBinding.instance?.addPostFrameCallback((_) async {
            await NotifyUser.showSnackbar(state.errorMessage);
          });
        }
      }
    }, builder: (context, state) {
      return Scaffold(
        backgroundColor: AppColors.secondaryLight,
        body: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: SingleChildScrollView(
            child: Form(
              key: formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 60),
                  Image.asset("assets/images/full-logo.png", height: 36),
                  SizedBox(height: 40),
                  Text(signinTitle, style: authTitleStyle),
                  SizedBox(height: 5),
                  GestureDetector(
                      onTap: () {
                        router.push(SignUpRoute());
                      },
                      child: Text(signinSubtitle, style: authSubtitleStyle)),
                  SizedBox(height: 32),
                  InputField(
                    validator: (data) => validateEmail(data),
                    controller: emailController,
                    onChanged: (value) {
                      validatorChange.value = value;
                    },
                    hintText: 'Email',
                  ),
                  InputField(
                    hintText: 'Password',
                    password: _isPasswordObscure,
                    controller: passwordController,
                    onChanged: (value) {
                      validatorChange.value = value;
                    },
                  ),
                  SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ListenableBuilder(
                      listenable: validatorChange,
                      builder: (context, _) {
                        return PrimaryButton(
                          title: 'Login',
                          disabled: validateEmail(emailController.text) != null,
                          state: state is AuthenticationLoadingState,
                          action: () async {
                            if (formKey.currentState!.validate()) {
                              context
                                  .read<AuthenticationCubit>()
                                  .loginUserCubit(
                                      request: LoginRequest(
                                          email: emailController.text,
                                          password: passwordController.text,
                                          userDeviceToken: _userDeviceToken,
                                          platform: 'APNS'));
                            }
                          },
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    child: TransparentButton(
                      title: 'Forgot Password?',
                      action: () {
                        router.push(ForgotPasswordRoute());
                      },
                    ),
                  ),
                  SizedBox(height: 20),
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
                  SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SocialButton(icon: "assets/images/google.png"),
                      SizedBox(width: 30),
                      SocialButton(icon: "assets/images/fb.png"),
                      SizedBox(width: 30),
                      SocialButton(icon: "assets/images/twitter.png"),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}
