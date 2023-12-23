import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:zheeta/app/injection/di.dart';
import 'package:zheeta/app/validation_helper.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/usecase/user_otp_usecase.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';
import 'package:zheeta/authentication/presentation/state/user_otp_state.dart';

final userOtpViewModelProvider = StateNotifierProvider.autoDispose<UserOtpViewModel, UserOtpState>((ref) {
  final otpUsecase = locator<UserOtpUsecase>();
  return UserOtpViewModel(otpUsecase);
});

class UserOtpViewModel extends StateNotifier<UserOtpState> with ValidationHelperMixin {
  final UserOtpUsecase _otpUsecase;
  UserOtpViewModel(this._otpUsecase)
      : super(UserOtpState(
          resetPassword: State.init(),
          sendEmailVerifyOtp: State.init(),
          sendPhoneVerifyOtp: State.init(),
          sendResetPasswordOtp: State.init(),
          verifyEmailOtp: State.init(),
          verifyPhoneOtp: State.init(),
        ));

  String _phoneNumber = '';
  set setPhoneNumber(String value) => _phoneNumber = value;

  String _email = '';
  set setEmail(String value) => _email = value;

  String _otp = '';
  set setOtp(String value) => _otp = value;

  String? validatePhoneNumber() => this.isValidPhoneNumber(_phoneNumber);
  String? validateOtp() => this.isValidInput(_otp);

  Future<bool> sendPhoneVerifyOtp() async {
    state = state.setSendPhoneVerifyOtp(State.loading());
    try {
      final result = await _otpUsecase.sendPhoneVerifyOtpUsecase(_phoneNumber);
      state = state.setSendPhoneVerifyOtp(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setSendPhoneVerifyOtp(State.error(e));
      return false;
    }
  }

  Future<bool> sendEmailVerifyOtp() async {
    state = state.setSendEmailVerifyOtp(State.loading());
    try {
      final result = await _otpUsecase.sendEmailVerifyOtpUsecase(_email);
      state = state.setSendEmailVerifyOtp(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setSendEmailVerifyOtp(State.error(e));
      return false;
    }
  }

  Future<bool> verifyPhoneNumber() async {
    state = state.setVerifyPhoneOtp(State.loading());
    try {
      final data = VerifyPhoneOtpRequest(_phoneNumber, _otp);
      final result = await _otpUsecase.verifyPhoneOtpUsecase(data);
      state = state.setVerifyPhoneOtp(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setVerifyPhoneOtp(State.error(e));
      return false;
    }
  }

  Future<bool> verifyEmail() async {
    state = state.setVerifyEmailOtp(State.loading());
    try {
      final data = VerifyEmailOtpRequest(_email, _otp);
      final result = await _otpUsecase.verifyEmailOtpUsecase(data);
      state = state.setVerifyEmailOtp(State.success(result));
      return true;
    } on Exception catch (e) {
      state = state.setVerifyEmailOtp(State.error(e));
      return false;
    }
  }

  @override
  void dispose() {
    _phoneNumber = '';
    _email = '';
    _otp = '';
    super.dispose();
  }
}
