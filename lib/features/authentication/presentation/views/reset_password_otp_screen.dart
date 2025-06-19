import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/text_style.dart';
import 'package:zheeta/common/mixins/validation_helper.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/router/app_router.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/features/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ResetPasswordOtpScreen extends StatefulWidget {
  final String email;

  const ResetPasswordOtpScreen({super.key, required this.email});

  @override
  State<ResetPasswordOtpScreen> createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen>
    with ValidationHelperMixin {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController = TextEditingController();
  final ValueNotifier<String> _otpNotifier = ValueNotifier<String>('');

  @override
  void dispose() {
    _otpController.dispose();
    _otpNotifier.dispose();
    super.dispose();
  }

  void _handleNext() async {
    if (_formKey.currentState!.validate()) {
      final data = VerifyEmailOtpRequest(email: widget.email, otp: _otpController.text);
      // Call the verifyEmailOtpCubit method
      final isVerified = await context.read<AuthenticationCubit>().verifyEmailOtpCubit(request: data);

      if (isVerified) {
        // Navigate to ResetPasswordRoute only if the OTP is verified
        router.push(
          ResetPasswordRoute(
            request: ResetPasswordRequest(
              email: widget.email,
              otp: _otpController.text,
              newPassword: '',
            ),
          ),
        );
      } else {
        // Optionally, show a message if verification fails
        NotifyUser.showSnackBar('Invalid OTP. Please try again.');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.secondaryLight,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 60),
              const CustomBackButton(),
              const SizedBox(height: 40),
              Center(
                child: Column(
                  children: [
                    Text('Reset Password', style: forgotTitleStyle),
                    const SizedBox(height: 10),
                    Text(
                      'An OTP code has been sent to your email address.',
                      style: forgotSubtitleStyle,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 32),
              Form(
                key: _formKey,
                child: PinCodeTextField(
                  controller: _otpController,
                  appContext: context,
                  length: 6,
                  autoDismissKeyboard: true,
                  animationType: AnimationType.fade,
                  keyboardType: TextInputType.number,
                  validator: (value) => isValidNumber(value ?? '', minLength: 6),
                  onChanged: (value) => _otpNotifier.value = value,
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
                    activeFillColor: Colors.white,
                  ),
                  cursorColor: AppColors.black,
                  animationDuration: const Duration(milliseconds: 300),
                  enableActiveFill: true,
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<String>(
                  valueListenable: _otpNotifier,
                  builder: (context, value, _) {
                    return PrimaryButton(
                      title: 'Next',
                      disabled: isValidNumber(value, minLength: 6) != null,
                      action: _handleNext,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
