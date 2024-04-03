import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/authentication/data/request/verify_phone_otp_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: UserOtpDataSource)
class UserOtpDataSourceImpl implements UserOtpDataSource {
  final ApiManager _apiManager;
  final Api _api;
  UserOtpDataSourceImpl(this._apiManager, this._api);

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendEmailVerifyOtp(
      String email) async {
    final response = await _apiManager.postHttp(
        '/userauth/send-email-verifyOtp/$email', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendPhoneVerifyOtp(
      String phoneNumber) async {
    final response = await _apiManager.postHttp(
        '/userauth/send-phoneno-verifyOtp/$phoneNumber', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> sendPasswordResetOtp(
      String email) async {
    final response = await _apiManager.postHttp(
        '/userauth/send-password-reset-otp-to-email/$email', null);
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> verifyEmailOtp(
      VerifyEmailOtpRequest request) async {
    final response = await _apiManager.postHttp(
        '/userauth/verify-email-otp', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> verifyPhoneOtp(
      VerifyPhoneOtpRequest request) async {
    final response = await _apiManager.postHttp(
        '/userauth/verify-phone-otp', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> sendEmailVerifyOtpNew(String email) async {
    var response = await _api.dio.post('/userauth/send-email-verifyOtp/$email',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: null);
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> sendPasswordResetOtpNew(String email) async {
    var response =
        await _api.dio.post('/userauth/send-password-reset-otp-to-email/$email',
            options: Options(
              contentType: Headers.jsonContentType,
            ),
            data: null);
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> sendPhoneVerifyOtpNew(String phoneNumber) async {
    var response =
        await _api.dio.post('/userauth/send-phoneno-verifyOtp/$phoneNumber',
            options: Options(
              contentType: Headers.jsonContentType,
            ),
            data: null);
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> verifyEmailOtpNew(VerifyEmailOtpRequest request) async {
    var response = await _api.dio.post('/userauth/verify-email-otp',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }

  @override
  Future<void> verifyPhoneOtpNew(VerifyPhoneOtpRequest request) async {
    var response = await _api.dio.post('/userauth/verify-phone-otp',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
    } else {
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
    }
  }
}
