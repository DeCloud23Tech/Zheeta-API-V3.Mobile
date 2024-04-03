import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/mixins/validator_mixin.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage<ResetPasswordRequest>()
class ResetPasswordScreen extends StatefulWidget {
  ResetPasswordRequest request;
  ResetPasswordScreen({super.key, required this.request});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen>
    with Validator {
  late UserAuthViewModel userAuthViewModel;

  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  @override
  void initState() {
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
                        Text('Reset Password',
                            style: forgotTitleStyle,
                            textAlign: TextAlign.center),
                        SizedBox(height: 15),
                        Text('Create a new password',
                            style: forgotSubtitleStyle,
                            textAlign: TextAlign.center),
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 32),
                InputField(
                  validator: (data) => validatePassword(data),
                  controller: passwordController,
                  onChanged: (value) {
                    validatorChange.value = value;
                  },
                  hintText: 'New password',
                  password: true,
                ),
                InputField(
                  validator: (data) =>
                      validateConfirmPassword(data, passwordController.text),
                  controller: confirmPasswordController,
                  onChanged: (value) {
                    validatorChange.value = value;
                  },
                  hintText: 'Retype password',
                  password: true,
                ),
                SizedBox(height: 32),
                SizedBox(
                  width: double.infinity,
                  child: ListenableBuilder(
                      listenable: validatorChange,
                      builder: (context, _) {
                        return PrimaryButton(
                          title: 'Reset Password',
                          disabled: validatePassword(passwordController.text) !=
                                  null ||
                              userAuthViewModel.validateRetypedPassword() !=
                                  null,
                          state: state is AuthenticationLoadingState,
                          action: () {
                            widget.request.newPassword =
                                passwordController.text;

                            context
                                .read<AuthenticationCubit>()
                                .resetPasswordCubit(request: widget.request);
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
