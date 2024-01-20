import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/api_manager.dart';
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/domain/entity/types.dart';

@prod
@LazySingleton(as: UserAuthDataSource)
class UserAuthDataSourceImpl implements UserAuthDataSource {
  final ApiManager _apiManager;

  UserAuthDataSourceImpl(this._apiManager);

  @override
  Future<Either<ErrorResponse, MappedResponse>> changePassword(ChangePasswordRequest request) async {
    final response = await _apiManager.postHttp('/userauth/change-password', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> login(LoginRequest request) async {
    final response = await _apiManager.postHttp('/userauth/login', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> loginOAuth(LoginOAuthRequest request) async {
    final response = await _apiManager.postHttp('/userauth/register-staff', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> registerStaff(RegisterStaffRequest request) async {
    final response = await _apiManager.postHttp('/userauth/register-staff', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> registerUser(RegisterUserRequest request) async {
    final response = await _apiManager.postHttp('/userauth/register-user', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }

  @override
  Future<Either<ErrorResponse, MappedResponse>> resetPassword(ResetPasswordRequest request) async {
    final response = await _apiManager.putHttp('/userauth/reset-password', request.toJson());
    if (response.success) {
      return Right(response.data);
    } else {
      return Left(
        ErrorResponse(message: response.message, data: response.data),
      );
    }
  }
}
