import 'package:injectable/injectable.dart';
import 'package:zheeta/core/common/model/login_user_model.dart';
import 'package:zheeta/core/common/model/register_user_model.dart';
import 'package:zheeta/core/common/usecase/usecases.dart';
import 'package:zheeta/core/constants/type_def.dart';
import 'package:zheeta/features/authentication/data/requests/change_password_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_oauth_request.dart';
import 'package:zheeta/features/authentication/data/requests/login_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_staff_request.dart';
import 'package:zheeta/features/authentication/data/requests/register_user_request.dart';
import 'package:zheeta/features/authentication/data/requests/reset_password_request.dart';
import 'package:zheeta/features/authentication/domain/repositories/user_auth_repository.dart';

@prod
@LazySingleton()
class RegisterUser
    extends UsecaseWithParams<RegisterUserModel, RegisterUserRequest> {
  const RegisterUser(this._repo);

  final IUserAuthRepository _repo;

  @override
  ResultFuture<RegisterUserModel> call(RegisterUserRequest params) async =>
      await _repo.registerUserRepo(params);
}

@prod
@LazySingleton()
class LoginUser extends UsecaseWithParams<LoginUserModel, LoginRequest> {
  const LoginUser(this._repo);

  final IUserAuthRepository _repo;

  @override
  ResultFuture<LoginUserModel> call(LoginRequest params) async =>
      await _repo.loginRepo(params);
}

@prod
@LazySingleton()
class RegisterStaff extends UsecaseWithParams<void, RegisterStaffRequest> {
  const RegisterStaff(this._repo);

  final IUserAuthRepository _repo;

  @override
  ResultVoid call(RegisterStaffRequest params) async =>
      await _repo.registerStaffRepo(params);
}

@prod
@LazySingleton()
class ChangePassword extends UsecaseWithParams<void, ChangePasswordRequest> {
  const ChangePassword(this._repo);

  final IUserAuthRepository _repo;

  @override
  ResultVoid call(ChangePasswordRequest params) async =>
      await _repo.changePasswordRepo(params);
}

@prod
@LazySingleton()
class ResetPassword extends UsecaseWithParams<void, ResetPasswordRequest> {
  const ResetPassword(this._repo);

  final IUserAuthRepository _repo;

  @override
  ResultVoid call(ResetPasswordRequest params) async =>
      await _repo.resetPasswordRepo(params);
}

@prod
@LazySingleton()
class LoginOAuth extends UsecaseWithParams<void, LoginOAuthRequest> {
  const LoginOAuth(this._repo);

  final IUserAuthRepository _repo;

  @override
  ResultVoid call(LoginOAuthRequest params) async =>
      await _repo.loginOAuthRepo(params);
}
