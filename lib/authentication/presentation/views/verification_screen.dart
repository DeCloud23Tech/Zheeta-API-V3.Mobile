import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/loading_screen.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class VerificationScreen extends ConsumerStatefulWidget {
  final bool isPhoneNumber;
  final String phoneNumber;
  final String countryCode;
  final String email;
  const VerificationScreen(
      {super.key,
      required this.isPhoneNumber,
      required this.phoneNumber,
      required this.countryCode,
      required this.email});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VerificationScreenState();
}

class _VerificationScreenState extends ConsumerState<VerificationScreen> {
  late UserOtpViewModel userOtpViewModel;

  final formKey = GlobalKey<FormState>();
  @override
  void initState() {
    super.initState();
    userOtpViewModel = ref.read(userOtpViewModelProvider.notifier);
    userOtpViewModel.setPhoneNumberOrEmail(
        isPhoneNumber: widget.isPhoneNumber,
        phoneNumber: widget.phoneNumber,
        countryCode: widget.countryCode,
        email: widget.email);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      userOtpViewModel.startTimer();
    });
  }

  final validatorChange = ValueNotifier<dynamic>(null);

  @override
  Widget build(BuildContext context) {
    final userOtpState = ref.watch(userOtpViewModelProvider);
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
                                  text: widget.isPhoneNumber
                                      ? '${widget.countryCode}${widget.phoneNumber}'
                                      : widget.email,
                                  style:
                                      TextStyle(color: AppColors.primaryDark),
                                ),
                              ],
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 32),
                  Form(
                    key: formKey,
                    child: PinCodeTextField(
                      validator: (data) => userOtpViewModel.validateOtp(),
                      autovalidateMode: AutovalidateMode.disabled,
                      autoDismissKeyboard: true,
                      appContext: context,
                      pastedTextStyle: TextStyle(
                        color: AppColors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 14,
                      ),
                      length: 6,
                      animationType: AnimationType.fade,
                      pinTheme: PinTheme(
                        selectedFillColor: Colors.white,
                        selectedColor: AppColors.black,
                        inactiveFillColor: AppColors.white,
                        inactiveColor: AppColors.grey,
                        shape: PinCodeFieldShape.box,
                        borderWidth: 1,
                        activeColor: AppColors.primaryLight,
                        borderRadius: BorderRadius.circular(4),
                        fieldHeight: 50,
                        fieldWidth: 50,
                        activeFillColor: AppColors.white,
                      ),
                      cursorColor: AppColors.black,
                      animationDuration: const Duration(milliseconds: 300),
                      enableActiveFill: true,
                      keyboardType: TextInputType.number,
                      onChanged: (value) {
                        validatorChange.value = value;
                        userOtpViewModel.setOtp = value;
                      },
                    ),
                  ),
                  SizedBox(height: 22),
                  Center(
                    child: userOtpState.counterState == 0
                        ? GestureDetector(
                            onTap: () async {
                              userOtpViewModel.reSendPhoneOrEmailOtp();
                            },
                            child: Text(
                              'Resend OTP',
                              style: TextStyle(color: AppColors.primaryDark),
                            ),
                          )
                        : Text(
                            'Send Again OTP (${userOtpState.counterState}\s)',
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
                  child: ListenableBuilder(
                      listenable: validatorChange,
                      builder: (context, _) {
                        return PrimaryButton(
                          disabled: userOtpViewModel.validateOtp() != null,
                          state: userOtpState.verifyPhoneOtpState.isLoading ||
                              userOtpState.verifyEmailOtpState.isLoading,
                          title: 'Continue',
                          action: () async {
                            final isValid = formKey.currentState?.validate();
                            if (isValid ?? false) {
                              userOtpViewModel.verifyPhoneOrEmail();
                            }
                          },
                        );
                      }),
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
        (userOtpState.sendPhoneVerifyOtpState.isLoading ||
                userOtpState.sendEmailVerifyOtpState.isLoading)
            ? LoadingScreen()
            : SizedBox(),
      ],
    );
  }
}
