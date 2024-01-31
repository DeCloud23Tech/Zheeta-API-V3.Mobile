import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/common/mixins/validation_helper.dart';
import 'package:zheeta/app/common/notify/notify_user.dart';
import 'package:zheeta/app/common/storage/local_storage_impl.dart';
import 'package:zheeta/app/common/storage/storage_keys.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/router/app_router.dart';
import 'package:zheeta/app/router/app_router.gr.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/authentication/presentation/state/user_otp_state.dart';

final userOtpViewModelProvider = StateNotifierProvider<UserOtpViewModel, UserOtpState>((ref) {
  final otpUsecase = locator<UserOtpUseCase>();
  return UserOtpViewModel(otpUsecase);
});

class UserOtpViewModel extends StateNotifier<UserOtpState> with ValidationHelperMixin {
  final UserOtpUseCase _otpUsecase;
  UserOtpViewModel(this._otpUsecase)
      : super(UserOtpState(
          resetPasswordState: State.init(),
          sendEmailVerifyOtpState: State.init(),
          sendPhoneVerifyOtpState: State.init(),
          sendPasswordResetOtpState: State.init(),
          verifyEmailOtpState: State.init(),
          verifyPhoneOtpState: State.init(),
          counterState: 0,
        ));

  String _phoneNumber = '';

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
    state = state.setCounter(59);
    const oneSec = const Duration(seconds: 1);
    _timer = new Timer.periodic(
      oneSec,
      (Timer timer) {
        if (state.counterState == 0) {
          timer.cancel();
        } else {
          state = state.setCounter(state.counterState - 1);
        }
      },
    );
  }

  setPhoneNumberOrEmail(bool isPhoneNumber, String identifier) {
    _isPhoneNumberVerification = isPhoneNumber;
    if (isPhoneNumber) {
      _phoneNumber = identifier;
    } else {
      _email = identifier;
    }
  }

  reSendPhoneOrEmailOtp() async {
    late bool haveResentOtp;
    if (_isPhoneNumberVerification) {
      haveResentOtp = await sendPhoneVerifyOtp();
    } else {
      haveResentOtp = await sendEmailVerifyOtp();
    }
    if (haveResentOtp) {
      startTimer();
    }
  }

  verifyPhoneOrEmail() async {
    late bool canGoNext;
    if (_isPhoneNumberVerification) {
      canGoNext = await verifyPhoneNumber();
      if (canGoNext) {
        router.popAndPush(
          VerificationRoute(isPhoneNumber: false, identifier: '${sessionManager.get(SessionManagerKeys.userEmailString)}'),
        );
      }
    } else {
      canGoNext = await verifyEmail();
      if (canGoNext) router.pushAndPopUntil(SignInRoute(), predicate: (route) => false);
    }
  }

  Future<bool> sendPhoneVerifyOtp() async {
    state = state.setSendPhoneVerifyOtpState(State.loading());
    try {
      final result = await _otpUsecase.sendPhoneVerifyOtpUsecase(_phoneNumber);
      state = state.setSendPhoneVerifyOtpState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setSendPhoneVerifyOtpState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> sendEmailVerifyOtp() async {
    state = state.setSendEmailVerifyOtpState(State.loading());
    try {
      final result = await _otpUsecase.sendEmailVerifyOtpUsecase(_email);
      state = state.setSendEmailVerifyOtpState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setSendEmailVerifyOtpState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> verifyPhoneNumber() async {
    state = state.setVerifyPhoneOtpState(State.loading());
    try {
      final data = VerifyPhoneOtpRequest(phoneNumber: _phoneNumber, otp: _otp);
      final result = await _otpUsecase.verifyPhoneOtpUsecase(data);
      state = state.setVerifyPhoneOtpState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setVerifyPhoneOtpState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> verifyEmail() async {
    state = state.setVerifyEmailOtpState(State.loading());
    try {
      final data = VerifyEmailOtpRequest(email: _email, otp: _otp);
      final result = await _otpUsecase.verifyEmailOtpUsecase(data);
      state = state.setVerifyEmailOtpState(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setVerifyEmailOtpState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  Future<bool> sendPasswordResetOtp() async {
    state = state.setSendPasswordResetOtpState(State.loading());
    try {
      final isValidEmailOrMessage = validateEmail();
      if (isValidEmailOrMessage == null) {
        await sessionManager.set(SessionManagerKeys.userEmailString, _email);

        final result = await _otpUsecase.sendPasswordResetOtpUsecase(_email);
        state = state.setSendPasswordResetOtpState(State.success(result));
        router.popAndPush(ResetPasswordOtpRoute());
        return true;
      } else {
        NotifyUser.showSnackbar(isValidEmailOrMessage);
        state = state.setSendPasswordResetOtpState(State.error(Exception(isValidEmailOrMessage)));
        return false;
      }
    } on Exception catch (e) {
      state = state.setSendPasswordResetOtpState(State.error(e));
      NotifyUser.showSnackbar(e.toString());
      return false;
    }
  }

  @override
  void dispose() {
    _phoneNumber = '';
    _email = '';
    _otp = '';
    _timer.cancel();
    super.dispose();
  }
}
