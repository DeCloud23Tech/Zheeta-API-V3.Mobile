import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/core/error/error.dart';
import 'package:zheeta/core/error/exception.dart';
import 'package:zheeta/core/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/core/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/features/authentication/data/datasources/i_user_auth_datasource.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';
import 'package:zheeta/features/authentication/domain/repositories/user_auth_repository.dart';

@prod
@LazySingleton(as: IUserAuthRepository)
class UserAuthRepositoryImpl implements IUserAuthRepository {
  final IUserAuthDataSource _datasource;
  final IUserStorage userStorage;
  final ITokenStorage tokenStorage;

  UserAuthRepositoryImpl(this._datasource, this.userStorage, this.tokenStorage);

  @override
  ResultVoid changePasswordRepo(ChangePasswordRequest data) async {
    try {
      final result = await _datasource.changePasswordNew(data);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultVoid loginOAuthRepo(LoginOAuthRequest data) async {
    try {
      final result = await _datasource.loginOAuthNew(data);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<LoginUserModel> loginRepo(LoginRequest data) async {
    try {
      final result = await _datasource.loginNew(data);
      await tokenStorage.save(result);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      String errorMessage = "Error Logging In";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      if (ex.response?.data?['data'] != null) {
        String email = ex.response?.data?['data']['email'] ?? "";
        String phoneNumber = ex.response?.data?['data']['phoneNumber'] ?? "";
        return left(EmailVeirifedError(
            message: errorMessage,
            statusCode: ex.response!.statusCode!,
            phoneNumber: phoneNumber,
            email: email));
      }

      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  registerStaffRepo(RegisterStaffRequest data) async {
    try {
      final result = await _datasource.registerStaffNew(data);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<RegisterUserModel> registerUserRepo(
      RegisterUserRequest data) async {
    try {
      final result = await _datasource.registerUserNew(data);
      await userStorage.save(result);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      // Extract the error message from the response
      String errorMessage = "An error occurred while registering.";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }

      // Append validation details if available
      if (ex.response?.data?["data"] is List) {
        errorMessage += "\nDetails: ${ex.response?.data?["data"].join(", ")}";
      }

      return left(ApiError(
        message: errorMessage,
        statusCode: ex.response?.statusCode ?? 400,
      ));
    }
  }

  @override
  ResultVoid resetPasswordRepo(ResetPasswordRequest data) async {
    //final result = await _datasource.resetPassword(data);
    try {
      final result = await _datasource.resetPasswordNew(data);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<LoginUserModel> refreshToken(RefreshTokenRequest data) async {
    try {
      final result = await _datasource.refreshToken(data);
      await tokenStorage.save(result);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(ApiError(
          message: ex.response?.data['message'],
          statusCode: ex.response!.statusCode!));
    }
  }
}
