import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@Injectable(as: UserOtpDatasource)
class UserOtpDatasourceImpl implements UserOtpDatasource {
  ApiManager _apiManager;

  UserOtpDatasourceImpl(this._apiManager);

  @override
  Future<Either<Error, MappedResponse>> resetPassword(String phoneNumber) async {
    final response = await _apiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message!);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> sendEmailVerifyOtp(String email) async {
    final response = await _apiManager.postHttp('/userauth/send-email-verifyOtp/$email', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message!);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> sendPhoneVerifyOtp(String phoneNumber) async {
    final response = await _apiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message!);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> sendResetPasswordOtp(String phoneNumber) async {
    final response = await _apiManager.postHttp('/userauth/send-phoneno-verifyOtp/$phoneNumber', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message!);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> verifyEmailOtp(VerifyEmailOtpRequest request) async {
    final response = await _apiManager.postHttp('/userauth/verify-email-otp', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message!);
    }
  }

  @override
  Future<Either<Error, MappedResponse>> verifyPhoneOtp(VerifyPhoneOtpRequest request) async {
    final response = await _apiManager.postHttp('/userauth/verify-phone-otp', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(response.message!);
    }
  }
}
