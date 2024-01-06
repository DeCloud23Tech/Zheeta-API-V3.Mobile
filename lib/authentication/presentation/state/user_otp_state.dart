import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:zheeta/authentication/presentation/state/state.dart';

part 'user_otp_state.freezed.dart';

@freezed
class UserOtpState with _$UserOtpState {
  factory UserOtpState({
    required State resetPasswordState,
    required State sendEmailVerifyOtpState,
    required State sendPhoneVerifyOtpState,
    required State sendResetPasswordOtpState,
    required State verifyEmailOtpState,
    required State verifyPhoneOtpState,
    required int counterState,
  }) = _UserOtpState;

  UserOtpState._();

  UserOtpState setResetPassword(State state) => copyWith(resetPasswordState: state);
  UserOtpState setSendEmailVerifyOtp(State state) => copyWith(sendEmailVerifyOtpState: state);
  UserOtpState setSendPhoneVerifyOtp(State state) => copyWith(sendPhoneVerifyOtpState: state);
  UserOtpState setSendResetPasswordOtp(State state) => copyWith(sendResetPasswordOtpState: state);
  UserOtpState setVerifyEmailOtp(State state) => copyWith(verifyEmailOtpState: state);
  UserOtpState setVerifyPhoneOtp(State state) => copyWith(verifyPhoneOtpState: state);

  UserOtpState setCounter(int value) => copyWith(counterState: value);
}
