import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/core/network/api.dart';
import 'package:zheeta/features/authentication/data/datasources/i_user_auth_datasource.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';

@prod
@LazySingleton(as: IUserAuthDataSource)
class UserAuthDataSourceImpl implements IUserAuthDataSource {
  final Api _api;

  UserAuthDataSourceImpl(this._api);

  @override
  Future<void> changePasswordNew(ChangePasswordRequest request) async {
    var response = await _api.dio.post('/userauth/change-password',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200 && response.data?['statusCode'] == 200) {
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
    var response = await _api.dio.put('/userauth/reset-password',
        options: Options(
          contentType: Headers.jsonContentType,
        ),
        data: jsonEncode(request.toJson()));
    if (response.statusCode == 200 && response.data?['statusCode'] == 200) {
    } else {
      throw DioException.badResponse(
          statusCode: response.data?['statusCode'] ?? 400,
          requestOptions: response.requestOptions,
          response: response);
    }
  }

  @override
  Future<LoginUserModel> refreshToken(RefreshTokenRequest request) async {
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
