import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';
import 'package:zheeta/widgets/social_button.dart';
import 'package:zheeta/widgets/transparent_button.dart';

@RoutePage()
class SignInScreen extends ConsumerStatefulWidget {
  const SignInScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SignInScreenState();
}

class _SignInScreenState extends ConsumerState<SignInScreen> {
  bool _isPasswordObscure = true;
  final formKey = GlobalKey<FormState>();
  late UserAuthViewModel userAuthViewModel;

  @override
  void initState() {
    userAuthViewModel = ref.read(userAuthViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userAuthState = ref.watch(userAuthViewModelProvider);
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
                  validator: (data) => userAuthViewModel.validateEmail(),
                  onChanged: (value) => userAuthViewModel.setEmail(value),
                  hintText: 'Email',
                ),
                InputField(
                  hintText: 'Password',
                  password: _isPasswordObscure,
                  validator: (data) => userAuthViewModel.validatePassword(),
                  onChanged: (value) => userAuthViewModel.setPassword(value),
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Login',
                    state: userAuthState.loginUserState.isLoading,
                    action: () async {
                      if (formKey.currentState!.validate()) {
                        await userAuthViewModel.loginUser();
                      }
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
                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: Divider()),
                    Text(signinAlt, style: authAltStyle),
                    SizedBox(width: MediaQuery.of(context).size.width * 0.3, child: Divider()),
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
