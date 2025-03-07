import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/common/constants/type_def.dart';
import 'package:zheeta/common/errors/error.dart';
import 'package:zheeta/common/errors/exception.dart';
import 'package:zheeta/common/model/login_user_model.dart';
import 'package:zheeta/common/storage/token_storage/i_token_storage.dart';
import 'package:zheeta/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/features/authentication/data/datasource/user_auth_datasource.dart';
import 'package:zheeta/features/authentication/data/model/register_user_model.dart';
import 'package:zheeta/features/authentication/data/request/change_password_request.dart';
import 'package:zheeta/features/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/request/login_request.dart';
import 'package:zheeta/features/authentication/data/request/refresh_token_request.dart';
import 'package:zheeta/features/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/request/register_user_request.dart';
import 'package:zheeta/features/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/features/authentication/domain/repository/user_auth_repository.dart';

@prod
@LazySingleton(as: UserAuthRepository)
class UserAuthRepositoryImpl implements UserAuthRepository {
  final UserAuthDataSource _datasource;
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
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
      return left(
          ApiError(message: ex.response?.data['message'], statusCode: ex.response!.statusCode!));
    }
  }
}
