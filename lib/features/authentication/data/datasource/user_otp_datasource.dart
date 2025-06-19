import 'package:zheeta/features/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/request/verify_phone_otp_request.dart';

abstract class UserOtpDataSource {
  Future<void> sendEmailVerifyOtpNew(String email);
  Future<void> sendPhoneVerifyOtpNew(String phoneNumber);
  Future<void> verifyPhoneOtpNew(VerifyPhoneOtpRequest request);
  Future<void> verifyEmailOtpNew(VerifyEmailOtpRequest request);
  Future<void> sendPasswordResetOtpNew(String email);
}
