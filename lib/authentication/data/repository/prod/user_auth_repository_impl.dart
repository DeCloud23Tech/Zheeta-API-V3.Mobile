import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:zheeta/app/api/errors/error.dart';
import 'package:zheeta/app/api/errors/exception.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
import 'package:zheeta/app/common/storage/user_storage/i_user_storage.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/authentication/data/datasource/user_auth_datasource.dart';
import 'package:zheeta/authentication/data/model/login_user_model.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart';

@prod
@LazySingleton(as: UserAuthRepository)
class UserAuthRepositoryImpl implements UserAuthRepository {
  final UserAuthDataSource _datasource;
  final IUserStorage userStorage;
  UserAuthRepositoryImpl(this._datasource, this.userStorage);

  @override
  ResultVoid changePasswordRepo(ChangePasswordRequest data) async {
    try {
      final result = await _datasource.changePasswordNew(data);
      return right(result);
    } on ApiException catch (ex) {
      return left(ApiError(message: ex.message, statusCode: ex.statusCode));
    } on DioException catch (ex) {
      return left(
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }

  @override
  ResultFuture<LoginUserModel> loginRepo(LoginRequest data) async {
    try {
      final result = await _datasource.loginNew(data);
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
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
      String errorMessage = "Error Logging In";
      if (ex.response?.data?["message"] != null) {
        errorMessage = ex.response?.data?["message"];
      }
      return left(ApiError(
          message: errorMessage, statusCode: ex.response!.statusCode!));
    }
    // return result.fold(
    //   (error) {
    //     if (error.data != null) {
    //       String? usernameException;
    //       String? emailException;
    //       String? phoneException;

    //       final data = error.data as List;
    //       for (String e in data) {
    //         if (e.toString().toLowerCase().contains('username')) {
    //           usernameException = e;
    //         } else if (e.toString().toLowerCase().contains('email')) {
    //           emailException = e;
    //         } else if (e.toString().toLowerCase().contains('phone')) {
    //           phoneException = e;
    //         }
    //       }
    //       throw new DuplicateRegisterParamException(
    //         usernameException: usernameException,
    //         emailException: emailException,
    //         phoneException: phoneException,
    //       );
    //     } else {
    //       throw new Exception(error.message);
    //     }
    //   },
    //   (value) => RegisterUserModel.fromJson(value['data']),
    // );
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
          ApiError(message: ex.message!, statusCode: ex.response!.statusCode!));
    }
  }
}
