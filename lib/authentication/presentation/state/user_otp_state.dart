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
    required int counter,
  }) = _UserOtpState;

  UserOtpState._();

  UserOtpState setResetPassword(State state) => copyWith(resetPassword: state);
  UserOtpState setSendEmailVerifyOtp(State state) => copyWith(sendEmailVerifyOtp: state);
  UserOtpState setSendPhoneVerifyOtp(State state) => copyWith(sendPhoneVerifyOtp: state);
  UserOtpState setSendResetPasswordOtp(State state) => copyWith(sendResetPasswordOtp: state);
  UserOtpState setVerifyEmailOtp(State state) => copyWith(verifyEmailOtp: state);
  UserOtpState setVerifyPhoneOtp(State state) => copyWith(verifyPhoneOtp: state);

  UserOtpState setCounter(int value) => copyWith(counter: value);
}
