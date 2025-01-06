import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ResetPasswordOtpScreen extends StatefulWidget {
  final String email;

  const ResetPasswordOtpScreen({Key? key, required this.email}) : super(key: key);

  @override
  State<ResetPasswordOtpScreen> createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen>
    with ValidationHelperMixin {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String otp = '';

  final ValueNotifier<String> validatorChange = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
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
              const SizedBox(height: 60),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      Text(
                        'Reset Password',
                        style: forgotTitleStyle,
                        textAlign: TextAlign.center,
                      ),
                      const SizedBox(height: 15),
                      Text(
                        'An OTP code has been sent to your email address',
                        style: forgotSubtitleStyle,
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 32),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  validator: (value) => isValidNumber(value!, minLength: 6),
                  autovalidateMode: AutovalidateMode.disabled,
                  autoDismissKeyboard: true,
                  appContext: context,
                  pastedTextStyle: const TextStyle(
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
                    setState(() {
                      otp = value;
                    });
                  },
                ),
              ),
              const SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ValueListenableBuilder<String>(
                  valueListenable: validatorChange,
                  builder: (context, value, _) {
                    return PrimaryButton(
                      title: 'Next',
                      disabled: isValidNumber(value, minLength: 6) != null,
                      action: () {
                        if (formKey.currentState!.validate()) {
                          // AutoRouter.of(context).push(ResetPasswordRoute(
                          //   request: ResetPasswordRequest(
                          //     email: widget.email,
                          //     otp: otp,
                          //     newPassword: '',
                          //   ),
                          // ));
                        }
                      },
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
