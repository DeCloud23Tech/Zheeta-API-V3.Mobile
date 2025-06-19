import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/authentication/data/datasource/user_otp_datasource.dart';
import 'package:zheeta/features/authentication/data/request/verify_email_otp_request.dart';
import 'package:zheeta/features/authentication/data/request/verify_phone_otp_request.dart';

@prod
@LazySingleton(as: UserOtpDataSource)
class UserOtpDataSourceImpl implements UserOtpDataSource {
  final Api _api;

  UserOtpDataSourceImpl(this._api);

  @override
  Future<void> sendEmailVerifyOtpNew(String email) async {
    var response = await _api.dio.post('/userauth/send-email-verifyOtp/$email',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: null);
    if (response.statusCode == 200) {
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
    if (response.statusCode == 200) {
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
    if (response.statusCode == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
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
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
