import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: UserOtpDataSource)
class UserOtpDataSourceImpl implements UserOtpDataSource {
  final ApiManager _apiManager;

  UserOtpDataSourceImpl(this._apiManager);

  @override
  Future<Either<ErrorResponse, MappedResponse>> resetPassword(String phoneNumber) async {
    final response = await _apiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendEmailVerifyOtp(String email) async {
    final response = await _apiManager.postHttp('/userauth/send-email-verifyOtp/$email', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendPhoneVerifyOtp(String phoneNumber) async {
    final response = await _apiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendPasswordResetOtp(String email) async {
    final response = await _apiManager.postHttp('/userauth/send-password-reset-otp-to-email/$email', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> verifyEmailOtp(VerifyEmailOtpRequest request) async {
    final response = await _apiManager.postHttp('/userauth/verify-email-otp', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> verifyPhoneOtp(VerifyPhoneOtpRequest request) async {
    final response = await _apiManager.postHttp('/userauth/verify-phone-otp', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
