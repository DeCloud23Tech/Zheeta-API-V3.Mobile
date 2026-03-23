import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/features/authentication/data/datasources/i_user_otp_datasource.dart';
import 'package:zheeta/features/authentication/data/requests/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';
import 'package:zheeta/features/authentication/domain/repositories/user_otp_repository.dart';

@prod
@LazySingleton(as: IUserOtpRepository)
class UserOtpRepositoryImpl implements IUserOtpRepository {
  final IUserOtpDataSource _datasource;
  UserOtpRepositoryImpl(this._datasource);

  @override
  ResultVoid sendEmailVerifyOtpRepo(String email) async {
    try {
      final result = await _datasource.sendEmailVerifyOtpNew(email);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Occurred";
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
      String errorMessage = "Error Occurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid verifyPhoneOtpRepo(VerifyOtpRequest request) async {
    try {
      final result = await _datasource.verifyPhoneOtpNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Occurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid verifyEmailOtpRepo(VerifyOtpRequest request) async {
    try {
      final result = await _datasource.verifyEmailOtpNew(request);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Occurred";
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
      String errorMessage = "Error Occurred";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }
}
