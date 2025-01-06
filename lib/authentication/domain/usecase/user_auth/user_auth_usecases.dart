import 'package:injectable/injectable.dart';
import 'package:zheeta/app/common/type_def.dart';
import 'package:zheeta/app/common/usecase/usecases.dart';
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
@LazySingleton()
class RegisterUser
    extends UsecaseWithParams<RegisterUserModel, RegisterUserRequest> {
  const RegisterUser(this._repo);

  final UserAuthRepository _repo;

  @override
  ResultFuture<RegisterUserModel> call(RegisterUserRequest params) async =>
      await _repo.registerUserRepo(params);
}

@prod
@LazySingleton()
class LoginUser extends UsecaseWithParams<LoginUserModel, LoginRequest> {
  const LoginUser(this._repo);

  final UserAuthRepository _repo;

  @override
  ResultFuture<LoginUserModel> call(LoginRequest params) async =>
      await _repo.loginRepo(params);
}

@prod
@LazySingleton()
class RegisterStaff extends UsecaseWithParams<void, RegisterStaffRequest> {
  const RegisterStaff(this._repo);

  final UserAuthRepository _repo;

  @override
  ResultVoid call(RegisterStaffRequest params) async =>
      await _repo.registerStaffRepo(params);
}

@prod
@LazySingleton()
class ChangePassword extends UsecaseWithParams<void, ChangePasswordRequest> {
  const ChangePassword(this._repo);

  final UserAuthRepository _repo;

  @override
  ResultVoid call(ChangePasswordRequest params) async =>
      await _repo.changePasswordRepo(params);
}

@prod
@LazySingleton()
class ResetPassword extends UsecaseWithParams<void, ResetPasswordRequest> {
  const ResetPassword(this._repo);

  final UserAuthRepository _repo;

  @override
  ResultVoid call(ResetPasswordRequest params) async =>
      await _repo.resetPasswordRepo(params);
}

@prod
@LazySingleton()
class LoginOAuth extends UsecaseWithParams<void, LoginOAuthRequest> {
  const LoginOAuth(this._repo);

  final UserAuthRepository _repo;

  @override
  ResultVoid call(LoginOAuthRequest params) async =>
      await _repo.loginOAuthRepo(params);
}
