import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/app/api/api_manager_refactored.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart';
import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/refresh_token_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: UserAuthDataSource)
class UserAuthDataSourceImpl implements UserAuthDataSource {
  final ApiManager _apiManager;
  final Api _api;

  UserAuthDataSourceImpl(this._apiManager, this._api);

  @override
  Future<Either<ErrorResponse, MappedResponse>> changePassword(
      ChangePasswordRequest request) async {
    final response = await _apiManager.postHttp(
        '/userauth/change-password', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> login(
      LoginRequest request) async {
    final response =
        await _apiManager.postHttp('/userauth/login', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> loginOAuth(
      LoginOAuthRequest request) async {
    final response =
        await _apiManager.postHttp('/userauth/login/oauth', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> registerStaff(
      RegisterStaffRequest request) async {
    final response = await _apiManager.postHttp(
        '/userauth/register-staff', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> registerUser(
      RegisterUserRequest request) async {
    final response =
        await _apiManager.postHttp('/userauth/register-user', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> resetPassword(
      ResetPasswordRequest request) async {
    final response =
        await _apiManager.putHttp('/userauth/reset-password', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<void> changePasswordNew(ChangePasswordRequest request) async {
    var response = await _api.dio.post('/userauth/change-password',
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
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
      throw ApiException(
          message: response.statusMessage!, statusCode: response.statusCode!);
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
