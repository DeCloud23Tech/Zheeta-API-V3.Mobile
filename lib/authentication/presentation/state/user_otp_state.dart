import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'user_otp_state.freezed.dart';

@freezed
class UserOtpState with _$UserOtpState {
  factory UserOtpState({
    required State resetPassword,
    required State sendEmailVerifyOtp,
    required State sendPhoneVerifyOtp,
    required State sendResetPasswordOtp,
    required State verifyEmailOtp,
    required State verifyPhoneOtp,
  }) = _UserOtpState;

  UserOtpState._();

  setResetPassword(State state) => copyWith(resetPassword: state);
  setSendEmailVerifyOtp(State state) => copyWith(sendEmailVerifyOtp: state);
  setSendPhoneVerifyOtp(State state) => copyWith(sendPhoneVerifyOtp: state);
  setSendResetPasswordOtp(State state) => copyWith(sendResetPasswordOtp: state);
  setVerifyEmailOtp(State state) => copyWith(verifyEmailOtp: state);
  setVerifyPhoneOtp(State state) => copyWith(verifyPhoneOtp: state);
}
