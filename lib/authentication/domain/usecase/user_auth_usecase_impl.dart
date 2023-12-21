import 'package:injectable/injectable.dart';
import 'package:zheeta/authentication/data/model/register_user_model.dart';
import 'package:zheeta/authentication/data/request/change_password_request.dart';
import 'package:zheeta/authentication/data/request/login_oauth_request.dart';
import 'package:zheeta/authentication/data/request/login_request.dart';
import 'package:zheeta/authentication/data/request/register_staff_request.dart';
import 'package:zheeta/authentication/data/request/register_user_request.dart';
import 'package:zheeta/authentication/data/request/reset_password_request.dart';
import 'package:zheeta/authentication/domain/repository/user_auth_repository.dart';
import 'package:zheeta/authentication/domain/usecase/user_auth_usecase.dart';

@prod
@LazySingleton(as: UserAuthUsecase)
class UserAuthUsecaseImpl implements UserAuthUsecase {
  final UserAuthRepository _repository;
  UserAuthUsecaseImpl(this._repository);

  @override
  changePasswordUsecase(ChangePasswordRequest data) async {
    return await _repository.changePasswordRepo(data);
  }

  @override
  loginOAuthUsecase(LoginOAuthRequest data) async {
    return await _repository.loginOAuthRepo(data);
  }

  @override
  loginUsecase(LoginRequest data) async {
    return await _repository.loginRepo(data);
  }

  @override
  registerStaffUsecase(RegisterStaffRequest data) async {
    return await _repository.registerStaffRepo(data);
  }

  @override
  Future<RegisterUserModel> registerUserUsecase(RegisterUserRequest data) async {
    return await _repository.registerUserRepo(data);
  }

  @override
  resetPasswordUsecase(ResetPasswordRequest data) async {
    return await _repository.resetPasswordRepo(data);
  }
}
