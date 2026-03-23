import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/authentication/data/requests/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';

abstract class IUserOtpRepository {
  ResultVoid sendEmailVerifyOtpRepo(String email);

  ResultVoid sendPhoneVerifyOtpRepo(String phoneNumber);

  ResultVoid verifyPhoneOtpRepo(VerifyOtpRequest request);

  ResultVoid verifyEmailOtpRepo(VerifyOtpRequest request);

  ResultVoid sendPasswordResetOtpRepo(String email);
}
