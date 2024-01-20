import 'package:dartz/dartz.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

abstract class UserOtpDataSource {
  Future<Either<ErrorResponse, MappedResponse>> sendEmailVerifyOtp(String email);
  Future<Either<ErrorResponse, MappedResponse>> sendPhoneVerifyOtp(String phoneNumber);
  Future<Either<ErrorResponse, MappedResponse>> verifyPhoneOtp(VerifyPhoneOtpRequest request);
  Future<Either<ErrorResponse, MappedResponse>> verifyEmailOtp(VerifyEmailOtpRequest request);
  Future<Either<ErrorResponse, MappedResponse>> sendPasswordResetOtp(String email);
  Future<Either<ErrorResponse, MappedResponse>> resetPassword(String phoneNumber);
}
