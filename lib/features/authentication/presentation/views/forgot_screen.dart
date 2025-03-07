import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zheeta/common/constants/color.dart';
import 'package:zheeta/common/constants/strings.dart';
import 'package:zheeta/common/constants/text_style.dart';
import 'package:zheeta/common/mixins/validator_mixin.dart';
import 'package:zheeta/common/notify/notify_user.dart';
import 'package:zheeta/core/router/app_router.gr.dart';
import 'package:zheeta/features/authentication/presentation/bloc/authentication_cubit.dart';
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
  final TextEditingController emailController = TextEditingController();
  final ValueNotifier<bool> isButtonEnabled = ValueNotifier<bool>(false);

  @override
  void initState() {
    super.initState();
    emailController.addListener(_onEmailChanged);
  }

  @override
  void dispose() {
    emailController.dispose();
    isButtonEnabled.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    final isValid = validateEmail(emailController.text) == null;
    isButtonEnabled.value = isValid;
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationCubit, AuthenticationState>(
      listener: (context, state) {
        if (state is AuthenticationErrorState) {
          NotifyUser.showSnackBar(state.errorMessage);
        } else if (state is AuthenticationSentResetPasswordState) {
          context.router.popAndPush(
            ResetPasswordOtpRoute(
              email: emailController.text,
            ),
          );
        }
      },
      builder: (context, state) {
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
                  Center(
                    child: Column(
                      children: [
                        Text(
                          forgotTitle,
                          style: forgotTitleStyle,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 15),
                        Text(
                          forgotSubtitle,
                          style: forgotSubtitleStyle,
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  InputField(
                    validator: validateEmail,
                    controller: emailController,
                    hintText: 'E-mail Address',
                  ),
                  const SizedBox(height: 32),
                  SizedBox(
                    width: double.infinity,
                    child: ValueListenableBuilder<bool>(
                      valueListenable: isButtonEnabled,
                      builder: (context, isEnabled, _) {
                        return PrimaryButton(
                          title: 'Reset Password',
                          disabled: !isEnabled || state is AuthenticationLoadingState,
                          state: state is AuthenticationLoadingState,
                          action: () {
                            context.read<AuthenticationCubit>().sendResetPasswordCubit(
                              email: emailController.text,
                            );
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
      },
    );
  }
}
