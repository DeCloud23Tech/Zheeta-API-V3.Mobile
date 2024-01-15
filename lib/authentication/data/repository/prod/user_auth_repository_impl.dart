import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/exceptions/custom_exception.dart';
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
  UserAuthRepositoryImpl(this._datasource);

  @override
  changePasswordRepo(ChangePasswordRequest data) async {
    final result = await _datasource.changePassword(data);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  @override
  loginOAuthRepo(LoginOAuthRequest data) async {
    final result = await _datasource.loginOAuth(data);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  @override
  Future<LoginUserModel> loginRepo(LoginRequest data) async {
    final result = await _datasource.login(data);
    return result.fold(
      (error) {
        if (error.toString().contains('Data Not Found')) {
          throw new UserNotFoundException('User not found');
        }
        if (error.toString().contains('Email is not verified')) {
          throw new EmailNotVerifiedException('Email is not verified');
        } else {
          throw new Exception(error);
        }
      },
      (value) => LoginUserModel.fromJson(value['data']),
    );
  }

  @override
  registerStaffRepo(RegisterStaffRequest data) async {
    final result = await _datasource.registerStaff(data);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }

  @override
  Future<RegisterUserModel> registerUserRepo(RegisterUserRequest data) async {
    final result = await _datasource.registerUser(data);
    return result.fold(
      (error) => throw new Exception(error),
      (value) => RegisterUserModel.fromJson(value['data']),
    );
  }

  @override
  resetPasswordRepo(ResetPasswordRequest data) async {
    final result = await _datasource.resetPassword(data);
    result.fold(
      (error) => throw Exception(error),
      (value) => value,
    );
  }
}
