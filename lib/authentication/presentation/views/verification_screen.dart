import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/app/strings.dart';
import 'package:zheeta/app/text_style.dart';
import 'package:zheeta/authentication/presentation/view_model/user_auth_viewmodel.dart';
import 'package:zheeta/authentication/presentation/view_model/user_otp_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
@RouteType.custom(transitionsBuilder: TransitionsBuilders.slideLeft)
class VerificationScreen extends ConsumerStatefulWidget {
  final String identifier;
  final bool isPhoneNumber;
  const VerificationScreen({required this.identifier, required this.isPhoneNumber, super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  late UserOtpViewModel _userOtpViewModel;

  final formKey = GlobalKey<FormState>();

  late Timer _timer;
  late int _counter;

  void startTimer() {
    _counter = 59;
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
    _counter = 59;
    _userOtpViewModel = ref.read(userOtpViewModelProvider.notifier);
    if (widget.isPhoneNumber) {
      _userOtpViewModel.setPhoneNumber = widget.identifier;
    } else {
      _userOtpViewModel.setEmail = widget.identifier;
    }

    startTimer();
  }

  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final _userAuthViewModel = ref.watch(userAuthViewModelProvider);
    return Stack(
      children: [
        Scaffold(
          backgroundColor: AppColors.secondaryLight,
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
                          Text(
                            "$verificationTitle ${widget.isPhoneNumber ? 'Phone Number' : 'Email'}",
                            style: forgotTitleStyle,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 15),
                          Text.rich(
                              TextSpan(
                                text: verificationSubtitle,
                                style: forgotSubtitleStyle,
                                children: [
                                  TextSpan(
                                    text: widget.identifier,
                                    style: TextStyle(color: AppColors.primaryDark),
                                  )
                                ],
                              ),
                              textAlign: TextAlign.center)
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Form(
                    key: formKey,
                    child: InputField(
                      onChanged: (value) => _userOtpViewModel.setOtp = value,
                      validator: (value) => _userOtpViewModel.validateOtp(),
                      label: 'OTP',
                    ),
                  ),
                  SizedBox(height: 22),
                  Center(
                    child: _counter == 0
                        ? GestureDetector(
                            onTap: () async {
                              late bool haveResentOtp;
                              if (widget.isPhoneNumber) {
                                haveResentOtp = await _userOtpViewModel.sendPhoneVerifyOtp();
                              } else {
                                haveResentOtp = await _userOtpViewModel.sendEmailVerifyOtp();
                              }
                              if (haveResentOtp) {
                                startTimer();
                              }
                            },
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(color: AppColors.primaryDark),
                            ),
                          )
                        : Text(
                            'Send Again OTP ($_counter\s)',
                            style: TextStyle(
                              color: Colors.blue.withOpacity(0.5),
                            ),
                          ),
                  ),
                  SizedBox(height: 32),
                ],
              ),
            ),
          ),
          bottomNavigationBar: Padding(
            padding: EdgeInsets.only(left: 20.0, right: 20.0, bottom: 50.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: PrimaryButton(
                    state: ref.watch(userOtpViewModelProvider).verifyPhoneOtp.isLoading || ref.watch(userOtpViewModelProvider).verifyEmailOtp.isLoading,
                    title: 'Continue',
                    action: () async {
                      final isValid = formKey.currentState?.validate();
                      if (isValid ?? false) {
                        late bool canGoNext;
                        if (widget.isPhoneNumber) {
                          canGoNext = await _userOtpViewModel.verifyPhoneNumber();
                          if (canGoNext)
                            context.router.push(
                              VerificationRoute(identifier: _userAuthViewModel.registerUser.data?.email, isPhoneNumber: false),
                            );
                        } else {
                          canGoNext = await _userOtpViewModel.verifyEmail();
                          if (canGoNext) context.router.push(BioDataRoute());
                        }
                      }
                    },
                  ),
                ),
                if (widget.isPhoneNumber) SizedBox(height: 20),
                if (widget.isPhoneNumber)
                  SizedBox(
                    width: double.infinity,
                    child: PrimaryButton(
                      // state: _isLoading,
                      invert: true,
                      title: 'Skip',
                      action: () {},
                    ),
                  ),
              ],
            ),
          ),
        ),
        ref.watch(userOtpViewModelProvider).sendPhoneVerifyOtp.isLoading || ref.watch(userOtpViewModelProvider).sendEmailVerifyOtp.isLoading ? LoadingScreen() : SizedBox(),
      ],
    );
  }
}
