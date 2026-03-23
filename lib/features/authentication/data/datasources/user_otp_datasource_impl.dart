import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/authentication/data/datasources/i_user_otp_datasource.dart';
import 'package:zheeta/features/authentication/data/requests/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_otp_request.dart';
import 'package:zheeta/features/authentication/data/requests/verify_phone_otp_request.dart';

@prod
@LazySingleton(as: IUserOtpDataSource)
class UserOtpDataSourceImpl implements IUserOtpDataSource {
  final Api _api;

  UserOtpDataSourceImpl(this._api);

  @override
  Future<void> sendEmailVerifyOtpNew(String email) async {
    var response = await _api.dio.post('/userauth/send-email-verifyOtp/$email',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: null);
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> verifyEmailOtpNew(VerifyOtpRequest request) async {
    var response = await _api.dio.post('/userauth/validate-otp',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> verifyPhoneOtpNew(VerifyOtpRequest request) async {
    var response = await _api.dio.post('/userauth/validate-otp',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if ((response.statusCode ?? 0) >= 200 && (response.statusCode ?? 0) < 300) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
