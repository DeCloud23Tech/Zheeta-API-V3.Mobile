import 'package:flutter/material.dart';
import 'package:flutter_session_manager/flutter_session_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/constants/strings.dart';
import 'package:zheeta/constants/text_style.dart';
import 'package:zheeta/models/login_model.dart';
import 'package:zheeta/screens/authentication/pages/forgot.dart';
import 'package:zheeta/screens/authentication/pages/signup.dart';
import 'package:zheeta/screens/widgets/input_field.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';
import 'package:zheeta/screens/widgets/social_button.dart';
import 'package:zheeta/screens/widgets/transparent_button.dart';
import 'package:zheeta/services/user_service.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  bool _isPasswordObscure = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();

  getSession() async {
    var sessionManager = SessionManager();
    var e = await sessionManager.get("username");
    var p = await sessionManager.get("password");
    if (e != null)
      setState(() {
        _username.text = e;
        _password.text = p;
      });
  }

  void initState() {
    super.initState();
    getSession();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: secondaryLight,
      body: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SingleChildScrollView(
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
                    Navigator.push(
                        context,
                        PageTransition(
                            type: PageTransitionType.fade, child: SignUp()));
                  },
                  child: Text(signinSubtitle, style: authSubtitleStyle)),
              SizedBox(height: 32),
              InputField(controller: _username, label: 'Username / Email'),
              InputField(
                  controller: _password,
                  label: 'Password',
                  password: _isPasswordObscure),
              SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Login',
                    action: () {
                      UserService().login(
                          LoginRequest(
                              email: _username.text,
                              password: _password.text,
                              userDeviceToken: 'xxxxxxx-yyyyy-xxxxxx'),
                          context);
                    },
                  )),
              SizedBox(height: 20),
              SizedBox(
                  width: double.infinity,
                  child: TransparentButton(
                      title: 'Forgot Password?',
                      action: () {
                        Navigator.push(
                            context,
                            PageTransition(
                                type: PageTransitionType.rightToLeft,
                                child: ForgotPassword()));
                      })),
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
