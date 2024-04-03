import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';

abstract class UserOtpRepository {
  ResultVoid sendEmailVerifyOtpRepo(String email);
  ResultVoid sendPhoneVerifyOtpRepo(String phoneNumber);
  ResultVoid verifyPhoneOtpRepo(VerifyPhoneOtpRequest request);
  ResultVoid verifyEmailOtpRepo(VerifyEmailOtpRequest request);
  ResultVoid sendPasswordResetOtpRepo(String email);
}
