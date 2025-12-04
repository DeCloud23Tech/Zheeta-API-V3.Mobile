import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:zheeta/core/constants/color.dart';
import 'package:zheeta/core/constants/constansts.dart';
import 'package:zheeta/core/constants/strings.dart';
import 'package:zheeta/core/constants/text_style.dart';
import 'package:zheeta/core/mixin/validation_mixin.dart';
import 'package:zheeta/core/services/push_notification_service.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/core/utils/notify.dart';
import 'package:zheeta/core/utils/otp_utils.dart';
import 'package:zheeta/di/di.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';
import 'package:zheeta/router/app_router.dart';
import 'package:zheeta/router/app_router.gr.dart';
import 'package:zheeta/shared/enums/snackbar_type.dart';
import 'package:zheeta/shared/widgets/input_field.dart';
import 'package:zheeta/shared/widgets/primary_button.dart';
import 'package:zheeta/shared/widgets/social_button.dart';
import 'package:zheeta/shared/widgets/transparent_button.dart';

class PhoneVerificationScreen extends StatefulWidget {
  final String phoneNumber;
  final String countryCode;

  const PhoneVerificationScreen({
    super.key,
    required this.phoneNumber,
    required this.countryCode,
  });

  @override
  State<PhoneVerificationScreen> createState() =>
      _PhoneVerificationScreenState();
}

class _PhoneVerificationScreenState extends State<PhoneVerificationScreen>
    with Validator {
  final formKey = GlobalKey<FormState>();
  String _otp = '';
  bool _resendEnabled = true;
  int _countdown = 0;

  void _startResendOtpTimer() {
    OtpUtils.startTimer((countdown) {
      setState(() {
        _countdown = countdown;
        _resendEnabled = countdown == 0;
      });
    }, () {
      if (mounted) {
        setState(() {
          _resendEnabled = true;
        });
      }
    });
  }

  void _resendOtp() {
    OtpUtils.resendOtp(
      email: '',
      context: context,
      isPhoneNumber: true,
      phoneNumber: widget.phoneNumber,
      authCubit: context.read<AuthenticationCubit>(),
      onResent: (success) {
        if (success) {
          _startResendOtpTimer();
        }
      },
    );
  }

  Future<void> _verifyPhone(BuildContext context) async {
    final authCubit = context.read<AuthenticationCubit>();
    final request = VerifyPhoneOtpRequest(
      phoneNumber: widget.phoneNumber,
      otp: _otp,
    );

    final success = await authCubit.verifyPhoneOtpCubit(request: request);

    if (success) {
      router.pushAndPopUntil(const HomeRoute(), predicate: (_) => false);
    } else {
      NotifyUser.showSnackBar('Invalid OTP. Please try again.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationErrorState) {
          NotifyUser.showSnackBar(state.errorMessage);
        }
      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.secondaryLight,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16.0),
                    Text(
                      "Verify Your Phone Number",
                      style: forgotTitleStyle,
                    ),
                    const SizedBox(height: 16.0),
                    Text(
                      "We have sent an OTP to ${widget.countryCode}${widget.phoneNumber}. Please enter it below.",
                      style: forgotSubtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 32.0),
                    PinCodeTextField(
                      validator: (data) => isValidInput(data),
                      autovalidateMode: AutovalidateMode.disabled,
                      appContext: context,
                      length: 6,
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
                      onChanged: (value) {
                        setState(() {
                          _otp = value;
                        });
                      },
                    ),
                    const SizedBox(height: 16.0),
                    Center(
                      child: _resendEnabled
                          ? GestureDetector(
                              onTap: _resendOtp,
                              child: Text(
                                'Resend OTP',
                                style: TextStyle(color: AppColors.primaryDark),
                              ),
                            )
                          : Text(
                              'Send Again OTP ($_countdown\s)',
                              style: TextStyle(
                                color: Colors.blue.withValues(alpha: 0.5),
                              ),
                            ),
                    ),
                    const Spacer(),
                    PrimaryButton(
                      state: state is AuthenticationLoadingState,
                      title: 'Verify',
                      action: () async {
                        final isValid = formKey.currentState?.validate();
                        if (isValid ?? false) {
                          await _verifyPhone(context);
                        }
                      },
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
