import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage<String>()
class ResetPasswordOtpScreen extends StatefulWidget {
  final String email;
  const ResetPasswordOtpScreen({super.key, required this.email});

  @override
  State<ResetPasswordOtpScreen> createState() => _ResetPasswordOtpScreenState();
}

class _ResetPasswordOtpScreenState extends State<ResetPasswordOtpScreen>
    with ValidationHelperMixin {
  final formKey = GlobalKey<FormState>();
  String otp = '';

  @override
  void initState() {
    super.initState();
  }

  final validatorChange = ValueNotifier<dynamic>(null);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                      Text('Reset Password',
                          style: forgotTitleStyle, textAlign: TextAlign.center),
                      SizedBox(height: 15),
                      Text('An otp code has been sent to your email address',
                          style: forgotSubtitleStyle,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              Form(
                key: formKey,
                child: PinCodeTextField(
                  validator: (value) => isValidNumber(value!, minLength: 6),
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
                    setState(() {
                      otp = value;
                    });
                  },
                ),
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: ListenableBuilder(
                    listenable: validatorChange,
                    builder: (context, _) {
                      return PrimaryButton(
                        title: 'Next',
                        disabled: isValidNumber(otp, minLength: 6) != null,
                        action: () {
                          if (formKey.currentState!.validate()) {
                            router.push(ResetPasswordRoute(
                                request: ResetPasswordRequest(
                                    email: widget.email,
                                    otp: otp,
                                    newPassword: '')));
                          }
                        },
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
