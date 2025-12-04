import 'dart:async';
import 'package:flutter/cupertino.dart';
import 'package:zheeta/features/authentication/presentation/cubits/authentication_cubit/authentication_cubit.dart';

class OtpUtils {
  static Timer? _timer;
  static int _countdown = 60;

  static void startTimer(Function(int) onTick, Function onComplete) {
    _countdown = 60;
    _timer?.cancel();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _countdown--;
      onTick(_countdown);
      if (_countdown == 0) {
        timer.cancel();
        onComplete();
      }
    });
  }

  static void resendOtp({
    required BuildContext context,
    required bool isPhoneNumber,
    required String phoneNumber,
    required String email,
    required AuthenticationCubit authCubit,
    required Function(bool) onResent,
  }) async {
    bool haveResentOtp = false;

    if (isPhoneNumber) {
      authCubit.sendPhoneVerifyOtpCubit(phone: phoneNumber);
      haveResentOtp = true;
    } else {
      authCubit.sendEmailVerifyOtpCubit(email: email);
      haveResentOtp = true;
    }

    if (haveResentOtp) {
      onResent(true);
    } else {
      onResent(false);
    }
  }
}
