import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/repository/user_otp_repository.dart';

@prod
@LazySingleton(as: UserOtpRepository)
class UserOtpRepositoryImpl implements UserOtpRepository {
  final UserOtpDataSource _datasource;
  UserOtpRepositoryImpl(this._datasource);

  ResultVoid sendEmailVerifyOtpRepo(String email) async {
    try {
      final result = await _datasource.sendEmailVerifyOtpNew(email);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  ResultVoid sendPhoneVerifyOtpRepo(String phoneNumber) async {
    //final result = await _datasource.sendPhoneVerifyOtp(phoneNumber);
    try {
      final result = await _datasource.sendPhoneVerifyOtpNew(phoneNumber);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  ResultVoid verifyPhoneOtpRepo(VerifyPhoneOtpRequest request) async {
    try {
      final result = await _datasource.verifyPhoneOtpNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  ResultVoid verifyEmailOtpRepo(VerifyEmailOtpRequest request) async {
    try {
      final result = await _datasource.verifyEmailOtpNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  ResultVoid sendPasswordResetOtpRepo(String email) async {
    try {
      final result = await _datasource.sendPasswordResetOtpNew(email);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
