import 'dart:async';

import 'package:flutter/material.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/strings.dart';
import 'package:zheeta/app/text_style.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

class Verification extends StatefulWidget {
  final phone;
  const Verification({this.phone, super.key});

  @override
  State<Verification> createState() => _VerificationState();
}

class _VerificationState extends State<Verification> {
  final TextEditingController _otp = TextEditingController();

  bool _isLoading = false;

  late Timer _timer;
  int _counter = 59;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_counter == 0) {
          setState(() {
            timer.cancel();
          });
        } else {
          setState(() {
            _counter--;
          });
        }
      },
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => startTimer());
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
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
              CustomBackButton(),
              SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(verificationTitle, style: forgotTitleStyle, textAlign: TextAlign.center),
                      SizedBox(height: 15),
                      Text.rich(
                          TextSpan(text: verificationSubtitle, style: forgotSubtitleStyle, children: [
                            TextSpan(
                              text: widget.phone,
                              style: TextStyle(color: primaryDark),
                            )
                          ]),
                          textAlign: TextAlign.center)
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              InputField(controller: _otp, label: 'OTP'),
              if (_otp.text == "")
                Text(
                  'Please enter OTP',
                  style: TextStyle(color: red),
                ),
              SizedBox(height: 22),
              Center(
                child: _counter == 0
                    ? GestureDetector(
                        onTap: () {
                          startTimer();
                        },
                        child: Text(
                          'Resend OTP',
                          style: TextStyle(color: primaryDark),
                        ))
                    : GestureDetector(
                        child: Text('Send Again OTP ($_counter\s)', style: TextStyle(color: Colors.blue)),
                        onTap: () {},
                      ),
              ),
              SizedBox(height: 32),
              SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                      state: _isLoading,
                      title: 'Continue',
                      action: () {
                        setState(() {});
                        if (_otp.text != "") {
                          setState(() {
                            _isLoading == !_isLoading;
                          });
                        }
                      }))
            ],
          ),
        ),
      ),
    );
  }
}
