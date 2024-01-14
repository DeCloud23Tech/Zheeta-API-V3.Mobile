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

  UserOtpState setResetPasswordState(State state) => copyWith(resetPasswordState: state);
  UserOtpState setSendEmailVerifyOtpState(State state) => copyWith(sendEmailVerifyOtpState: state);
  UserOtpState setSendPhoneVerifyOtpState(State state) => copyWith(sendPhoneVerifyOtpState: state);
  UserOtpState setSendResetPasswordOtpState(State state) => copyWith(sendResetPasswordOtpState: state);
  UserOtpState setVerifyEmailOtpState(State state) => copyWith(verifyEmailOtpState: state);
  UserOtpState setVerifyPhoneOtpState(State state) => copyWith(verifyPhoneOtpState: state);

  UserOtpState setCounter(int value) => copyWith(counterState: value);
}
