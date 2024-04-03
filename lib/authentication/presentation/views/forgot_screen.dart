import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validator_mixin.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/strings.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:zheeta/authentication/presentation/viewmodel/forgot_password_viewmodel.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_otp_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({super.key});

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen>
    with Validator {
  late ForgotPasswordViewModel forgotPasswordViewModel;

  @override
  void initState() {
    forgotPasswordViewModel = ForgotPasswordViewModel();
    super.initState();
  }

  final validatorChange = ValueNotifier<dynamic>(null);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthentcationState>(
        listener: (context, state) {
      if (state is AuthenticationErrorState) {
        NotifyUser.showSnackbar(state.errorMessage);
      }

      if (state is AuthenticationSentResetPasswordState) {
        router.popAndPush(ResetPasswordOtpRoute(
            email: forgotPasswordViewModel.emailController.text));
      }
    }, builder: (context, state) {
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
                        Text(forgotTitle,
                            style: forgotTitleStyle,
                            textAlign: TextAlign.center),
                        SizedBox(height: 15),
                        Text(forgotSubtitle,
                            style: forgotSubtitleStyle,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),
                InputField(
                  validator: (data) => validateEmail(data),
                  controller: forgotPasswordViewModel.emailController,
                  onChanged: (value) {
                    validatorChange.value = value;
                  },
                  hintText: 'E-mail Address',
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ListenableBuilder(
                      listenable: validatorChange,
                      builder: (context, _) {
                        return PrimaryButton(
                          title: 'Reset Password',
                          disabled: validateEmail(forgotPasswordViewModel
                                  .emailController.text) !=
                              null,
                          state: state is AuthenticationLoadingState,
                          action: () {
                            context
                                .read<AuthenticationCubit>()
                                .sendResetPasswordCubit(
                                    email: forgotPasswordViewModel
                                        .emailController.text);
                          },
                        );
                      }),
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
