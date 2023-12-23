import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/color.dart';
import 'package:zheeta/app/strings.dart';
import 'package:zheeta/app/text_style.dart';
import 'package:zheeta/authentication/presentation/view_model/user_otp_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class VerificationScreen extends ConsumerStatefulWidget {
  final bool isPhoneNumber;
  final String identifier;
  const VerificationScreen({super.key, required this.isPhoneNumber, required this.identifier});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  late UserOtpViewModel _userOtpViewModel;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    _userOtpViewModel = ref.read(userOtpViewModelProvider.notifier);
    _userOtpViewModel.setPhoneNumberOrEmail(widget.isPhoneNumber, widget.identifier);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _userOtpViewModel.startTimer();
    });
  }

  @override
  Widget build(BuildContext context) {
    final watchUserOtpViewModel = ref.watch(userOtpViewModelProvider);
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
                    child: watchUserOtpViewModel.counter == 0
                        ? GestureDetector(
                            onTap: () async {
                              _userOtpViewModel.reSendPhoneOrEmailOtp();
                            },
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(color: AppColors.primaryDark),
                            ),
                          )
                        : Text(
                            'Send Again OTP (${watchUserOtpViewModel.counter}\s)',
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
                    state: watchUserOtpViewModel.verifyPhoneOtp.isLoading || watchUserOtpViewModel.verifyEmailOtp.isLoading,
                    title: 'Continue',
                    action: () async {
                      final isValid = formKey.currentState?.validate();
                      if (isValid ?? false) {
                        _userOtpViewModel.verifyPhoneOrEmail();
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
        watchUserOtpViewModel.sendPhoneVerifyOtp.isLoading || watchUserOtpViewModel.sendEmailVerifyOtp.isLoading ? LoadingScreen() : SizedBox(),
      ],
    );
  }
}
