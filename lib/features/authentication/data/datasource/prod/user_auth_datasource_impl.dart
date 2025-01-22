import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/model/login_user_model.dart';
import 'package:zheeta/common/services/api/api_manager.dart';
import 'package:zheeta/features/authentication/data/datasource/user_auth_datasource.dart';
import 'package:zheeta/features/authentication/data/model/register_user_model.dart';
import 'package:zheeta/features/authentication/data/request/change_password_request.dart';
import 'package:zheeta/features/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/request/login_request.dart';
import 'package:zheeta/features/authentication/data/request/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/request/register_user_request.dart';
import 'package:zheeta/features/authentication/data/request/reset_password_request.dart';

@prod
@LazySingleton(as: UserAuthDataSource)
class UserAuthDataSourceImpl implements UserAuthDataSource {
  final Api _api;

  UserAuthDataSourceImpl(this._api);

  @override
  Future<void> changePasswordNew(ChangePasswordRequest request) async {
    var response = await _api.dio.post('/userauth/change-password',
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
  Future<LoginUserModel> loginNew(LoginRequest request) async {
    var response = await _api.dio.post('/userauth/login',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));

    if (response.statusCode == 200) {
      if (response.data?['statusCode'] == 201) {
        return LoginUserModel.fromJson(response.data['data']);
      } else {
        throw DioException.badResponse(
            statusCode: response.data?['statusCode'] ?? 400,
            requestOptions: response.requestOptions,
            response: response);
      }
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> loginOAuthNew(LoginOAuthRequest request) async {
    var response = await _api.dio.post('/userauth/login/oauth',
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
  Future<void> registerStaffNew(RegisterStaffRequest request) async {
    var response = await _api.dio.post('/userauth/login/oauth',
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
  Future<RegisterUserModel> registerUserNew(RegisterUserRequest request) async {
    var response = await _api.dio.post('/userauth/register-user',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
      if (response.data?['statusCode'] == 201) {
        return RegisterUserModel.fromJson(response.data['data']);
      } else {
        throw DioException.badResponse(
            statusCode: response.data?['statusCode'] ?? 400,
            requestOptions: response.requestOptions,
            response: response);
      }
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<void> resetPasswordNew(ResetPasswordRequest request) async {
    var response = await _api.dio.post('/userauth/reset-password',
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
  Future<LoginUserModel> refreshToken(RefreshTokenRequest request) async {
    print(jsonEncode(request.toJson()));
    var response = await _api.dio.post('/userauth/refresh-token',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200) {
      if (response.data?['statusCode'] == 201) {
        return LoginUserModel.fromJson(response.data['data']);
      } else {
        throw DioException.badResponse(
            statusCode: response.data?['statusCode'] ?? 400,
            requestOptions: response.requestOptions,
            response: response);
      }
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }
}
