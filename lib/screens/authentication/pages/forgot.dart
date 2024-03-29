import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:zheeta/constants/color.dart';
import 'package:zheeta/constants/strings.dart';
import 'package:zheeta/constants/text_style.dart';
import 'package:zheeta/screens/widgets/back_button.dart';
import 'package:zheeta/screens/widgets/input_field.dart';
import 'package:zheeta/screens/widgets/modal.dart';
import 'package:zheeta/screens/widgets/primary_button.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final TextEditingController _email = TextEditingController();

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
              CustomBackButton(),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(forgotTitle,
                          style: forgotTitleStyle, textAlign: TextAlign.center),
                      SizedBox(height: 15),
                      Text(forgotSubtitle,
                          style: forgotSubtitleStyle,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              InputField(controller: _email, label: 'E-mail Address'),
              SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                      title: 'Reset Password',
                      action: () => showCupertinoDialog(
                          barrierDismissible: true,
                          context: context,
                          builder: (context) => Modal(
                              content:
                                  "We sent an email to christinedoe@company.com with link to reset your password",
                              btn1Title: "Done",
                              action: () => Navigator.pop(context)))))
            ],
          ),
        ),
      ),
    );
  }
}
