import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:page_transition/page_transition.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/strings.dart';
import 'package:zheeta/app/text_style.dart';
import 'package:zheeta/authentication/presentation/views/signin.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isPasswordObscure = true;
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  final TextEditingController _cpassword = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _referral = TextEditingController();
  final TextEditingController _telephone = TextEditingController();
  final TextEditingController _countryCode = TextEditingController();
  bool agree = false;

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
              Text(signupTitle, style: authTitleStyle),
              SizedBox(height: 5),
              GestureDetector(
                  onTap: () {
                    Navigator.push(context, PageTransition(type: PageTransitionType.fade, child: SignIn()));
                  },
                  child: Text(signupSubtitle, style: authSubtitleStyle)),
              SizedBox(height: 32),
              InputField(controller: _username, label: 'Username'),
              InputField(controller: _password, label: 'Password', password: _isPasswordObscure),
              InputField(controller: _cpassword, label: 'Retype Password', password: _isPasswordObscure),
              // if (_cpassword.text != "")
              if (_cpassword.text != _password.text)
                Text(
                  'Password doesn\'t match!',
                  style: TextStyle(color: red),
                ),
              SizedBox(height: 10),
              InputField(controller: _email, label: 'Email Address'),
              SizedBox(height: 10),
              SizedBox(
                  height: 53,
                  child: IntlPhoneField(
                    disableLengthCheck: true,
                    decoration: InputDecoration(
                        filled: true,
                        fillColor: white,
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: grey.withOpacity(0.5), width: 1.0),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: primaryDark, width: 1.0),
                        ),
                        border: const OutlineInputBorder(),
                        hintText: "Phone number",
                        hintStyle: TextStyle(color: grey.withOpacity(0.5), fontSize: 14),
                        errorStyle: const TextStyle(color: Colors.red)),
                    initialCountryCode: 'NG',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                      setState(() {
                        _telephone.text = phone.completeNumber;
                        _countryCode.text = phone.countryCode;
                      });
                    },
                  )),
              SizedBox(height: 10),
              InputField(controller: _referral, label: 'Referral (Optional)'),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    side: MaterialStateBorderSide.resolveWith(
                      (states) => BorderSide(width: 1.0, color: primaryDark),
                    ),
                    value: agree,
                    onChanged: (value) {
                      setState(() {
                        agree = value!;
                      });
                    },
                  ),
                  Row(
                    children: [
                      Text(
                        'Agree to our',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: black),
                      ),
                      GestureDetector(
                        child: Text(
                          ' terms?',
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: primaryDark),
                        ),
                        onTap: () {},
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 12),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    title: 'Sign Up',
                    action: () {},
                  )),
            ],
          ),
        ),
      ),
    );
  }
}
