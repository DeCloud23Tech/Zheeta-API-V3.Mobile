import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';

abstract class UserOtpRepository {
  sendEmailVerifyOtpRepo(String email);
  sendPhoneVerifyOtpRepo(String phoneNumber);
  verifyPhoneOtpRepo(VerifyPhoneOtpRequest request);
  verifyEmailOtpRepo(VerifyEmailOtpRequest request);
  sendResetPasswordOtpRepo(String phoneNumber);
  resetPasswordRepo(String phoneNumber);
}
