import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';

abstract class UserOtpUseCase {
  sendEmailVerifyOtpUsecase(String email);
  sendPhoneVerifyOtpUsecase(String phoneNumber);
  verifyPhoneOtpUsecase(VerifyPhoneOtpRequest request);
  verifyEmailOtpUsecase(VerifyEmailOtpRequest request);
  sendPasswordResetOtpUsecase(String email);
}
