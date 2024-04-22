import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart';
import 'package:zheeta/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/authentication/presentation/state/user_otp_state.dart';

// final userOtpViewModelProvider =
//     StateNotifierProvider<UserOtpViewModel, UserOtpState>((ref) {
//   final otpUsecase = locator<UserOtpUseCase>();
//   return UserOtpViewModel(otpUsecase);
// });

@prod
@LazySingleton()
class UserOtpViewModel with ValidationHelperMixin {
  UserOtpViewModel();

  String _phoneNumber = '';

  String _countryCode = '';

  bool _isPhoneNumberVerification = true;

  String _email = '';
  set setEmail(String value) => _email = value;

  String? validateEmail() => this.isValidEmail(_email);

  String _otp = '';
  set setOtp(String value) => _otp = value;

  String? validateOtp() => this.isValidInput(_otp);

  // Timer for countdown..
  late Timer _timer;

  void startTimer() {
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {},
    );
  }

  setPhoneNumberOrEmail({
    required bool isPhoneNumber,
    required String phoneNumber,
    required String countryCode,
    required String email,
  }) {
    _isPhoneNumberVerification = isPhoneNumber;
    _phoneNumber = phoneNumber;
    _countryCode = countryCode;
    _email = email;
  }

  reSendPhoneOrEmailOtp(BuildContext context) async {
    late bool haveResentOtp;
    if (_isPhoneNumberVerification) {
      haveResentOtp = await sendPhoneVerifyOtp(context);
    } else {
      haveResentOtp = await sendEmailVerifyOtp(context);
    }
    if (haveResentOtp) {
      startTimer();
    }
  }

  verifyPhoneOrEmail(BuildContext context) async {
    late bool canGoNext;
    if (_isPhoneNumberVerification) {
      canGoNext = await verifyPhoneNumber(context);
      if (canGoNext) {
        final emailSent = await sendEmailVerifyOtp(context);
        if (emailSent) {
          setOtp = '';
          router.popAndPush(
            VerificationRoute(
                isPhoneNumber: false,
                email: _email,
                phoneNumber: _phoneNumber,
                countryCode: _countryCode),
          );
        }
      }
    } else {
      canGoNext = await verifyEmail(context);
      if (canGoNext)
        router.pushAndPopUntil(SignInRoute(), predicate: (route) => false);
    }
  }

  Future<bool> sendPhoneVerifyOtp(BuildContext context) async {
    // state = state.setSendPhoneVerifyOtpState(State.loading());
    // try {
    return await context
        .read<AuthenticationCubit>()
        .sendPhoneVerifyOtpCubit(phone: _phoneNumber);

    // } on Exception catch (e) {
    //   state = state.setSendPhoneVerifyOtpState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }

  Future<bool> sendEmailVerifyOtp(BuildContext context) async {
    // state = state.setSendEmailVerifyOtpState(State.loading());
    // try {
    return await context
        .read<AuthenticationCubit>()
        .sendEmailVerifyOtpCubit(email: _email);
    // state = state.setSendEmailVerifyOtpState(State.success(result));
    // return true;
    // } on Exception catch (e) {
    //   state = state.setSendEmailVerifyOtpState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }

  Future<bool> verifyPhoneNumber(BuildContext context) async {
    //state = state.setVerifyPhoneOtpState(State.loading());
    //try {
    final data = VerifyPhoneOtpRequest(phoneNumber: _phoneNumber, otp: _otp);
    return await context
        .read<AuthenticationCubit>()
        .verifyPhoneOtpCubit(request: data);

    // } on Exception catch (e) {
    //   state = state.setVerifyPhoneOtpState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }

  Future<bool> verifyEmail(BuildContext context) async {
    //state = state.setVerifyEmailOtpState(State.loading());
    //try {
    final data = VerifyEmailOtpRequest(email: _email, otp: _otp);
    return await context
        .read<AuthenticationCubit>()
        .verifyEmailOtpCubit(request: data);

    // } on Exception catch (e) {
    //   state = state.setVerifyEmailOtpState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }

  Future<void> sendPasswordResetOtp() async {
    // state = state.setSendPasswordResetOtpState(State.loading());
    // try {
    //   final isValidEmailOrMessage = validateEmail();
    //   if (isValidEmailOrMessage == null) {
    //     final result = await _otpUsecase.sendPasswordResetOtpUsecase(_email);
    //     state = state.setSendPasswordResetOtpState(State.success(result));
    //     //router.popAndPush(ResetPasswordOtpRoute());
    //     return true;
    //   } else {
    //     NotifyUser.showSnackbar(isValidEmailOrMessage);
    //     state = state.setSendPasswordResetOtpState(
    //         State.error(Exception(isValidEmailOrMessage)));
    //     return false;
    //   }
    // } on Exception catch (e) {
    //   state = state.setSendPasswordResetOtpState(State.error(e));
    //   NotifyUser.showSnackbar(e.toString());
    //   return false;
    // }
  }
}
