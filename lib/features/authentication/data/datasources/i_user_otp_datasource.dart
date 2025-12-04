import 'package:zheeta/features/authentication/data/requests/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';

abstract class IUserOtpDataSource {
  Future<void> sendEmailVerifyOtpNew(String email);
  Future<void> sendPhoneVerifyOtpNew(String phoneNumber);
  Future<void> verifyPhoneOtpNew(VerifyPhoneOtpRequest request);
  Future<void> verifyEmailOtpNew(VerifyEmailOtpRequest request);
  Future<void> sendPasswordResetOtpNew(String email);
}
