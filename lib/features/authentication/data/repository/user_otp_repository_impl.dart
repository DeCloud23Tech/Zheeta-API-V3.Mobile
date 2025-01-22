import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/features/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/features/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/features/authentication/domain/repository/user_otp_repository.dart';

@prod
@LazySingleton(as: UserOtpRepository)
class UserOtpRepositoryImpl implements UserOtpRepository {
  final UserOtpDataSource _datasource;
  UserOtpRepositoryImpl(this._datasource);

  @override
  ResultVoid sendEmailVerifyOtpRepo(String email) async {
    try {
      final result = await _datasource.sendEmailVerifyOtpNew(email);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Ocurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendPhoneVerifyOtpRepo(String phoneNumber) async {
    try {
      final result = await _datasource.sendPhoneVerifyOtpNew(phoneNumber);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Ocurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
      ;
    }
  }

  @override
  ResultVoid verifyPhoneOtpRepo(VerifyPhoneOtpRequest request) async {
    try {
      final result = await _datasource.verifyPhoneOtpNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Ocurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid verifyEmailOtpRepo(VerifyEmailOtpRequest request) async {
    try {
      final result = await _datasource.verifyEmailOtpNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Ocurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid sendPasswordResetOtpRepo(String email) async {
    try {
      final result = await _datasource.sendPasswordResetOtpNew(email);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Ocurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }
}
