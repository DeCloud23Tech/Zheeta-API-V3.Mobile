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

  static void cancelTimer() {
    _timer?.cancel();
    _timer = null;
  }

  static void resendOtp({
    required BuildContext context,
    required bool isPhoneNumber,
    required String phoneNumber,
    required String email,
    required AuthenticationCubit authCubit,
    required Function(bool) onResent,
  }) async {
    final bool haveResentOtp = isPhoneNumber
        ? await authCubit.sendPhoneVerifyOtpCubit(phone: phoneNumber)
        : await authCubit.sendEmailVerifyOtpCubit(email: email);
    onResent(haveResentOtp);
  }
}
