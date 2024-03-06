import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/color.dart';
import 'package:zheeta/app/common/text_style.dart';
import 'package:zheeta/authentication/presentation/viewmodel/user_auth_viewmodel.dart';
import 'package:zheeta/widgets/back_button.dart';
import 'package:zheeta/widgets/input_field.dart';
import 'package:zheeta/widgets/primary_button.dart';

@RoutePage()
class ResetPasswordScreen extends ConsumerStatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends ConsumerState<ResetPasswordScreen> {
  late UserAuthViewModel userAuthViewModel;

  @override
  void initState() {
    super.initState();
    userAuthViewModel = ref.read(userAuthViewModelProvider.notifier);
  }

  final validatorChange = ValueNotifier<dynamic>(null);

  @override
  Widget build(BuildContext context) {
    final userAuthState = ref.watch(userAuthViewModelProvider);
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
                      Text('Create a new password',
                          style: forgotSubtitleStyle,
                          textAlign: TextAlign.center),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 32),
              InputField(
                validator: (data) => userAuthViewModel.validatePassword(),
                onChanged: (value) {
                  validatorChange.value = value;
                  userAuthViewModel.setPassword(value);
                },
                hintText: 'New password',
                password: true,
              ),
              InputField(
                validator: (data) =>
                    userAuthViewModel.validateRetypedPassword(),
                onChanged: (value) {
                  validatorChange.value = value;
                  userAuthViewModel.setRetypePassword(value);
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
                        disabled: userAuthViewModel.validatePassword() !=
                                null ||
                            userAuthViewModel.validateRetypedPassword() != null,
                        state: userAuthState.resetPasswordState.isLoading,
                        action: () {
                          userAuthViewModel.resetPassword();
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
