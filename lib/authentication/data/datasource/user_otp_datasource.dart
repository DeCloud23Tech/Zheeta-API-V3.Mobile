import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserOtpDatasource {
  Future<Either<Error, MappedResponse>> sendEmailVerifyOtp(String email);
  Future<Either<Error, MappedResponse>> sendPhoneVerifyOtp(String phoneNumber);
  Future<Either<Error, MappedResponse>> verifyPhoneOtp(VerifyPhoneOtpRequest request);
  Future<Either<Error, MappedResponse>> verifyEmailOtp(VerifyEmailOtpRequest request);
  Future<Either<Error, MappedResponse>> sendResetPasswordOtp(String phoneNumber);
  Future<Either<Error, MappedResponse>> resetPassword(String phoneNumber);
}
