import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ForgotPasswordScreen extends ConsumerStatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends ConsumerState<ForgotPasswordScreen> {
  late UserOtpViewModel userOtpViewModel;

  @override
  void initState() {
    userOtpViewModel = ref.read(userOtpViewModelProvider.notifier);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final userOtpState = ref.watch(userOtpViewModelProvider);
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
                      Text(forgotTitle, style: forgotTitleStyle, textAlign: TextAlign.center),
                      SizedBox(height: 15),
                      Text(forgotSubtitle, style: forgotSubtitleStyle, textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              InputField(
                validator: (data) => userOtpViewModel.validateEmail(),
                onChanged: (value) => userOtpViewModel.setEmail = value,
                hintText: 'E-mail Address',
              ),
              SizedBox(height: 32),
              SizedBox(
                width: double.infinity,
                child: PrimaryButton(
                  title: 'Reset Password',
                  state: userOtpState.sendPasswordResetOtpState.isLoading,
                  action: () {
                    userOtpViewModel.sendPasswordResetOtp();
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
